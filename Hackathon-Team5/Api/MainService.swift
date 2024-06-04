import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case noInternetConnection(message: String = NSLocalizedString("No_internet_connection_error_message", comment: ""))
    case requestTimeout(message: String = NSLocalizedString("Request_timeout_error_message", comment: ""))
    case serverError(message: String = NSLocalizedString("Server_error_message", comment: ""))
    case unknownError(message: String = NSLocalizedString("Unknown_error_message", comment: ""))
}

protocol NetworkErrorProtocol: Error {
    var message: String { get }
}

extension NetworkError: NetworkErrorProtocol {
    var message: String {
        switch self {
        case .noInternetConnection(let message):
            return message
        case .requestTimeout(let message):
            return message
        case .serverError(let message):
            return message
        case .unknownError(let message):
            return message
        }
    }
}

class MainService {
    
    private let queue = DispatchQueue(label: "cc.fuze.networkQueue", qos: .userInitiated)
    
    func sendRequest<T: Codable, E: NetworkErrorProtocol>(
        url: URL,
        method: HTTPMethod,
        headers: [String: String]? = nil,
        body: Data? = nil,
        timeoutInterval: TimeInterval = 30,
        completion: @escaping (Result<T, E>) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.timeoutInterval = timeoutInterval
        
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        queue.async {
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    if let err = error {
                        if let urlError = err as? URLError {
                            switch urlError.code {
                            case .notConnectedToInternet:
                                completion(.failure(NetworkError.noInternetConnection() as! E))
                            case .timedOut:
                                completion(.failure(NetworkError.requestTimeout() as! E))
                            default:
                                completion(.failure(NetworkError.unknownError() as! E))
                            }
                        } else {
                            completion(.failure(NetworkError.unknownError(message: err.localizedDescription) as! E))
                        }
                        return
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(.failure(NetworkError.unknownError() as! E))
                        return
                    }
                                        
                    let statusCode = httpResponse.statusCode
                    switch statusCode {
                    case 200..<300:
                        guard let data = data else {
                            completion(.failure(NetworkError.unknownError() as! E))
                            return
                        }
                        
                        do {
                            let decodedObject = try JSONDecoder().decode(T.self, from: data)
                            completion(.success(decodedObject))
                        } catch {
                            completion(.failure(NetworkError.unknownError() as! E))
                        }
                        
                    default:
                        completion(.failure(NetworkError.serverError() as! E))
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func get<T: Codable, E: NetworkErrorProtocol>(url: URL, headers: [String: String]? = nil, completion: @escaping (Result<T, E>) -> Void) {
        sendRequest(url: url, method: .get, headers: headers, completion: completion)
    }
    
    func post<T: Codable, E: NetworkErrorProtocol>(url: URL, headers: [String: String]? = nil, body: Data, completion: @escaping (Result<T, E>) -> Void) {
        sendRequest(url: url, method: .post, headers: headers, body: body, completion: completion)
    }
    
    func put<T: Codable, E: NetworkErrorProtocol>(url: URL, headers: [String: String]? = nil, body: Data, completion: @escaping (Result<T, E>) -> Void) {
        sendRequest(url: url, method: .put, headers: headers, body: body, completion: completion)
    }
    
    func delete<T: Codable, E: NetworkErrorProtocol>(url: URL, headers: [String: String]? = nil, completion: @escaping (Result<T, E>) -> Void) {
        sendRequest(url: url, method: .delete, headers: headers, completion: completion)
    }
}

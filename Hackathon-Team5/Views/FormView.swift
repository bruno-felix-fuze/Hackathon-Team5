import SwiftUI

struct FormView: View {
    @State private var name = ""
    @State private var age = ""
    @State private var selectedTheme = ""
    @State private var isThemePickerVisible = false
    @State private var selectedPlace = ""
    @State private var isPlacePickerVisible = false

    private var themes = ["Aventura", "Conto de fadas"]
    private var places = ["Floresta", "Castelo"]

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    childForm

                    Spacer()
                        .frame(height: 30)

                    themeForm

                    Spacer()
                        .frame(height: 30)

                    placeForm

                    Spacer()
                        .frame(height: 30)

                    tags
                }
            }
            .padding(.all, 20)

            NavigationLink(destination: StoryTypeView()) {
                Text("Confirmar")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(25)
                    .padding(.all, 20)
            }
        }
        .navigationTitle("História")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var childForm: some View {
        Group {
            Text("Digite o nome do seu filho(a) caso queira que ele seja o protagonista da história")
                .font(.caption)
                .foregroundColor(.gray)

            TextField(" ", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Spacer()
                .frame(height: 15)

            Text("Idade *")
                .font(.caption)
                .foregroundColor(.gray)
            TextField(" ", text: $age)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }

    private var themeForm: some View {
        Group {
            Text("Escolha um tema *")
                .font(.caption)
                .foregroundColor(.gray)

            VStack(alignment: .leading) {
                Button(action: {
                    withAnimation {
                        isThemePickerVisible.toggle()
                    }
                }) {
                    HStack {
                        Text(selectedTheme.isEmpty ? "" : selectedTheme)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .rotationEffect(Angle(degrees: isThemePickerVisible ? 180 : 0))
                    }
                }
                .padding()
                .frame(height: 35)
                .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.2), lineWidth: 1))

                if isThemePickerVisible {
                    Picker("", selection: $selectedTheme) {
                        ForEach(themes, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                }
            }
            .animation(.default)
            .transition(.opacity)
        }
    }

    private var placeForm: some View {
        Group {
            Text("Escolha um local onde se passará a história *")
                .font(.caption)
                .foregroundColor(.gray)

            VStack(alignment: .leading) {
                Button(action: {
                    withAnimation {
                        isPlacePickerVisible.toggle()
                    }
                }) {
                    HStack {
                        Text(selectedPlace.isEmpty ? "" : selectedPlace)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .rotationEffect(Angle(degrees: isPlacePickerVisible ? 180 : 0))
                    }
                }
                .padding()
                .frame(height: 35)
                .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.2), lineWidth: 1))

                if isPlacePickerVisible {
                    Picker("", selection: $selectedPlace) {
                        ForEach(places, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .labelsHidden()
                }
            }
            .animation(.default)
            .transition(.opacity)
        }
    }

    private var tags: some View {
        Group {
            Text("Complemente sua história selecionando elementos que devem ser incluídos")
                .font(.caption)
                .foregroundColor(.gray)

            Spacer()
                .frame(height: 20)

            SelectableTagsView()
        }
    }
}

#Preview {
    FormView()
}

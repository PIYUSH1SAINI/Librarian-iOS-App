import SwiftUI
import PhotosUI

struct AddNewBookView: View {
    @State private var bookName: String = ""
    @State private var authorName: String = ""
    @State private var genre: String = "Select Genre"
    @State private var aisle: String = "Select Aisle"
    @State private var isbn: String = ""
    @State private var bookDescription: String = ""
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    let genres = ["Adventure Stories", "Classics", "Crime", "Fairy tales,fables,and folk tales", "Science Fiction", "Fantasy", "Biography", "History", "Horror", "Humour and satire", "Literary fiction", "Mystery", "Poetry", "Plays", "Romance", "Short stories", "Thrillers", "War", "Women's fiction", "Young adult", "Autobiography and memoir", "Essays", "Non-fiction novel", "self-help"]
    let aisles = ["A1", "A2", "B1", "B2", "C1", "C2"]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: {
                        showImagePicker = true
                    }) {
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 1, dash: [5]))
                                )
                        } else {
                            ZStack {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 150, height: 240, alignment: .bottom)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, style: StrokeStyle(lineWidth: 1, dash: [5]))
                                    )
                                Image(systemName: "plus")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(selectedImage: $selectedImage)
                    }
                }
                
                Section {
                    TextField("Book Name", text: $bookName)
                    TextField("Author's Name", text: $authorName)
                }
                Section {
                    Picker("Genres", selection: $genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    Picker("Aisle", selection: $aisle) {
                        ForEach(aisles, id: \.self) { aisle in
                            Text(aisle)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    TextField("ISBN", text: $isbn)
                }
                Section {
                    TextField("Book Description", text: $bookDescription)
                }
                .padding(.vertical, 50)
                
            }
            .navigationBarTitle("New Book", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel", action: {
                // Handle cancel action
                presentationMode.wrappedValue.dismiss()
            }), trailing: Button("Add", action: {
                // Handle add action
                presentationMode.wrappedValue.dismiss()
            }))
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            if let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { (image, error) in
                    DispatchQueue.main.async {
                        if let image = image as? UIImage {
                            self.parent.selectedImage = image
                        }
                    }
                }
            }
        }
    }
}

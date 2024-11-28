import SwiftUI

let bookCovers = [
    BookCover(bookTitle: "book 1", imageName: "bookCover1"),
    BookCover(bookTitle: "book 2", imageName: "bookCover2"),
    BookCover(bookTitle: "book 3", imageName: "bookCover3"),
    BookCover(bookTitle: "book 4", imageName: "bookCover4"),
    BookCover(bookTitle: "book 5", imageName: "bookCover5")
]

struct UserDetailView: View {
    var user: User

    @State private var isOpen = false
    
    var body: some View {
        VStack {
            List{
                Section{
                    HStack{
                        Text("Joining date")
                        Spacer()
                        Text("20 May 2023")
                            .foregroundColor(.secondary)
                    }
                    HStack{
                        Text("Membership expires")
                        Spacer()
                        Text("20 July 2023")
                            .foregroundColor(.secondary)
                    }
                }header: {
                    Text("Membership info")
                }
                Section {
                    DisclosureGroup("My books", isExpanded: $isOpen) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(bookCovers, id: \.imageName) { cover in
                                    VStack{
                                        Image(cover.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100)
                                        Text(cover.bookTitle)
                                            .foregroundColor(.primary)
                                            .font(.headline)
                                            .padding(.leading, 8)
                                    }
                                }
                            }
                        }
                    }
                } header: {
                    Text("Books issued")
                }
                Section{
                    HStack{
                        Text("Outstanding dues")
                        Spacer()
                        Text("Rs.250")
                            .foregroundColor(.red)
                    }
                }header: {
                    Text("Fines")
                }
            }
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

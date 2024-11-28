import SwiftUI


let sampleBooks = [
    TopPickBook(id: 1, title: "The Harry Potter", author: "J.K. Rowling", imageName: "1"),
    TopPickBook(id: 2, title: "The Lord of the Rings", author: "J.R.R. Tolkien", imageName: "2"),
    TopPickBook(id: 3, title: "Pride and Prejudice", author: "Jane Austen", imageName: "3"),
    TopPickBook(id: 4, title: "The Great Gatsby", author: "F. Scott Fitzgerald", imageName: "4"),
    TopPickBook(id: 5, title: "To Kill a Mockingbird", author: "Harper Lee", imageName: "5"),
    TopPickBook(id: 6, title: "Jane Eyre", author: "Charlotte Brontë", imageName: "6"),
]

struct LibrarianHomeView: View {
    
    @State private var showAddNewBookView: Bool = false
    
    @State private var bookImages: [UIImage] = Array(repeating: UIImage(named: "bookCover")!, count: 10)
    
    let books: [TopPickBook] = sampleBooks
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    NavigationLink(destination: CurrentStock()){
                        HStack(alignment: .center) {
                            Text("Current Stock")
                                .padding()
                                .font(.title2)
                                .foregroundColor(.black)
                            Image("book1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 150)
                                .shadow(radius: 10)
                                .padding([.top, .bottom], 30)
                        }
                    }
                    .background(Color(red: 228 / 255, green: 226 / 255, blue: 217 / 255))
                    .cornerRadius(10)
                    
//                    VStack(alignment: .leading) {
//                        Text("Top picks")
//                            .font(.title2)
//                            .fontWeight(.medium)
//                        
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack(spacing: 50) {
//                                ForEach(0..<bookImages.count, id: \.self) { index in
//                                    VStack {
//                                        ZStack(alignment: .topLeading) {
//                                            Image(uiImage: bookImages[index])
//                                                .resizable()
//                                                .scaledToFit()
//                                                .frame(width: 120, height: 200)
//                                            
//                                            Text("\(index + 1)")
//                                                .font(.custom("TimesNewRoman", size: 100))
//                                                .bold()
//                                                .foregroundColor(.accentColor)
//                                                .offset(x: -70, y: -40)
//                                                .padding()
//                                        }
//                                    }
//                                    .padding([.leading], 5)
//                                }
//                            }
//                            .padding([.leading], 50)
//                            .padding([.top, .bottom], 10)
//                        }
//                    }
//                    .padding()
                    
                    
                    
                    VStack(alignment: .leading){
                        Text("Top pick's")
                            .font(.title).bold()
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(books) { book in
                                    HStack(alignment: .top){
                                        Text("\(book.id)")
                                            .font(.system(size: 130))
                                            .foregroundColor(.primary)
                                            .padding()
                                            .offset(x: 10, y: -40)
                                        box(bcImage: Image("\(book.imageName)"), title: "\(book.title)", author: "\(book.author)")
                                    }
                                }
                                .padding(.trailing)
                            }
                            .padding(.trailing)
                        }
                    }
                    
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("Top-6 categories")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        VStack(alignment: .center) {
                            HStack {
                                CategoryTile(title: "Fantasy")
                                CategoryTile(title: "Science")
                            }
                            HStack {
                                CategoryTile(title: "Romance")
                                CategoryTile(title: "Kids Story")
                            }
                            HStack {
                                CategoryTile(title: "Mystery")
                                CategoryTile(title: "Horror")
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Library")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddNewBookView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddNewBookView) {
                AddNewBookView()
            }
        }
    }
}

struct CategoryTile: View {
    var title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 228 / 255, green: 226 / 255, blue: 217 / 255))
                .frame(width: 150, height: 100)
            Text(title)
                .font(.title3)
                .foregroundColor(.black)
        }
        .padding([.trailing], 15)
    }
}

#Preview {
    LibrarianHomeView()
}



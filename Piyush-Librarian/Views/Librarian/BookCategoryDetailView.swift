import SwiftUI

struct BookCategoryDetailView: View {
    let category: BookCategory

    var body: some View {
        List {
            ForEach(category.books) { book in
                HStack {
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .font(.headline)
                        Text(book.author)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text("\(book.count)")
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationBarTitle(category.name)
        .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always))
    }
}

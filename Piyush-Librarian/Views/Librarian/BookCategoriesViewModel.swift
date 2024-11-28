import SwiftUI
import Combine

class BookCategoriesViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var categories: [BookCategory] = [
        BookCategory(name: "Classics", count: 1, books: [Book(title: "Pride and Prejudice", author: "Jane Austen", count: 10, genre: "Fantasy", aisle: "A1", isbn: "123", description: "no idea, maybe good i guess")]),
        BookCategory(name: "Crime", count: 1, books: [Book(title: "The perfect murder", author: "RW John", count: 10, genre: "Crime", aisle: "B2", isbn: "128", description: "no idea, maybe good i guess")]),
        BookCategory(name: "Fantasy", count: 1, books: [Book(title: "Fifty shades of gray", author: "Mathew doe", count: 10, genre: "Romance", aisle: "C1", isbn: "143", description: "no idea, maybe good i guess")])
    ]

    var filteredCategories: [BookCategory] {
        if searchText.isEmpty {
            return categories
        } else {
            return categories.filter { $0.name.contains(searchText) }
        }
    }

    func addCategory(name: String, count: Int) {
        let newCategory = BookCategory(name: name, count: count, books: [])
        categories.append(newCategory)
        self.objectWillChange.send()
    }
}


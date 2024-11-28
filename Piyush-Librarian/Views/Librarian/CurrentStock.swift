import SwiftUI

struct CurrentStock: View {
    @StateObject private var viewModel = BookCategoriesViewModel()
    @State private var isShowingAlert = false
    @State private var newCategoryName = ""

    var body: some View {
        List {
            ForEach(viewModel.filteredCategories) { category in
                NavigationLink(destination: BookCategoryDetailView(category: category)) {
                    HStack {
                        Text(category.name)
                        Spacer()
                        Text("\(category.count)")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle("Current Stock")
        .navigationBarItems(trailing: Button(action: {
            isShowingAlert = true
        }) {
            Image(systemName: "plus")
        })
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .alert("Add new genre", isPresented: $isShowingAlert, actions: {
            TextField("Input text", text: $newCategoryName)
            Button("Add") {
                if !newCategoryName.isEmpty {
                    viewModel.addCategory(name: newCategoryName, count: 0)
                    newCategoryName = ""
                }
            }
            Button("Cancel", role: .cancel) {
                newCategoryName = ""
            }
        }, message: {
            Text("A message should be a short, complete sentence.")
        })
    }
}
struct FictionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentStock()
    }
}


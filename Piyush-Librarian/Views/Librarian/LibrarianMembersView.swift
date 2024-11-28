import SwiftUI

struct LibrarianMembersView: View {
    
    @State private var isOpen = false
    @State private var searchText = ""
    @State private var users: [User] = [
        User(name: "Rajit chaudhary"),
        User(name: "Piyush"),
        User(name: "Sai"),
        User(name: "Naman")
    ]
    
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
            NavigationView {
                List(filteredUsers) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        Text(user.name)
                    }
                }
                .navigationTitle("Members")
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            }
        }
}

#Preview {
    LibrarianMembersView()
}

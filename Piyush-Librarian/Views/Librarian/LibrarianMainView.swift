//
//  LibrarianMainView.swift
//  Piyush-Librarian
//
//  Created by Piyush saini on 31/05/24.
//

import SwiftUI

struct LibrarianMainView: View {
    var body: some View {
        TabView{
            LibrarianHomeView().tabItem {
                Label("Library", systemImage: "books.vertical.fill")
            }
            RequestView().tabItem {
                Label("Requests", systemImage: "tray.and.arrow.down.fill")
            }
            LibrarianMembersView().tabItem {
                Label("Members", systemImage: "person.2.fill")
            }
            LibrarianProfile().tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    LibrarianMainView()
}

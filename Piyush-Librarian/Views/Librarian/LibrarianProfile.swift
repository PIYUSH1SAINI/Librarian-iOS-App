//
//  LibrarianProfile.swift
//  Piyush-Librarian
//
//  Created by Sai Nirmit on 31/05/24.
//
import SwiftUI

struct LibrarianProfile: View {
    @State private var selectedLibrary = "Mysore DC"
    @State private var showLibrarySelection = false
    @State private var issuedBooks: [String] = ["Harry Potter", "Science", "Maths"]
    
    var body: some View {
        NavigationView {
            List {
                VStack() {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    
                    Text("Devify")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Devify00@gmail.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                Section(header: Text("Personal Information")) {
                    HStack {
                        Text("Phone:")
                            .font(.subheadline)
                        Spacer()
                        Text("+123 456 7890")
                            .font(.subheadline)
                    }
                    HStack {
                        Text("Library:")
                            .font(.subheadline)
                        Spacer()
                        Text(selectedLibrary)
                            .font(.subheadline)
                    }
                }
                Section(header: Text("Admin Contact")) {
                    HStack {
                        Text("Email:")
                            .font(.subheadline)
                        
                        Spacer()
                        Text("xyz@gmail.com")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Phone:")
                            .font(.subheadline)
                        Spacer()
                        Text("+91 9876543210")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Profile")
            }
        }
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibrarianProfile()
    }
}


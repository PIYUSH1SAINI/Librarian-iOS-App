//
//  LibrarySelectionView.swift
//  Piyush-Librarian
//
//  Created by Sai Nirmit on 31/05/24.
//
import SwiftUI

struct LibrarySelectionView: View {
    @Binding var selectedLibrary: String
    @Environment(\.presentationMode) var presentationMode
    
    let libraries = ["Infosys Mysore DC", "Infosys Bengaluru DC", "Chandigarh Govt. LIbrary"]
    
    var body: some View {
        VStack {
            Text("Select Library")
                .font(.headline)
                .padding(.top)
            Picker("Library", selection: $selectedLibrary) {
                ForEach(libraries, id: \.self) { library in
                    Text(library).tag(library)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding(.horizontal)
            
            Button("Done") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding(.top)
        }
        .padding()
    }
}

import SwiftUI

struct RequestView: View {
    @State private var selectedIndex = 0
    @State private var books: [ReservedBook] = [
        ReservedBook(name: "Sainirmit", bookName: "Book 1", date: "25 May 2024"),
        ReservedBook(name: "Piyush", bookName: "Book 2", date: "26 May 2024"),
        ReservedBook(name: "Gautam", bookName: "Book 3", date: "27 May 2024")
    ]
    
    @State private var renewMemberships: [RenewMembership] = [
        RenewMembership(name: "Sainirmit", date: "25 May 2024"),
        RenewMembership(name: "Piyush", date: "26 May 2024"),
        RenewMembership(name: "Gautam", date: "27 May 2024")
    ]
    
    @State private var ReturnBooks: [ReturnBook] = [
        ReturnBook(name: "Sainirmit", bookName: "Book 1", date: "25 May 2024"),
        ReturnBook(name: "Piyush", bookName: "Book 2", date: "26 May 2024"),
        ReturnBook(name: "Gautam", bookName: "Book 3", date: "27 May 2024")
    ]

    var body: some View {
        NavigationView{
            VStack {
                Picker("Options", selection: $selectedIndex) {
                    Text("Reservation").tag(0)
                    Text("Renew").tag(1)
                    Text("Return").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .labelsHidden()
                
                if selectedIndex == 0 {
                    List{
                        ForEach(books) { ReservedBook in
                            HStack{
                                VStack(alignment: .leading){
                                    Text(ReservedBook.name)
                                    Text(ReservedBook.bookName)
                                        .foregroundColor(.secondary)
                                        .font(.footnote)
                                }
                                Spacer()
                                Text(ReservedBook.date)
                                    .foregroundColor(.secondary)
                                    .font(.footnote)
                            }
                        }
                    }
                } else if selectedIndex == 1 {
                    List{
                        ForEach(books) { RenewMembership in
                            HStack{
                                VStack(alignment: .leading){
                                    Text(RenewMembership.name)
                                }
                                Spacer()
                                Text(RenewMembership.date)
                                    .foregroundColor(.secondary)
                                    .font(.footnote)
                            }
                        }
                    }
                } else {
                    List{
                        ForEach(books) { ReturnBook in
                            HStack{
                                VStack(alignment: .leading){
                                    Text(ReturnBook.name)
                                    Text(ReturnBook.bookName)
                                        .foregroundColor(.secondary)
                                        .font(.footnote)
                                }
                                Spacer()
                                Text(ReturnBook.date)
                                    .foregroundColor(.red)
                                    .font(.footnote)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Requests")
        }
    }
}

#Preview{
    RequestView()
}

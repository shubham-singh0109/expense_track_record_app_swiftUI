//
//  ContentView.swift
//  Expense_Tracker
//
//  Created by Jisu Singh on 2/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // MARK: Title
                        Text("Jisu Singh")
                            .font(.title2)
                            .bold()
                        //MARK: Transaction List
                        RecentTransactionList()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                .background(Color.Background)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    // MARK: Notification Icon
                    ToolbarItem {
                        Image(systemName: "bell.badge")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.icon, .primary)
                    }
                }
            }
            .navigationViewStyle(.stack)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            ContentView()
        }
        .environmentObject(transactionListVM)
    }
}

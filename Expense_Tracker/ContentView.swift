//
//  ContentView.swift
//  Expense_Tracker
//
//  Created by Jisu Singh on 2/28/25.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {

            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // MARK: Title
                        Text("Jisu Singh")
                            .font(.title2)
                            .bold()
                        
                        //MARK: Line Chart
                        let data = transactionListVM.accumulateTransactions()
                        
                        if !data.isEmpty {
                            let totalexpenses = data.last?.1 ?? 0
                            CardView {
                                VStack(alignment: .leading) {
                                    ChartLabel(totalexpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                
                                LineChart()
                            }
                                .background(Color.systemBackground)
                            }
                            .data(demoData)
                            .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                            .frame(height: 300)
                        }
                        
                        
                        
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
            .accentColor(.primary)
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

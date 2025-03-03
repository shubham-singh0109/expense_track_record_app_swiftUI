//
//  Expense_TrackerApp.swift
//  Expense_Tracker
//
//  Created by Jisu Singh on 2/28/25.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}

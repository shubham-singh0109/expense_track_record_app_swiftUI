//
//  PreviewData.swift
//  Expense_Tracker
//
//  Created by Jisu Singh on 2/28/25.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1,
                                         date: "02/28/2022",
                                         institution: "UMass",
                                         account: "Visa",
                                         merchant: "Apple",
                                         amount: 11.49,
                                         type: "debit",
                                         categoryId: 801,
                                         category: "Software",
                                         isPending: false,
                                         isTransfer: false,
                                         isExpense: true,
                                         isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count:10)

//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Nick Semin on 04.03.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}



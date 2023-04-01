//
//  ExpenseStore.swift
//  expense-tracker-app
//
//  Created by Toby Brown on 01/04/2023.
//

import Foundation
import CoreData

class Expense: NSManagedObject, Identifiable {
    @NSManaged var id: UUID
    @NSManaged var amount: NSDecimalNumber
    @NSManaged var date: Date?
    @NSManaged var category: String?
    
    convenience init(amount: NSDecimalNumber, date: Date?, category: String?, context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = UUID()
        self.amount = amount
        self.date = date
        self.category = category
    }
}

class ExpenseStore: ObservableObject {
    let container: NSPersistentContainer
    @Published var expenses = [Expense]()
    
    init() {
        container = NSPersistentContainer(name: "ExpenseTracker")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data: \(error.localizedDescription)")
            } else {
                print("Core Data loaded successfully")
            }
        }
        fetchExpenses()
    }
    func fetchExpenses() {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        do {
            expenses = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching expenses: \(error.localizedDescription)")
        }
    }

    func addExpense(amount: Double, date: Date, category: String) {
        let newExpense = Expense(context: container.viewContext)
        newExpense.amount = NSDecimalNumber(decimal: Decimal(amount))
        newExpense.date = date
        newExpense.category = category
        saveContext()
        fetchExpenses()
    }
    
    func saveContext() {
        do {
            try container.viewContext.save()
            
        } catch let error {
            print("Error saving context: \(error.localizedDescription)")
        }
    }
}

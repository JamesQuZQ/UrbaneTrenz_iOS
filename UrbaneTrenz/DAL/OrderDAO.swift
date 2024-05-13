//
//  OrderDAO.swift
//  UrbaneTrenz
//

import Foundation

class OrderDAO {
    private static let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    private static let fileURL = URL(fileURLWithPath:"order",relativeTo: directoryURL).appendingPathExtension("txt")
    
    /// Creates order file if it doesn't exist
    static func createOrderFile() {
        let fileManager = FileManager.default
        if !(fileManager.fileExists(atPath: fileURL.path)) {
            fileManager.createFile(atPath: fileURL.path, contents: Data("[]".utf8))
            print("Creating orders file")
        }
    }
    
    /// Writes array of order items to file
    static func writeToOrder(order : [OrderItem]) {
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(order) {
            do {
                try jsonData.write(to: fileURL)
            } catch {
                print("Write Error = \(error.localizedDescription)")
            }
        }
    }
    
    /// Reads and returns cart items from file
    static func readFromOrder() -> [OrderItem]{
        do {
            let data = try String(contentsOf: fileURL)
            let decoder = JSONDecoder()
            if let order = try? decoder.decode([OrderItem].self,from: data.data(using:.utf8)!) {
                return order
            }
        } catch {
            print("Read Error = \(error.localizedDescription)")
        }
        return []
    }
    
    /// Adds order item to file
    static func addOrder(orderItem : OrderItem) {
        var order = readFromOrder()
        order.append(orderItem)
        writeToOrder(order: order)
    }
    
}

//
//  OrderDAO.swift
//  UrbaneTrenz
//

import Foundation

class OrderDAO {
    private static let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    private static let fileURL = URL(fileURLWithPath:"cart",relativeTo: directoryURL).appendingPathExtension("txt")
    
    static func createOrderFile() {
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: fileURL.path) {
            fileManager.createFile(atPath: fileURL.path, contents: Data("[]".utf8))
        }
    }
    
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
    
    static func addOrder(orderItem : OrderItem) {
        var order = readFromOrder()
        order.append(orderItem)
        writeToOrder(order: order)
    }
    
}

//
//  ItemData.swift
//  SQLiteIntegrationDriver
//
//  Created by Bret Williams on 4/9/20.
//  Copyright © 2020 Bret Williams. All rights reserved.
//

import Foundation

class ItemData {
    
    
    func getAllItems() -> [Item] {
        
        var items = [Item]()
        let getItemSql: String = "SELECT * FROM Item;"
        
        let sqlHelper = SQLHelper(databasePath: Globals.SharedInstance.databaseUrl)
        let result = sqlHelper.select(sqlCommand: getItemSql)
        items = mapResultToEntity(dataMatrix: result)
        
        return items
        
    }
    
    func mapResultToEntity(dataMatrix result: [[String]]) -> [Item] {
        
        var items = [Item]()
        
        for i in 0..<result.count {
            
            let item = Item()
            
            item.id = Int(result[i][0])!
            item.name = result[i][6]
            
            items.append(item)
        }
        
        
        return items
        
    }
    
    func printItems(itemList items: [Item]) {
        
        
        
    }
    
    
    func printTestMatrix(dataMatrix result: [[String]]) {
        
        for i in 0..<result.count {
            var line = ""
            for j in 0..<result[i].count {
                line += result[i][j]
                line += " "
            }
            print(line)
        }
        
    }
    
}

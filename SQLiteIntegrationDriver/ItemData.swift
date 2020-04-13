//
//  ItemData.swift
//  SQLiteIntegrationDriver
//
//  Created by Bret Williams on 4/9/20.
//  Copyright © 2020 Bret Williams. All rights reserved.
//

import Foundation

class ItemData {
    
    let insertItemSql : String = "INSERT INTO item (itemid, characterClass, itemtype, itemtypeid,  mincharges, maxcharges, name) VALUES (%d,%d,%d,%d,%d,%d,'%@');"
    
    func getAllItems() -> [Item] {
        
        var items = [Item]()
        let getItemSql: String = "SELECT * FROM Item;"
        
        let sqlHelper = SQLHelper(databasePath: Globals.SharedInstance.databaseUrl)
        let result = sqlHelper.select(sqlCommand: getItemSql)
        items = mapResultToEntity(dataMatrix: result)
        
        //test code
        printItems(itemList: items)
        //printTestMatrix(dataMatrix: result)
        
        return items
        
    }
    
    func addItem(itemToAdd item: Item) {
        
        let sqlHelper = SQLHelper(databasePath: Globals.SharedInstance.databaseUrl)
        let command = String(format: insertItemSql, item.id, 0, 0, 0, 0, 0, item.name)
        let success = sqlHelper.nonQuery(sqlCommand: command)
        
        if !success {
            print ("Could not insert new item")
        }
        
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
        
        for i in 0..<items.count {
            
            print("Item \(i) id=\(items[i].id), name=\(items[i].name)")
            
        }
        
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

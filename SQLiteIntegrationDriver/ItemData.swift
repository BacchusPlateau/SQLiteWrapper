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
        
        let items = [Item]()
        let getItemSql: String = "SELECT * FROM Item;"
        
        let sqlHelper = SQLHelper(databasePath: Globals.SharedInstance.databaseUrl)
        sqlHelper.select(sqlCommand: getItemSql)
        
        return items
        
    }
    
}

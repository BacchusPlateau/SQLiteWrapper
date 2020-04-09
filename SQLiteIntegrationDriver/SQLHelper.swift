//
//  SQLHelper.swift
//  SQLiteIntegrationDriver
//
//  Created by Bret Williams on 4/9/20.
//  Copyright © 2020 Bret Williams. All rights reserved.
//

import Foundation
import SQLite3

class SQLHelper {
    
    var databasePath: URL
    
    init(databasePath path: URL) {
        
        databasePath = path
        
    }
    
    func openDatabase() -> OpaquePointer? {
        
        var db: OpaquePointer? = nil
        if sqlite3_open(databasePath.absoluteString, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(databasePath)")
        } else {
            print("Unable to open database.")
        }
        return db
    }
    
    func select(sqlCommand cmd: String) {
        
        if let db = openDatabase() {
            
            var queryStatement: OpaquePointer? = nil
            
            if sqlite3_prepare_v2(db, cmd, -1, &queryStatement, nil) == SQLITE_OK {
                
                while (sqlite3_step(queryStatement) == SQLITE_ROW) {
                    let id = sqlite3_column_int(queryStatement, 0)
                    //let queryResultCol1 = sqlite3_column_text(queryStatement, 1)
                    //let name = String(cString: queryResultCol1!)
                    print("Query Result:")
                    print("\(id)")
                }
                
            } else {
                print("SELECT statement could not be prepared")
            }
            
            sqlite3_finalize(queryStatement)
            sqlite3_close(db)
            
        }
    }
    
    
    
    
}

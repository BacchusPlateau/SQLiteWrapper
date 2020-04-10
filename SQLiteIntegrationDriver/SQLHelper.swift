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
    
    func select(sqlCommand cmd: String) -> [[String]] {
        
        var valueMatrix = [[String]]()
        
        if let db = openDatabase() {
            
            var queryStatement: OpaquePointer? = nil
            
            if sqlite3_prepare_v2(db, cmd, -1, &queryStatement, nil) == SQLITE_OK {
                
                while (sqlite3_step(queryStatement) == SQLITE_ROW) {
                   
                    let numberOfColumns = sqlite3_column_count(queryStatement)
                    var row = [String]()
                    
                    for i in 0..<numberOfColumns {
                                        
                        let colRaw = sqlite3_column_text(queryStatement, i)
                        let colString = String(cString: colRaw!)
                        row.append(colString)
                        
                    }
                                     
                    valueMatrix.append(row)
                }
                
            } else {
                print("SELECT statement could not be prepared")
            }
            
            sqlite3_finalize(queryStatement)
            sqlite3_close(db)
            
        }
        
        return valueMatrix
    }
    
        
}

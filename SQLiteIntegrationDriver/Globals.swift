//
//  Globals.swift
//  SQLiteIntegrationDriver
//
//  Created by Bret Williams on 4/9/20.
//  Copyright © 2020 Bret Williams. All rights reserved.
//

import Foundation

class Globals {
    
    var databaseUrl: URL
    
    class var SharedInstance: Globals {
        struct Singleton {
            static let instance = Globals()
        }
        
        return Singleton.instance
    }
    
    init() {
        
        databaseUrl = URL(fileURLWithPath: "")
        
    }
    
    
}

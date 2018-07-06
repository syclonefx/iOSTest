//
//  AppModel.swift
//  iOSTest
//
//  Created by Chuck Perdue on 7/4/18.
//  Copyright © 2018 SycloneFX LLC. All rights reserved.
//

import Foundation
import GRDB

class AppModel {
    
    // Check version
//    func checkVersion() -> String {
//        //
//        return "N/A"
//    }
    
    // Create Views Table
//    func createViewTable() {
//
//        do {
//            let dbQueue = try DataService.instance.CreateDataBase();
//                try dbQueue.write { db in
//                    try db.create(table: "storyboard") { t in
//                        t.column("id", .integer).primaryKey().notNull()
//                        t.column("name", .text).notNull()
//                        t.column("identifier", .text).notNull().unique()
//                        t.column("position", .integer).defaults(to: 0)
//                        t.column("isActive", .integer).defaults(to: 1)
//                    }
//                }
//        } catch  {
//            print("error")
//        }
//    }
    
    // Setup App for first time run
    func setup() {
        print("This is the first time running")
    }
}

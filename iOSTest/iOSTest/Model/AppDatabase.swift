//
//  AppDatabase.swift
//  iOSTest
//
//  Created by Chuck Perdue on 7/4/18.
//  Copyright © 2018 SycloneFX LLC. All rights reserved.
//

import Foundation
import GRDB

struct AppDatabase {
    
    /// Creates a fully initialized database at path
    static func openDatabase(atPath path: String) throws -> DatabaseQueue {
        // Connect to the database
        // See https://github.com/groue/GRDB.swift/#database-connections
        
        dbQueue = try DatabaseQueue(path: path)
        
        // Use DatabaseMigrator to define the database schema
        // See https://github.com/groue/GRDB.swift/#migrations
        try migrator.migrate(dbQueue)
        
        return dbQueue
    }
    ///~/Users/syclonefx/Dropbox/Programs/SQLite DataBases/
    /// The DatabaseMigrator that defines the database schema.
    ///
    /// This migrator is exposed so that migrations can be tested.
    // See https://github.com/groue/GRDB.swift/#migrations
    static var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        
        migrator.registerMigration("createStoryboard") { db in
            // Create a table
            // See https://github.com/groue/GRDB.swift#create-tables
            try db.create(table: "storyboard") { t in
                t.column("id", .integer).primaryKey()
                t.column("name", .text).notNull()
                t.column("identifier", .text).notNull().unique()
                t.column("position", .integer).defaults(to: 0)
                t.column("isActive", .integer).defaults(to: 1)
            }
            
            var storyboard = Storyboard(id: nil, name: "Loans", identifier: "Loans", position: 1, isActive: 1)
            try storyboard.insert(db)
        }
                
        //        // Migrations for future application versions will be inserted here:
        //        migrator.registerMigration(...) { db in
        //            ...
        //        }
        
        return migrator
    }
    
}


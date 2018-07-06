//
//  DataService.swift
//  iOSTest
//
//  Created by Chuck Perdue on 7/4/18.
//  Copyright © 2018 SycloneFX LLC. All rights reserved.
//

import Foundation
import GRDB

class DataService {
    static let instance = DataService()
    
    func dbPath() throws -> String {
        let databaseURL = try FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("db.sqlite").path
        return databaseURL
    }
    
    // https://github.com/groue/GRDB.swift/blob/master/DemoApps/GRDBDemoiOS/GRDBDemoiOS/AppDatabase.swift
    func OpenConnection() throws -> DatabaseQueue {        //do{
        let fileManager = FileManager.default
        //            let dbPath = try fileManager
        //                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        //                .appendingPathComponent("db.sqlite")
        //                .path
        if try !fileManager.fileExists(atPath: dbPath()) { // Check if db is already in dbPath(). If not copy a new one from the MainBundle
            let dbResourcePath = Bundle.main.path(forResource: "db", ofType: "sqlite")!
            try fileManager.copyItem(atPath: dbResourcePath, toPath: dbPath())
        }
        let dbQueue = try DatabaseQueue(path: dbPath())
        return dbQueue
    }
    
    func OpenReadOnlyConnection() throws -> DatabaseQueue { // Open a connection to the db in the MainBundle        //do {
        var configuration = Configuration()
        configuration.readonly = true
        let dbPath = Bundle.main.path(forResource: "db", ofType: "sqlite")!
        let dbQueue = try DatabaseQueue(path: dbPath, configuration: configuration)
        return dbQueue
    }
    
}

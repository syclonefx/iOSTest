//
//  Storyboard.swift
//  iOSTest
//
//  Created by Chuck Perdue on 7/4/18.
//  Copyright © 2018 SycloneFX LLC. All rights reserved.
//

import GRDB

struct Storyboard: Codable, FetchableRecord, MutablePersistableRecord {
    var id: Int64?
    var name: String
    var identifier: String
    var position: Int
    var isActive: Int
    
    enum Columns: String, ColumnExpression {
        case id,name,identifier,position,isActive
    }
    
    mutating func didInsert(with rowId: Int64, for column: String?){
        id = rowId
    }
    
}


//
//  File.swift
//  
//
//  Created by Volodya on 12.06.2023.
//

import Fluent

struct CreateTest: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("test")
            .id()
            .field("title", .string , .required)
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("test").delete()
    }
    
    
}

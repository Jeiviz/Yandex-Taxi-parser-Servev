//
//  File.swift
//  
//
//  Created by Volodya on 11.06.2023.
//
import Vapor
import Fluent
struct CreateOrder: Migration {
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("order").delete()
    }
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("order")
            .id()
            .field("city", .string, .required)
            .field("startDate", .string, .required)
            .field("lastDate", .string, .required)
            .create()
    }
}

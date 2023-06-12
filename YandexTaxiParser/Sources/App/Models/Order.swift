//
//  File.swift
//  
//
//  Created by Volodya on 11.06.2023.
//

import Vapor
import Fluent

final class Order: Model, Content {
    
    static var schema: String = "order"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "city")
    var city: String
    
    @Field(key: "startDate")
    var startDate: String
    
    @Field(key: "lastDate")
    var lastDate: String
    
    init() { }
    
    init(id: UUID? = nil, city: String, startDate: String, lastDate: String) {
        self.id = UUID()
        self.city = city
        self.startDate = startDate
        self.lastDate = lastDate
    }
    
}

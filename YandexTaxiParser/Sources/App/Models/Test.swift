//
//  File.swift
//  
//
//  Created by Volodya on 12.06.2023.
//

import Vapor
import Fluent

class Test: Model {
    required init() {
        
    }
    

    static var schema: String = "test"
    
    @ID var id: UUID?
    
    @Field(key: "title") var name: String
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

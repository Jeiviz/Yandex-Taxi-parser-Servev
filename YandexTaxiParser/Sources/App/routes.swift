import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
//    app.post("api") { req -> EventLoopFuture<Order> in
//        let order = try req.content.decode(Order.self)
//        
//        return order.save(on: req.db).map({ order })
//    }
    
    app.post("api") { req -> EventLoopFuture<Order> in
        let order = try req.content.decode(Order.self)
        
        return order.save(on: req.db).map { order }
    }
}

import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    /// 1. Register a new route at /api/acronyms that accepts a POST request and returns Future<Acronym>. It returns the acronym once it's saved.
    router.post("api", "acronyms") { (req) -> Future<Acronym> in
        /// 2. Decode the request's JSON into an Acronym model using Codable.
        /// This returns a Future<Acronym> so it uses a flatmap(to:) to extract the acronym when the decoding is complete.
        /// In this route handler, you are calling decode(_:) on Request 
        return try req.content.decode(Acronym.self)
            .flatMap(to: Acronym.self, { (acronym) in
                //
                return acronym.save(on: req)
            })
    }
    
//    // Basic "Hello, world!" example
//    router.get("hello") { req in
//        return "Hello, world!"
//    }
}

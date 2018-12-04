import Vapor
import FluentSQLite

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    
    init(short: String, long: String) {
        self.short = short
        self.long = long
    }
}

//extension Acronym: Model {
//    // tell fluent what database to use for this model. The template is already configured to use SQLite
//    typealias Database = SQLiteDatabase
//    // Tell Fluent what type the ID is.
//    typealias ID = Int
//    // Tell Fluent the key path of the model's ID porperty.
//    public static var idKey: IDKey = \Acronym.id
//}

// OR:

extension Acronym: SQLiteModel {}

extension Acronym: Migration {}

extension Acronym: Content {}

//MARK: Dependency Inversion Principle

/*
 Abstractions should not depend upon details. Details should depend upon abstractions.
*/

//MARK: NO DIP

/// Low level class
class MySQLDatabase_NoDIP {
    func save(data: String) {
        print("Saving data to MySQL database: \(data)")
    }
}

/// High Level Class
class DataService_NoDIP {
    private let database: MySQLDatabase_NoDIP

    init(database: MySQLDatabase_NoDIP) {
        self.database = database
    }

    func saveData(data: String) {
        database.save(data: data)
    }
}

/// Usage
let mysqlDatabase_NoDIP = MySQLDatabase_NoDIP()
let dataService_NoDIP = DataService_NoDIP(database: mysqlDatabase_NoDIP)
dataService_NoDIP.saveData(data: "Sample Data")


//MARK: - DIP

/// Interface (Abstraction)
protocol Database {
    func save(data: String)
}

/// low level concrete implementation
class MySQLDatabase: Database {
    func save(data: String) {
        print("Saving data to MySQL database: \(data)")
    }
}

/// Another low level concrete implementation
class SQLiteDatabase: Database {
    func save(data: String) {
        print("Saving data to SQLite database: \(data)")
    }
}

/// High level Class
class DataService {
    private let database: Database

    init(database: Database) {
        self.database = database
    }

    func saveData(data: String) {
        database.save(data: data)
    }
}

/// Usage
let mysqlDatabase: Database = MySQLDatabase()
let dataService = DataService(database: mysqlDatabase)
dataService.saveData(data: "Sample Data")

let sqliteDatabase: Database = SQLiteDatabase()
let anotherDataService = DataService(database: sqliteDatabase)
anotherDataService.saveData(data: "Another Sample Data")

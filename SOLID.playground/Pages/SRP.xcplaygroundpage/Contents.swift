//MARK: Single Responsability Principle
// SRP
/*
 A class should have one, and only one, reason to change. In other words, a class should have a single responsibility or role in the system.
 */

//MARK: - WITHOUT SRP

class User {
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    func saveToDatabase() {
        // Code to save the user in the database
    }
    
    func sendEmail() {
        // Code to send an email to user
    }
}

//MARK: - SRP

class UserSRP {
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
}

class UserRepository {
    func save(user: User) {
        // Code to save the user in the database
    }
}

class EmailService {
    func sendEmail(to user: User) {
        // Code to send an email to user
    }
}

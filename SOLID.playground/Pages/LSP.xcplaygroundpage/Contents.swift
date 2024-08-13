//MARK: Liskov Substitution Principle
// LSP
/*
 Objects of a derived class must be able to replace objects of the base class
 without altering the correct functioning of the program.
 */

//MARK: - WITHOUT LSP

class UserDataBaseManager {
    
    func saveUser () {
        /// Code to log the user
    }
    
}

class LoginViewController {
    var userDataBaseManager : UserDataBaseManager
    
    init(userDataBaseManager: UserDataBaseManager) {
        self.userDataBaseManager = userDataBaseManager
    }
    
    func viewDidLoad(){
        userDataBaseManager.saveUser()
    }
    
}


//MARK: - Liskov Substitution Principle
/// Is important that Objects must depend on "interfaces" rather than "implementations"

protocol UserDataBaseManagerInterface {
    func saveUser()
}

class LoginVC {
    var userDataBaseManager : UserDataBaseManagerInterface
    
    init(userDataBaseManager: UserDataBaseManagerInterface) {
        self.userDataBaseManager = userDataBaseManager
    }
    
    func viewDidLoad(){
        userDataBaseManager.saveUser()
    }
    
}

// IMPLEMENTATIONS

class UserDefaults : UserDataBaseManagerInterface {
    func saveUser() {
        /// Save User
    }
}

class RealmDataBaseManager : UserDataBaseManagerInterface {
    func saveUser() {
        /// Save User
    }
}

class CoreDataManager : UserDataBaseManagerInterface {
    func saveUser() {
        /// Save User
    }
}

class SwiftDataManager : UserDataBaseManagerInterface {
    func saveUser() {
        /// Save User
    }
}

//SUBSTITUTIONS:

let loginViewController = LoginVC(userDataBaseManager: UserDefaults())

loginViewController.userDataBaseManager = RealmDataBaseManager()

loginViewController.userDataBaseManager = CoreDataManager()

loginViewController.userDataBaseManager = SwiftDataManager()

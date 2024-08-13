//MARK: Interface Segregation Principle
/*
 Interfaces should be designed to be specific to a customer or group of customers rather than being overly general.
 
 A CLIENT SHOULD NOT BE FORCED TO DEPEND ON INTERFACES THAT IT DOES NOT USE.
*/

//MARK: General Interface (NO ISP)

protocol Payment {
    func processCreditCardPayment(amount: Double)
    func processBankTransfer(amount: Double)
    func processCashPayment(amount: Double)
}

class CreditCardPayment: Payment {
    func processCreditCardPayment(amount: Double) {
        print("Processing credit card payment of \(amount)")
    }

    func processBankTransfer(amount: Double) {
        // Not supported
    }

    func processCashPayment(amount: Double) {
        // Not supported
    }
}

class BankTransferPayment: Payment {
    func processCreditCardPayment(amount: Double) {
        // Not supported
    }

    func processBankTransfer(amount: Double) {
        print("Processing bank transfer of \(amount)")
    }

    func processCashPayment(amount: Double) {
        // Not supported
    }
}

//MARK: Segreged Interface ISP

protocol CreditCardPayable {
    func processCreditCardPayment(amount: Double)
}

protocol BankTransferPayable {
    func processBankTransfer(amount: Double)
}

protocol CashPayable {
    func processCashPayment(amount: Double)
}

class CreditCardPayment_ISP: CreditCardPayable {
    func processCreditCardPayment(amount: Double) {
        print("Processing credit card payment of \(amount)")
    }
}

class BankTransferPayment_ISP: BankTransferPayable {
    func processBankTransfer(amount: Double) {
        print("Processing bank transfer of \(amount)")
    }
}

class CashPayment: CashPayable {
    func processCashPayment(amount: Double) {
        print("Processing cash payment of \(amount)")
    }
}


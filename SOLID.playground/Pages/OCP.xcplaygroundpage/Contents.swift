//MARK: Open / Closed Principle
// OCP
/*
 It states software entities (such as classes, modules, functions etc.) must be open to extention, but closed for modification.
 */

//MARK: - WITHOUT OCP

class InvoiceBAD {
    func generateReport(for format: String) -> String {
        switch format {
        case "PDF":
            return generatePDFReport()
        case "HTML":
            return generateHTMLReport()
        default:
            return "Unknown format"
        }
    }

    private func generatePDFReport() -> String {
        // Generar informe en formato PDF
        return "PDF Report"
    }

    private func generateHTMLReport() -> String {
        // Generar informe en formato HTML
        return "HTML Report"
    }
}

//MARK: -  Open Closed Principle

protocol ReportGenerator {
    func generateReport() -> String
}

class PDFReportGenerator: ReportGenerator {
    func generateReport() -> String {
        // Generar informe en formato PDF
        return "PDF Report"
    }
}

class HTMLReportGenerator: ReportGenerator {
    func generateReport() -> String {
        // Generar informe en formato HTML
        return "HTML Report"
    }
}

class Invoice {
    private let generator: ReportGenerator

    init(generator: ReportGenerator) {
        self.generator = generator
    }

    func generateReport() -> String {
        return generator.generateReport()
    }
}

/*
 In this example, Invoice does not need to be modified to support new formats. You can create new classes that implement the ReportGenerator protocol to add support for different formats, and Invoice will continue to work with these new classes.
*/

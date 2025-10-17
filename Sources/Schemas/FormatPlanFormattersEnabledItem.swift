import Foundation

public enum FormatPlanFormattersEnabledItem: String, Codable, Hashable, CaseIterable, Sendable {
    case markdown
    case asterisk
    case quote
    case dash
    case newline
    case colon
    case acronym
    case dollarAmount
    case email
    case date
    case time
    case distance
    case unit
    case percentage
    case phoneNumber
    case number
    case stripAsterisk
}
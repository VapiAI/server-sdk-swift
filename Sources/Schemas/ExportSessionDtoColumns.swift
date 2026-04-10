import Foundation

/// Columns to include in the CSV export
public enum ExportSessionDtoColumns: String, Codable, Hashable, CaseIterable, Sendable {
    case id
    case name
    case status
    case assistantId
    case squadId
    case customerName
    case customerNumber
    case phoneNumberId
    case cost
    case messages
    case createdAt
    case updatedAt
}
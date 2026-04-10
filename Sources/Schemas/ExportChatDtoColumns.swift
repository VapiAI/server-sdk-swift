import Foundation

/// Columns to include in the CSV export
public enum ExportChatDtoColumns: String, Codable, Hashable, CaseIterable, Sendable {
    case id
    case assistantId
    case squadId
    case sessionId
    case previousChatId
    case cost
    case messages
    case output
    case createdAt
    case updatedAt
}
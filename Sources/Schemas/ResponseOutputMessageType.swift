import Foundation

/// The type of the output message
public enum ResponseOutputMessageType: String, Codable, Hashable, CaseIterable, Sendable {
    case message
}
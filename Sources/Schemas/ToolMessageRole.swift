import Foundation

/// This is the role of the message author
public enum ToolMessageRole: String, Codable, Hashable, CaseIterable, Sendable {
    case tool
}
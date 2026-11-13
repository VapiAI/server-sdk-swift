import Foundation

public enum ToolWriteConflictResponseDtoError: String, Codable, Hashable, CaseIterable, Sendable {
    case toolWriteConflict = "tool_write_conflict"
}
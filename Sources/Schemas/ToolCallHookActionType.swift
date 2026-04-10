import Foundation

/// This is the type of action - must be "tool"
public enum ToolCallHookActionType: String, Codable, Hashable, CaseIterable, Sendable {
    case tool
}
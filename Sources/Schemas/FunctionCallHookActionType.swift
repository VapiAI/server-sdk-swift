import Foundation

/// The type of tool. "function" for Function tool.
public enum FunctionCallHookActionType: String, Codable, Hashable, CaseIterable, Sendable {
    case function
}
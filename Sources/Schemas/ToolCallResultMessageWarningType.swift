import Foundation

/// The kind of warning. Currently:
/// - `oversized-tool-response`: the tool's serialized response exceeded the
///   recommended size and is likely to bloat the model context, increasing
///   latency and risking truncation of earlier instructions.
public enum ToolCallResultMessageWarningType: String, Codable, Hashable, CaseIterable, Sendable {
    case oversizedToolResponse = "oversized-tool-response"
}
import Foundation

/// This is optional and defaults to "assistant".
/// 
/// When role=assistant, `content` is said out loud when the tool call fails.
/// 
/// When role=system, `content` is passed to the model as a system message
/// along with the failure result, and the model's generated response is
/// spoken. Example:
///     assistant: tool called
///     tool: error from your server
///     <--- system prompt as hint
///     ---> model generates response which is spoken
/// This is useful when you want the model to generate an error-aware
/// response instead of speaking a fixed failure message.
public enum ToolMessageFailedRole: String, Codable, Hashable, CaseIterable, Sendable {
    case assistant
    case system
}
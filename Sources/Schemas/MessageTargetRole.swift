import Foundation

/// This is the role of the message to target.
/// 
/// If not specified, will find the position in the message history ignoring role (effectively `any`).
public enum MessageTargetRole: String, Codable, Hashable, CaseIterable, Sendable {
    case user
    case assistant
}
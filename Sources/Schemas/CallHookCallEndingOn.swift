import Foundation

/// This is the event that triggers this hook
public enum CallHookCallEndingOn: String, Codable, Hashable, CaseIterable, Sendable {
    case callEnding = "call.ending"
}
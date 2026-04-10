import Foundation

/// This is the event that triggers this hook
public enum CallHookModelResponseTimeoutOn: String, Codable, Hashable, CaseIterable, Sendable {
    case modelResponseTimeout = "model.response.timeout"
}
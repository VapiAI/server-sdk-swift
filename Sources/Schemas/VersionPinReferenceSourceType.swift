import Foundation

/// Kind of source row the pin originates from.
public enum VersionPinReferenceSourceType: String, Codable, Hashable, CaseIterable, Sendable {
    case assistantVersion = "assistant_version"
    case squad
    case toolVersion = "tool_version"
}
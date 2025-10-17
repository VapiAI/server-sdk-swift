import Foundation

/// The permission level on this resource
public enum ElevenLabsPronunciationDictionaryPermissionOnResource: String, Codable, Hashable, CaseIterable, Sendable {
    case admin
    case editor
    case viewer
}
import Foundation

public enum VersionPinConflictResponseDtoError: String, Codable, Hashable, CaseIterable, Sendable {
    case versionPinned = "version_pinned"
}
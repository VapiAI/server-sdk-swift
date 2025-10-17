import Foundation

public enum UpdateUserRoleDtoRole: String, Codable, Hashable, CaseIterable, Sendable {
    case admin
    case editor
    case viewer
}
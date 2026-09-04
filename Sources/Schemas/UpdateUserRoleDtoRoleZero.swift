import Foundation

public enum UpdateUserRoleDtoRoleZero: String, Codable, Hashable, CaseIterable, Sendable {
    case admin
    case editor
    case viewer
}
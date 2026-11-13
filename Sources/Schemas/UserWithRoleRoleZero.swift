import Foundation

public enum UserWithRoleRoleZero: String, Codable, Hashable, CaseIterable, Sendable {
    case admin
    case editor
    case viewer
    case hipaaSpecial = "hipaa-special"
}
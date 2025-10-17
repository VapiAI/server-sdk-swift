import Foundation

public enum InviteUserDtoRole: String, Codable, Hashable, CaseIterable, Sendable {
    case admin
    case editor
    case viewer
}
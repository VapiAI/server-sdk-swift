import Foundation

/// This is the user's role in the org: a built-in role, the HIPAA special role, or a custom WorkOS role slug prefixed with `org-`.
public enum UserWithRoleRole: Codable, Hashable, Sendable {
    case string(String)
    case userWithRoleRoleZero(UserWithRoleRoleZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(UserWithRoleRoleZero.self) {
            self = .userWithRoleRoleZero(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value):
            try container.encode(value)
        case .userWithRoleRoleZero(let value):
            try container.encode(value)
        }
    }
}
import Foundation

public enum InviteUserDtoRole: Codable, Hashable, Sendable {
    case inviteUserDtoRoleZero(InviteUserDtoRoleZero)
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(InviteUserDtoRoleZero.self) {
            self = .inviteUserDtoRoleZero(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
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
        case .inviteUserDtoRoleZero(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}
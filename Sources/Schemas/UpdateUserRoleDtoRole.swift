import Foundation

public enum UpdateUserRoleDtoRole: Codable, Hashable, Sendable {
    case string(String)
    case updateUserRoleDtoRoleZero(UpdateUserRoleDtoRoleZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(UpdateUserRoleDtoRoleZero.self) {
            self = .updateUserRoleDtoRoleZero(value)
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
        case .updateUserRoleDtoRoleZero(let value):
            try container.encode(value)
        }
    }
}
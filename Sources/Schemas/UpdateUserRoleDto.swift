import Foundation

public struct UpdateUserRoleDto: Codable, Hashable, Sendable {
    public let userId: String
    public let role: UpdateUserRoleDtoRole
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        userId: String,
        role: UpdateUserRoleDtoRole,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.userId = userId
        self.role = role
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.role = try container.decode(UpdateUserRoleDtoRole.self, forKey: .role)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.userId, forKey: .userId)
        try container.encode(self.role, forKey: .role)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case userId
        case role
    }
}
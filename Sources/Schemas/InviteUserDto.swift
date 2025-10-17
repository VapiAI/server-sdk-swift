import Foundation

public struct InviteUserDto: Codable, Hashable, Sendable {
    public let emails: [String]
    public let role: InviteUserDtoRole
    public let redirectTo: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        emails: [String],
        role: InviteUserDtoRole,
        redirectTo: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.emails = emails
        self.role = role
        self.redirectTo = redirectTo
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.emails = try container.decode([String].self, forKey: .emails)
        self.role = try container.decode(InviteUserDtoRole.self, forKey: .role)
        self.redirectTo = try container.decodeIfPresent(String.self, forKey: .redirectTo)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.emails, forKey: .emails)
        try container.encode(self.role, forKey: .role)
        try container.encodeIfPresent(self.redirectTo, forKey: .redirectTo)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case emails
        case role
        case redirectTo
    }
}
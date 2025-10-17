import Foundation

public struct CreateTokenDto: Codable, Hashable, Sendable {
    /// This is the tag for the token. It represents its scope.
    public let tag: CreateTokenDtoTag?
    /// This is the name of the token. This is just for your own reference.
    public let name: String?
    /// This are the restrictions for the token.
    public let restrictions: TokenRestrictions?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        tag: CreateTokenDtoTag? = nil,
        name: String? = nil,
        restrictions: TokenRestrictions? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.tag = tag
        self.name = name
        self.restrictions = restrictions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tag = try container.decodeIfPresent(CreateTokenDtoTag.self, forKey: .tag)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.restrictions = try container.decodeIfPresent(TokenRestrictions.self, forKey: .restrictions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.tag, forKey: .tag)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.restrictions, forKey: .restrictions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case tag
        case name
        case restrictions
    }
}
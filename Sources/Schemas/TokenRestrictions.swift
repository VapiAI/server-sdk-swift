import Foundation

public struct TokenRestrictions: Codable, Hashable, Sendable {
    /// This determines whether the token is enabled or disabled. Default is true, it's enabled.
    public let enabled: Bool?
    /// This determines the allowed origins for this token. Validates the `Origin` header. Default is any origin.
    /// 
    /// Only relevant for `public` tokens.
    public let allowedOrigins: [String]?
    /// This determines which assistantIds can be used when creating a call. Default is any assistantId.
    /// 
    /// Only relevant for `public` tokens.
    public let allowedAssistantIds: [String]?
    /// This determines whether transient assistants can be used when creating a call. Default is true.
    /// 
    /// If `allowedAssistantIds` is provided, this is automatically false.
    /// 
    /// Only relevant for `public` tokens.
    public let allowTransientAssistant: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        enabled: Bool? = nil,
        allowedOrigins: [String]? = nil,
        allowedAssistantIds: [String]? = nil,
        allowTransientAssistant: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.enabled = enabled
        self.allowedOrigins = allowedOrigins
        self.allowedAssistantIds = allowedAssistantIds
        self.allowTransientAssistant = allowTransientAssistant
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.allowedOrigins = try container.decodeIfPresent([String].self, forKey: .allowedOrigins)
        self.allowedAssistantIds = try container.decodeIfPresent([String].self, forKey: .allowedAssistantIds)
        self.allowTransientAssistant = try container.decodeIfPresent(Bool.self, forKey: .allowTransientAssistant)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.allowedOrigins, forKey: .allowedOrigins)
        try container.encodeIfPresent(self.allowedAssistantIds, forKey: .allowedAssistantIds)
        try container.encodeIfPresent(self.allowTransientAssistant, forKey: .allowTransientAssistant)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case enabled
        case allowedOrigins
        case allowedAssistantIds
        case allowTransientAssistant
    }
}
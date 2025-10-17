import Foundation

public struct ProviderResource: Codable, Hashable, Sendable {
    /// This is the unique identifier for the provider resource.
    public let id: String
    /// This is the unique identifier for the org that this provider resource belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the provider resource was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the provider resource was last updated.
    public let updatedAt: Date
    /// This is the provider that manages this resource.
    public let provider: Value
    /// This is the name/type of the resource.
    public let resourceName: PronunciationDictionary
    /// This is the provider-specific identifier for the resource.
    public let resourceId: String
    /// This is the full resource data from the provider's API.
    public let resource: ElevenLabsPronunciationDictionary
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        provider: Value,
        resourceName: PronunciationDictionary,
        resourceId: String,
        resource: ElevenLabsPronunciationDictionary,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.provider = provider
        self.resourceName = resourceName
        self.resourceId = resourceId
        self.resource = resource
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.provider = try container.decode(Value.self, forKey: .provider)
        self.resourceName = try container.decode(PronunciationDictionary.self, forKey: .resourceName)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
        self.resource = try container.decode(ElevenLabsPronunciationDictionary.self, forKey: .resource)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.resourceName, forKey: .resourceName)
        try container.encode(self.resourceId, forKey: .resourceId)
        try container.encode(self.resource, forKey: .resource)
    }

    public enum Value: String, Codable, Hashable, CaseIterable, Sendable {
        case value = "11labs"
    }

    public enum PronunciationDictionary: String, Codable, Hashable, CaseIterable, Sendable {
        case pronunciationDictionary = "pronunciation-dictionary"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case orgId
        case createdAt
        case updatedAt
        case provider
        case resourceName
        case resourceId
        case resource
    }
}
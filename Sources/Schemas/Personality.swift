import Foundation

public struct Personality: Codable, Hashable, Sendable {
    /// This is the unique identifier for the personality.
    public let id: String
    /// This is the unique identifier for the organization this personality belongs to.
    /// If null, this is a Vapi-provided default personality available to all organizations.
    public let orgId: Nullable<String>
    /// This is the ISO 8601 date-time string of when the personality was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the personality was last updated.
    public let updatedAt: Date
    /// This is the name of the personality (e.g., "Confused Carl", "Rude Rob").
    public let name: String
    /// This is the full assistant configuration for this personality.
    /// It defines the tester's voice, model, behavior via system prompt, and other settings.
    public let assistant: CreateAssistantDto
    /// Optional folder path for organizing personalities.
    /// Supports up to 3 levels (e.g., "dept/feature/variant").
    /// Maps to GitOps resource folder structure.
    public let path: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        orgId: Nullable<String>,
        createdAt: Date,
        updatedAt: Date,
        name: String,
        assistant: CreateAssistantDto,
        path: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.assistant = assistant
        self.path = path
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(Nullable<String>.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.assistant = try container.decode(CreateAssistantDto.self, forKey: .assistant)
        self.path = try container.decodeNullableIfPresent(String.self, forKey: .path)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.assistant, forKey: .assistant)
        try container.encodeNullableIfPresent(self.path, forKey: .path)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case assistant
        case path
    }
}
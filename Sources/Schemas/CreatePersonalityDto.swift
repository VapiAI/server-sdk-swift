import Foundation

public struct CreatePersonalityDto: Codable, Hashable, Sendable {
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
        name: String,
        assistant: CreateAssistantDto,
        path: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.assistant = assistant
        self.path = path
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.assistant = try container.decode(CreateAssistantDto.self, forKey: .assistant)
        self.path = try container.decodeNullableIfPresent(String.self, forKey: .path)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.assistant, forKey: .assistant)
        try container.encodeNullableIfPresent(self.path, forKey: .path)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case assistant
        case path
    }
}
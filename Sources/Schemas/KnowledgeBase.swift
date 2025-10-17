import Foundation

public struct KnowledgeBase: Codable, Hashable, Sendable {
    /// The name of the knowledge base
    public let name: String
    /// The provider of the knowledge base
    public let provider: Google
    /// The model to use for the knowledge base
    public let model: KnowledgeBaseModel?
    /// A description of the knowledge base
    public let description: String
    /// The file IDs associated with this knowledge base
    public let fileIds: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        provider: Google,
        model: KnowledgeBaseModel? = nil,
        description: String,
        fileIds: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.provider = provider
        self.model = model
        self.description = description
        self.fileIds = fileIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.provider = try container.decode(Google.self, forKey: .provider)
        self.model = try container.decodeIfPresent(KnowledgeBaseModel.self, forKey: .model)
        self.description = try container.decode(String.self, forKey: .description)
        self.fileIds = try container.decode([String].self, forKey: .fileIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.fileIds, forKey: .fileIds)
    }

    public enum Google: String, Codable, Hashable, CaseIterable, Sendable {
        case google
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case provider
        case model
        case description
        case fileIds
    }
}
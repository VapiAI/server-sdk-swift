import Foundation

public struct KnowledgeBaseV2WithFiles: Codable, Hashable, Sendable {
    public let name: String
    public let description: Nullable<String>?
    public let id: String
    public let orgId: String
    public let createdAt: Date
    public let updatedAt: Date
    public let files: [KnowledgeBaseV2File]
    /// Id of the tool that searches this knowledge base (at most one per base; provisioned on creation). Attach it to an assistant via model.toolIds. Null when the base has no search tool yet.
    public let toolId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        description: Nullable<String>? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        files: [KnowledgeBaseV2File],
        toolId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.description = description
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.files = files
        self.toolId = toolId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.files = try container.decode([KnowledgeBaseV2File].self, forKey: .files)
        self.toolId = try container.decode(Nullable<String>.self, forKey: .toolId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.files, forKey: .files)
        try container.encode(self.toolId, forKey: .toolId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case description
        case id
        case orgId
        case createdAt
        case updatedAt
        case files
        case toolId
    }
}
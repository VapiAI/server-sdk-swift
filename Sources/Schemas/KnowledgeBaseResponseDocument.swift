import Foundation

public struct KnowledgeBaseResponseDocument: Codable, Hashable, Sendable {
    /// This is the content of the document.
    public let content: String
    /// This is the similarity score of the document.
    public let similarity: Double
    /// This is the uuid of the document.
    public let uuid: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        content: String,
        similarity: Double,
        uuid: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.content = content
        self.similarity = similarity
        self.uuid = uuid
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
        self.similarity = try container.decode(Double.self, forKey: .similarity)
        self.uuid = try container.decodeIfPresent(String.self, forKey: .uuid)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.similarity, forKey: .similarity)
        try container.encodeIfPresent(self.uuid, forKey: .uuid)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case content
        case similarity
        case uuid
    }
}
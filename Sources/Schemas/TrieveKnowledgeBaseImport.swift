import Foundation

public struct TrieveKnowledgeBaseImport: Codable, Hashable, Sendable {
    /// This is to import an existing dataset from Trieve.
    public let type: TrieveKnowledgeBaseImportType
    /// This is the `datasetId` of the dataset on your Trieve account.
    public let providerId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: TrieveKnowledgeBaseImportType,
        providerId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.providerId = providerId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(TrieveKnowledgeBaseImportType.self, forKey: .type)
        self.providerId = try container.decode(String.self, forKey: .providerId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.providerId, forKey: .providerId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case providerId
    }
}
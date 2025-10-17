import Foundation

public struct TrieveKnowledgeBaseCreate: Codable, Hashable, Sendable {
    /// This is to create a new dataset on Trieve.
    public let type: Create
    /// These are the chunk plans used to create the dataset.
    public let chunkPlans: [TrieveKnowledgeBaseChunkPlan]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: Create,
        chunkPlans: [TrieveKnowledgeBaseChunkPlan],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.chunkPlans = chunkPlans
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(Create.self, forKey: .type)
        self.chunkPlans = try container.decode([TrieveKnowledgeBaseChunkPlan].self, forKey: .chunkPlans)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.chunkPlans, forKey: .chunkPlans)
    }

    public enum Create: String, Codable, Hashable, CaseIterable, Sendable {
        case create
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case chunkPlans
    }
}
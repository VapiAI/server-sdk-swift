import Foundation

public struct TrieveKnowledgeBaseSearchPlan: Codable, Hashable, Sendable {
    /// Specifies the number of top chunks to return. This corresponds to the `page_size` parameter in Trieve.
    public let topK: Double?
    /// If true, stop words (specified in server/src/stop-words.txt in the git repo) will be removed. This will preserve queries that are entirely stop words.
    public let removeStopWords: Bool?
    /// This is the score threshold to filter out chunks with a score below the threshold for cosine distance metric. For Manhattan Distance, Euclidean Distance, and Dot Product, it will filter out scores above the threshold distance. This threshold applies before weight and bias modifications. If not specified, this defaults to no threshold. A threshold of 0 will default to no threshold.
    public let scoreThreshold: Double?
    /// This is the search method used when searching for relevant chunks from the vector store.
    public let searchType: TrieveKnowledgeBaseSearchPlanSearchType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        topK: Double? = nil,
        removeStopWords: Bool? = nil,
        scoreThreshold: Double? = nil,
        searchType: TrieveKnowledgeBaseSearchPlanSearchType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.topK = topK
        self.removeStopWords = removeStopWords
        self.scoreThreshold = scoreThreshold
        self.searchType = searchType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.topK = try container.decodeIfPresent(Double.self, forKey: .topK)
        self.removeStopWords = try container.decodeIfPresent(Bool.self, forKey: .removeStopWords)
        self.scoreThreshold = try container.decodeIfPresent(Double.self, forKey: .scoreThreshold)
        self.searchType = try container.decode(TrieveKnowledgeBaseSearchPlanSearchType.self, forKey: .searchType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.topK, forKey: .topK)
        try container.encodeIfPresent(self.removeStopWords, forKey: .removeStopWords)
        try container.encodeIfPresent(self.scoreThreshold, forKey: .scoreThreshold)
        try container.encode(self.searchType, forKey: .searchType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case topK
        case removeStopWords
        case scoreThreshold
        case searchType
    }
}
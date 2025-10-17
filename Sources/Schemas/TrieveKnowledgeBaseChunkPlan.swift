import Foundation

public struct TrieveKnowledgeBaseChunkPlan: Codable, Hashable, Sendable {
    /// These are the file ids that will be used to create the vector store. To upload files, use the `POST /files` endpoint.
    public let fileIds: [String]?
    /// These are the websites that will be used to create the vector store.
    public let websites: [String]?
    /// This is an optional field which allows you to specify the number of splits you want per chunk. If not specified, the default 20 is used. However, you may want to use a different number.
    public let targetSplitsPerChunk: Double?
    /// This is an optional field which allows you to specify the delimiters to use when splitting the file before chunking the text. If not specified, the default [.!?\n] are used to split into sentences. However, you may want to use spaces or other delimiters.
    public let splitDelimiters: [String]?
    /// This is an optional field which allows you to specify whether or not to rebalance the chunks created from the file. If not specified, the default true is used. If true, Trieve will evenly distribute remainder splits across chunks such that 66 splits with a target_splits_per_chunk of 20 will result in 3 chunks with 22 splits each.
    public let rebalanceChunks: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fileIds: [String]? = nil,
        websites: [String]? = nil,
        targetSplitsPerChunk: Double? = nil,
        splitDelimiters: [String]? = nil,
        rebalanceChunks: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fileIds = fileIds
        self.websites = websites
        self.targetSplitsPerChunk = targetSplitsPerChunk
        self.splitDelimiters = splitDelimiters
        self.rebalanceChunks = rebalanceChunks
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fileIds = try container.decodeIfPresent([String].self, forKey: .fileIds)
        self.websites = try container.decodeIfPresent([String].self, forKey: .websites)
        self.targetSplitsPerChunk = try container.decodeIfPresent(Double.self, forKey: .targetSplitsPerChunk)
        self.splitDelimiters = try container.decodeIfPresent([String].self, forKey: .splitDelimiters)
        self.rebalanceChunks = try container.decodeIfPresent(Bool.self, forKey: .rebalanceChunks)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fileIds, forKey: .fileIds)
        try container.encodeIfPresent(self.websites, forKey: .websites)
        try container.encodeIfPresent(self.targetSplitsPerChunk, forKey: .targetSplitsPerChunk)
        try container.encodeIfPresent(self.splitDelimiters, forKey: .splitDelimiters)
        try container.encodeIfPresent(self.rebalanceChunks, forKey: .rebalanceChunks)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fileIds
        case websites
        case targetSplitsPerChunk
        case splitDelimiters
        case rebalanceChunks
    }
}
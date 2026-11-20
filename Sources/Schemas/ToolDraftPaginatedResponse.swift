import Foundation

public struct ToolDraftPaginatedResponse: Codable, Hashable, Sendable {
    public let results: [ToolDraft]
    public let metadata: ToolDraftPaginatedMetadata
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        results: [ToolDraft],
        metadata: ToolDraftPaginatedMetadata,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.results = results
        self.metadata = metadata
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([ToolDraft].self, forKey: .results)
        self.metadata = try container.decode(ToolDraftPaginatedMetadata.self, forKey: .metadata)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.results, forKey: .results)
        try container.encode(self.metadata, forKey: .metadata)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case results
        case metadata
    }
}
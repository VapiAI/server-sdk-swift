import Foundation

public struct AssistantVersionPaginatedResponse: Codable, Hashable, Sendable {
    public let results: [JSONValue]
    public let metadata: PaginationMeta
    public let nextPageState: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        results: [JSONValue],
        metadata: PaginationMeta,
        nextPageState: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.results = results
        self.metadata = metadata
        self.nextPageState = nextPageState
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([JSONValue].self, forKey: .results)
        self.metadata = try container.decode(PaginationMeta.self, forKey: .metadata)
        self.nextPageState = try container.decodeIfPresent(String.self, forKey: .nextPageState)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.results, forKey: .results)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.nextPageState, forKey: .nextPageState)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case results
        case metadata
        case nextPageState
    }
}
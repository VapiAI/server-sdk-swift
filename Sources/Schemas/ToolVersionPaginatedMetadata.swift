import Foundation

public struct ToolVersionPaginatedMetadata: Codable, Hashable, Sendable {
    public let nextCursor: Nullable<String>?
    public let hasNextPage: Bool
    public let limit: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        nextCursor: Nullable<String>? = nil,
        hasNextPage: Bool,
        limit: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.nextCursor = nextCursor
        self.hasNextPage = hasNextPage
        self.limit = limit
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.nextCursor = try container.decodeNullableIfPresent(String.self, forKey: .nextCursor)
        self.hasNextPage = try container.decode(Bool.self, forKey: .hasNextPage)
        self.limit = try container.decode(Double.self, forKey: .limit)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.nextCursor, forKey: .nextCursor)
        try container.encode(self.hasNextPage, forKey: .hasNextPage)
        try container.encode(self.limit, forKey: .limit)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case nextCursor
        case hasNextPage
        case limit
    }
}
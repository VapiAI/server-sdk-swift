import Foundation

public struct GetToolDraftsDto: Codable, Hashable, Sendable {
    /// Opaque base64-encoded keyset cursor. Omit on first page.
    public let cursor: String?
    /// Page size, defaults to 25, capped at 100.
    public let limit: Double?
    public let createdBy: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cursor: String? = nil,
        limit: Double? = nil,
        createdBy: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cursor = cursor
        self.limit = limit
        self.createdBy = createdBy
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cursor = try container.decodeIfPresent(String.self, forKey: .cursor)
        self.limit = try container.decodeIfPresent(Double.self, forKey: .limit)
        self.createdBy = try container.decodeIfPresent(String.self, forKey: .createdBy)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.cursor, forKey: .cursor)
        try container.encodeIfPresent(self.limit, forKey: .limit)
        try container.encodeIfPresent(self.createdBy, forKey: .createdBy)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cursor
        case limit
        case createdBy
    }
}
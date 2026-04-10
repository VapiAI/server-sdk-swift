import Foundation

public struct Insight: Codable, Hashable, Sendable {
    /// This is the name of the Insight.
    public let name: String?
    /// This is the type of the Insight.
    public let type: InsightType
    /// This is the unique identifier for the Insight.
    public let id: String
    /// This is the unique identifier for the org that this Insight belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the Insight was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the Insight was last updated.
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        type: InsightType,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.type = type
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.type = try container.decode(InsightType.self, forKey: .type)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case type
        case id
        case orgId
        case createdAt
        case updatedAt
    }
}
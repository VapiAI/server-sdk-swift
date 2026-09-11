import Foundation

public struct LegacyAssistantVersion: Codable, Hashable, Sendable {
    public let id: String
    public let assistantId: String
    public let orgId: String
    public let data: String?
    public let createdAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        assistantId: String,
        orgId: String,
        data: String? = nil,
        createdAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.assistantId = assistantId
        self.orgId = orgId
        self.data = data
        self.createdAt = createdAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.assistantId = try container.decode(String.self, forKey: .assistantId)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.data = try container.decodeIfPresent(String.self, forKey: .data)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.assistantId, forKey: .assistantId)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encodeIfPresent(self.data, forKey: .data)
        try container.encode(self.createdAt, forKey: .createdAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case assistantId
        case orgId
        case data
        case createdAt
    }
}
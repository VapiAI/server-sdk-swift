import Foundation

public struct CampaignContact: Codable, Hashable, Sendable {
    public let id: String
    public let campaignId: String
    public let orgId: String
    public let customerId: String?
    public let number: String
    public let name: String?
    public let assistantOverrides: AssistantOverrides?
    /// Use this when the campaign targets a `squadId`. Mirrors the call-level `squadOverrides` field. Merged with the campaign-level squadOverrides at dispatch time.
    public let squadOverrides: AssistantOverrides?
    public let createdAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        campaignId: String,
        orgId: String,
        customerId: String? = nil,
        number: String,
        name: String? = nil,
        assistantOverrides: AssistantOverrides? = nil,
        squadOverrides: AssistantOverrides? = nil,
        createdAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.campaignId = campaignId
        self.orgId = orgId
        self.customerId = customerId
        self.number = number
        self.name = name
        self.assistantOverrides = assistantOverrides
        self.squadOverrides = squadOverrides
        self.createdAt = createdAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.campaignId = try container.decode(String.self, forKey: .campaignId)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.customerId = try container.decodeIfPresent(String.self, forKey: .customerId)
        self.number = try container.decode(String.self, forKey: .number)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
        self.squadOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .squadOverrides)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.campaignId, forKey: .campaignId)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encodeIfPresent(self.customerId, forKey: .customerId)
        try container.encode(self.number, forKey: .number)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
        try container.encodeIfPresent(self.squadOverrides, forKey: .squadOverrides)
        try container.encode(self.createdAt, forKey: .createdAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case campaignId
        case orgId
        case customerId
        case number
        case name
        case assistantOverrides
        case squadOverrides
        case createdAt
    }
}
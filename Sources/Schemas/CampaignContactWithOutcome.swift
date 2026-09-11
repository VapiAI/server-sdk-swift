import Foundation

public struct CampaignContactWithOutcome: Codable, Hashable, Sendable {
    public let id: String
    public let number: String
    public let name: String?
    public let status: CampaignContactWithOutcomeStatus
    public let callId: String?
    public let dispatchedAt: Date?
    public let endedReason: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        number: String,
        name: String? = nil,
        status: CampaignContactWithOutcomeStatus,
        callId: String? = nil,
        dispatchedAt: Date? = nil,
        endedReason: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.number = number
        self.name = name
        self.status = status
        self.callId = callId
        self.dispatchedAt = dispatchedAt
        self.endedReason = endedReason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.number = try container.decode(String.self, forKey: .number)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.status = try container.decode(CampaignContactWithOutcomeStatus.self, forKey: .status)
        self.callId = try container.decodeIfPresent(String.self, forKey: .callId)
        self.dispatchedAt = try container.decodeIfPresent(Date.self, forKey: .dispatchedAt)
        self.endedReason = try container.decodeIfPresent(String.self, forKey: .endedReason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.number, forKey: .number)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.callId, forKey: .callId)
        try container.encodeIfPresent(self.dispatchedAt, forKey: .dispatchedAt)
        try container.encodeIfPresent(self.endedReason, forKey: .endedReason)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case number
        case name
        case status
        case callId
        case dispatchedAt
        case endedReason
    }
}
import Foundation

public struct TrafficAllocation: Codable, Hashable, Sendable {
    /// Unique identifier. The most recently created allocation for an assistant is the one in effect.
    public let id: String
    public let orgId: String
    /// The assistant this allocation splits calls for.
    public let assistantId: String?
    /// 'explicit' splits calls across this allocation's targets. 'follow-latest' sends every call to the newest published version.
    public let allocationIntent: TrafficAllocationAllocationIntent
    /// When this allocation was created, which is also when it took effect.
    public let createdAt: Date
    /// Who created this allocation. 'system' means Vapi created it automatically, for example when a publish advances a follow-latest allocation.
    public let actorType: TrafficAllocationActorType
    /// The user id or API key id that created this allocation. Absent for system rows.
    public let actorId: String?
    /// Email of the user who created this allocation, as of that time.
    public let actorEmail: String?
    /// The note given when this allocation was created, if any.
    public let description: String?
    /// The versions this allocation splits calls across, in position order. Empty for follow-latest allocations.
    public let targets: [TrafficAllocationTarget]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        orgId: String,
        assistantId: String? = nil,
        allocationIntent: TrafficAllocationAllocationIntent,
        createdAt: Date,
        actorType: TrafficAllocationActorType,
        actorId: String? = nil,
        actorEmail: String? = nil,
        description: String? = nil,
        targets: [TrafficAllocationTarget],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.orgId = orgId
        self.assistantId = assistantId
        self.allocationIntent = allocationIntent
        self.createdAt = createdAt
        self.actorType = actorType
        self.actorId = actorId
        self.actorEmail = actorEmail
        self.description = description
        self.targets = targets
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.allocationIntent = try container.decode(TrafficAllocationAllocationIntent.self, forKey: .allocationIntent)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.actorType = try container.decode(TrafficAllocationActorType.self, forKey: .actorType)
        self.actorId = try container.decodeIfPresent(String.self, forKey: .actorId)
        self.actorEmail = try container.decodeIfPresent(String.self, forKey: .actorEmail)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.targets = try container.decode([TrafficAllocationTarget].self, forKey: .targets)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encode(self.allocationIntent, forKey: .allocationIntent)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.actorType, forKey: .actorType)
        try container.encodeIfPresent(self.actorId, forKey: .actorId)
        try container.encodeIfPresent(self.actorEmail, forKey: .actorEmail)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.targets, forKey: .targets)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case orgId
        case assistantId
        case allocationIntent
        case createdAt
        case actorType
        case actorId
        case actorEmail
        case description
        case targets
    }
}
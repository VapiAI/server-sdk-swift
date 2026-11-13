import Foundation

public struct AssistantGoalDto: Codable, Hashable, Sendable {
    public let orgId: String
    public let assistantId: String
    public let goalId: String
    /// Committed decimal bigint revision.
    public let goalVersion: String
    public let succeedsWhen: String
    public let leaveOut: String?
    /// Committed goal-change time anchoring its fixed backfill window.
    public let createdAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        orgId: String,
        assistantId: String,
        goalId: String,
        goalVersion: String,
        succeedsWhen: String,
        leaveOut: String? = nil,
        createdAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.orgId = orgId
        self.assistantId = assistantId
        self.goalId = goalId
        self.goalVersion = goalVersion
        self.succeedsWhen = succeedsWhen
        self.leaveOut = leaveOut
        self.createdAt = createdAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.assistantId = try container.decode(String.self, forKey: .assistantId)
        self.goalId = try container.decode(String.self, forKey: .goalId)
        self.goalVersion = try container.decode(String.self, forKey: .goalVersion)
        self.succeedsWhen = try container.decode(String.self, forKey: .succeedsWhen)
        self.leaveOut = try container.decodeIfPresent(String.self, forKey: .leaveOut)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.assistantId, forKey: .assistantId)
        try container.encode(self.goalId, forKey: .goalId)
        try container.encode(self.goalVersion, forKey: .goalVersion)
        try container.encode(self.succeedsWhen, forKey: .succeedsWhen)
        try container.encodeIfPresent(self.leaveOut, forKey: .leaveOut)
        try container.encode(self.createdAt, forKey: .createdAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case orgId
        case assistantId
        case goalId
        case goalVersion
        case succeedsWhen
        case leaveOut
        case createdAt
    }
}
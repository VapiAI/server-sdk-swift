import Foundation

public struct CallHealthDashboardGoalOptionDto: Codable, Hashable, Sendable {
    /// Explicit selected goal identity, stable across its revisions.
    public let goalId: String
    /// Current visible revision of the selected goal.
    public let succeedsWhen: String
    /// Current optional semantic exclusions.
    public let leaveOut: String?
    /// Current revision for display; clients select by stable goalId, never by this version.
    public let goalVersion: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        goalId: String,
        succeedsWhen: String,
        leaveOut: String? = nil,
        goalVersion: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.goalId = goalId
        self.succeedsWhen = succeedsWhen
        self.leaveOut = leaveOut
        self.goalVersion = goalVersion
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.goalId = try container.decode(String.self, forKey: .goalId)
        self.succeedsWhen = try container.decode(String.self, forKey: .succeedsWhen)
        self.leaveOut = try container.decodeIfPresent(String.self, forKey: .leaveOut)
        self.goalVersion = try container.decode(String.self, forKey: .goalVersion)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.goalId, forKey: .goalId)
        try container.encode(self.succeedsWhen, forKey: .succeedsWhen)
        try container.encodeIfPresent(self.leaveOut, forKey: .leaveOut)
        try container.encode(self.goalVersion, forKey: .goalVersion)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case goalId
        case succeedsWhen
        case leaveOut
        case goalVersion
    }
}
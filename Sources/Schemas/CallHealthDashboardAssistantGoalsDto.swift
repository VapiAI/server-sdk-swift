import Foundation

public struct CallHealthDashboardAssistantGoalsDto: Codable, Hashable, Sendable {
    /// Requested assistant identity whose current published row remains visible.
    public let assistantId: String
    /// Empty when this visible assistant has no goals; no goal is automatically selected.
    public let goals: [CallHealthDashboardGoalOptionDto]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantId: String,
        goals: [CallHealthDashboardGoalOptionDto],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantId = assistantId
        self.goals = goals
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantId = try container.decode(String.self, forKey: .assistantId)
        self.goals = try container.decode([CallHealthDashboardGoalOptionDto].self, forKey: .goals)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assistantId, forKey: .assistantId)
        try container.encode(self.goals, forKey: .goals)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantId
        case goals
    }
}
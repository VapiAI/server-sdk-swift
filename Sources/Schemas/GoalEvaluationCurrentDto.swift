import Foundation

public struct GoalEvaluationCurrentDto: Codable, Hashable, Sendable {
    public let assistantId: String
    public let goalId: String
    /// Current immutable goal revision, encoded as a decimal bigint string.
    public let goalVersion: String
    public let callEndedAt: Date
    public let processingState: GoalEvaluationCurrentDtoProcessingState
    /// Absent until a semantic result is accepted. Processing failures are never goal_not_met.
    public let goalOutcome: GoalEvaluationCurrentDtoGoalOutcome?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantId: String,
        goalId: String,
        goalVersion: String,
        callEndedAt: Date,
        processingState: GoalEvaluationCurrentDtoProcessingState,
        goalOutcome: GoalEvaluationCurrentDtoGoalOutcome? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantId = assistantId
        self.goalId = goalId
        self.goalVersion = goalVersion
        self.callEndedAt = callEndedAt
        self.processingState = processingState
        self.goalOutcome = goalOutcome
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantId = try container.decode(String.self, forKey: .assistantId)
        self.goalId = try container.decode(String.self, forKey: .goalId)
        self.goalVersion = try container.decode(String.self, forKey: .goalVersion)
        self.callEndedAt = try container.decode(Date.self, forKey: .callEndedAt)
        self.processingState = try container.decode(GoalEvaluationCurrentDtoProcessingState.self, forKey: .processingState)
        self.goalOutcome = try container.decodeIfPresent(GoalEvaluationCurrentDtoGoalOutcome.self, forKey: .goalOutcome)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assistantId, forKey: .assistantId)
        try container.encode(self.goalId, forKey: .goalId)
        try container.encode(self.goalVersion, forKey: .goalVersion)
        try container.encode(self.callEndedAt, forKey: .callEndedAt)
        try container.encode(self.processingState, forKey: .processingState)
        try container.encodeIfPresent(self.goalOutcome, forKey: .goalOutcome)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantId
        case goalId
        case goalVersion
        case callEndedAt
        case processingState
        case goalOutcome
    }
}
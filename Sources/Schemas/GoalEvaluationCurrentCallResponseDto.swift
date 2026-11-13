import Foundation

public struct GoalEvaluationCurrentCallResponseDto: Codable, Hashable, Sendable {
    public let callId: String
    public let goalId: String
    /// Current revision of the requested goal for a visible call with a registered evaluation. Absent when the call has no registered evaluation, when that goal does not belong to the source assistant, or when the source is hidden. An absent evaluation does not imply queued or pending work.
    public let currentGoalVersion: String?
    public let currentEvaluation: GoalEvaluationCurrentDto?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        callId: String,
        goalId: String,
        currentGoalVersion: String? = nil,
        currentEvaluation: GoalEvaluationCurrentDto? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.callId = callId
        self.goalId = goalId
        self.currentGoalVersion = currentGoalVersion
        self.currentEvaluation = currentEvaluation
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.callId = try container.decode(String.self, forKey: .callId)
        self.goalId = try container.decode(String.self, forKey: .goalId)
        self.currentGoalVersion = try container.decodeIfPresent(String.self, forKey: .currentGoalVersion)
        self.currentEvaluation = try container.decodeIfPresent(GoalEvaluationCurrentDto.self, forKey: .currentEvaluation)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.callId, forKey: .callId)
        try container.encode(self.goalId, forKey: .goalId)
        try container.encodeIfPresent(self.currentGoalVersion, forKey: .currentGoalVersion)
        try container.encodeIfPresent(self.currentEvaluation, forKey: .currentEvaluation)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case callId
        case goalId
        case currentGoalVersion
        case currentEvaluation
    }
}
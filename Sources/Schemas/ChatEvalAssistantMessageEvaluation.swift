import Foundation

public struct ChatEvalAssistantMessageEvaluation: Codable, Hashable, Sendable {
    /// This is the role of the message author.
    /// For an assistant message evaluation, the role is always 'assistant'
    /// @default 'assistant'
    public let role: Assistant
    /// This is the judge plan that instructs how to evaluate the assistant message.
    /// The assistant message can be evaluated against fixed content (exact match or RegEx) or with an LLM-as-judge by defining the evaluation criteria in a prompt.
    public let judgePlan: ChatEvalAssistantMessageEvaluationJudgePlan
    /// This is the plan for how the overall evaluation will proceed after the assistant message is evaluated.
    /// This lets you configure whether to stop the evaluation if this message fails, and whether to override any content for future turns
    public let continuePlan: AssistantMessageEvaluationContinuePlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        role: Assistant,
        judgePlan: ChatEvalAssistantMessageEvaluationJudgePlan,
        continuePlan: AssistantMessageEvaluationContinuePlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.role = role
        self.judgePlan = judgePlan
        self.continuePlan = continuePlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.role = try container.decode(Assistant.self, forKey: .role)
        self.judgePlan = try container.decode(ChatEvalAssistantMessageEvaluationJudgePlan.self, forKey: .judgePlan)
        self.continuePlan = try container.decodeIfPresent(AssistantMessageEvaluationContinuePlan.self, forKey: .continuePlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.judgePlan, forKey: .judgePlan)
        try container.encodeIfPresent(self.continuePlan, forKey: .continuePlan)
    }

    public enum Assistant: String, Codable, Hashable, CaseIterable, Sendable {
        case assistant
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case judgePlan
        case continuePlan
    }
}
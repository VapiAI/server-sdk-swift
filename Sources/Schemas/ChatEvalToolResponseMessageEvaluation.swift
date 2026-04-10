import Foundation

public struct ChatEvalToolResponseMessageEvaluation: Codable, Hashable, Sendable {
    /// This is the role of the message author.
    /// For a tool response message evaluation, the role is always 'tool'
    /// @default 'tool'
    public let role: ChatEvalToolResponseMessageEvaluationRole
    /// This is the judge plan that instructs how to evaluate the tool response message.
    /// The tool response message can be evaluated with an LLM-as-judge by defining the evaluation criteria in a prompt.
    public let judgePlan: AssistantMessageJudgePlanAi
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        role: ChatEvalToolResponseMessageEvaluationRole,
        judgePlan: AssistantMessageJudgePlanAi,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.role = role
        self.judgePlan = judgePlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.role = try container.decode(ChatEvalToolResponseMessageEvaluationRole.self, forKey: .role)
        self.judgePlan = try container.decode(AssistantMessageJudgePlanAi.self, forKey: .judgePlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.judgePlan, forKey: .judgePlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case judgePlan
    }
}
import Foundation

public struct SuccessEvaluationPlan: Codable, Hashable, Sendable {
    /// This enforces the rubric of the evaluation. The output is stored in `call.analysis.successEvaluation`.
    /// 
    /// Options include:
    /// - 'NumericScale': A scale of 1 to 10.
    /// - 'DescriptiveScale': A scale of Excellent, Good, Fair, Poor.
    /// - 'Checklist': A checklist of criteria and their status.
    /// - 'Matrix': A grid that evaluates multiple criteria across different performance levels.
    /// - 'PercentageScale': A scale of 0% to 100%.
    /// - 'LikertScale': A scale of Strongly Agree, Agree, Neutral, Disagree, Strongly Disagree.
    /// - 'AutomaticRubric': Automatically break down evaluation into several criteria, each with its own score.
    /// - 'PassFail': A simple 'true' if call passed, 'false' if not.
    /// 
    /// Default is 'PassFail'.
    public let rubric: SuccessEvaluationPlanRubric?
    /// These are the messages used to generate the success evaluation.
    /// 
    /// @default: ```
    /// [
    ///   {
    ///     "role": "system",
    ///     "content": "You are an expert call evaluator. You will be given a transcript of a call and the system prompt of the AI participant. Determine if the call was successful based on the objectives inferred from the system prompt. DO NOT return anything except the result.\n\nRubric:\\n{{rubric}}\n\nOnly respond with the result."
    ///   },
    ///   {
    ///     "role": "user",
    ///     "content": "Here is the transcript:\n\n{{transcript}}\n\n"
    ///   },
    ///   {
    ///     "role": "user",
    ///     "content": "Here was the system prompt of the call:\n\n{{systemPrompt}}\n\n. Here is the ended reason of the call:\n\n{{endedReason}}\n\n"
    ///   }
    /// ]```
    /// 
    /// You can customize by providing any messages you want.
    /// 
    /// Here are the template variables available:
    /// - {{transcript}}: the transcript of the call from `call.artifact.transcript`- {{systemPrompt}}: the system prompt of the call from `assistant.model.messages[type=system].content`- {{messages}}: the messages of the call from `assistant.model.messages`- {{rubric}}: the rubric of the success evaluation from `successEvaluationPlan.rubric`- {{endedReason}}: the ended reason of the call from `call.endedReason`
    public let messages: [[String: JSONValue]]?
    /// This determines whether a success evaluation is generated and stored in `call.analysis.successEvaluation`. Defaults to true.
    /// 
    /// Usage:
    /// - If you want to disable the success evaluation, set this to false.
    /// 
    /// @default true
    public let enabled: Bool?
    /// This is how long the request is tried before giving up. When request times out, `call.analysis.successEvaluation` will be empty.
    /// 
    /// Usage:
    /// - To guarantee the success evaluation is generated, set this value high. Note, this will delay the end of call report in cases where model is slow to respond.
    /// 
    /// @default 5 seconds
    public let timeoutSeconds: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        rubric: SuccessEvaluationPlanRubric? = nil,
        messages: [[String: JSONValue]]? = nil,
        enabled: Bool? = nil,
        timeoutSeconds: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.rubric = rubric
        self.messages = messages
        self.enabled = enabled
        self.timeoutSeconds = timeoutSeconds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rubric = try container.decodeIfPresent(SuccessEvaluationPlanRubric.self, forKey: .rubric)
        self.messages = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .messages)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.rubric, forKey: .rubric)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case rubric
        case messages
        case enabled
        case timeoutSeconds
    }
}
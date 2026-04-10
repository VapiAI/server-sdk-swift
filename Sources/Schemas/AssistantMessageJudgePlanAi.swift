import Foundation

public struct AssistantMessageJudgePlanAi: Codable, Hashable, Sendable {
    /// This is the model to use for the LLM-as-a-judge.
    /// If not provided, will default to the assistant's model.
    /// 
    /// The instructions on how to evaluate the model output with this LLM-Judge must be passed as a system message in the messages array of the model.
    /// 
    /// The Mock conversation can be passed to the LLM-Judge to evaluate using the prompt {{messages}} and will be evaluated as a LiquidJS Variable. To access and judge only the last message, use {{messages[-1]}}
    /// 
    /// The LLM-Judge must respond with "pass" or "fail" and only those two responses are allowed.
    public let model: AssistantMessageJudgePlanAiModel
    /// This is the type of the judge plan.
    /// Use 'ai' to evaluate the assistant message content using LLM-as-a-judge.
    /// @default 'ai'
    public let type: AssistantMessageJudgePlanAiType
    /// This is the flag to enable automatically adding the liquid variable {{messages}} to the model's messages array
    /// This is only applicable if the user has not provided any messages in the model's messages array
    /// @default true
    public let autoIncludeMessageHistory: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: AssistantMessageJudgePlanAiModel,
        type: AssistantMessageJudgePlanAiType,
        autoIncludeMessageHistory: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.type = type
        self.autoIncludeMessageHistory = autoIncludeMessageHistory
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decode(AssistantMessageJudgePlanAiModel.self, forKey: .model)
        self.type = try container.decode(AssistantMessageJudgePlanAiType.self, forKey: .type)
        self.autoIncludeMessageHistory = try container.decodeIfPresent(Bool.self, forKey: .autoIncludeMessageHistory)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.autoIncludeMessageHistory, forKey: .autoIncludeMessageHistory)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case type
        case autoIncludeMessageHistory
    }
}
import Foundation

public struct OpenAiReasoner: Codable, Hashable, Sendable {
    /// The reasoner uses OpenAI. Omit to use OpenAI.
    public let provider: OpenAiReasonerProvider?
    /// The delegated reasoning model. Omit to use GPT-5.6 Terra.
    public let model: OpenAiReasonerModel?
    /// Higher effort can increase response time. Omit to use low.
    public let reasoningEffort: OpenAiReasonerReasoningEffort?
    /// Complete reasoner instructions. An explicit empty string is preserved.
    /// Omit to use Vapi's default reasoner instructions. No behavioral instructions
    /// are appended to a custom prompt.
    public let instructions: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: OpenAiReasonerProvider? = nil,
        model: OpenAiReasonerModel? = nil,
        reasoningEffort: OpenAiReasonerReasoningEffort? = nil,
        instructions: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.model = model
        self.reasoningEffort = reasoningEffort
        self.instructions = instructions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decodeIfPresent(OpenAiReasonerProvider.self, forKey: .provider)
        self.model = try container.decodeIfPresent(OpenAiReasonerModel.self, forKey: .model)
        self.reasoningEffort = try container.decodeIfPresent(OpenAiReasonerReasoningEffort.self, forKey: .reasoningEffort)
        self.instructions = try container.decodeIfPresent(String.self, forKey: .instructions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.reasoningEffort, forKey: .reasoningEffort)
        try container.encodeIfPresent(self.instructions, forKey: .instructions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case model
        case reasoningEffort
        case instructions
    }
}
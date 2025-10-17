import Foundation

public struct CostBreakdown: Codable, Hashable, Sendable {
    /// This is the cost of the transport provider, like Twilio or Vonage.
    public let transport: Double?
    /// This is the cost of the speech-to-text service.
    public let stt: Double?
    /// This is the cost of the language model.
    public let llm: Double?
    /// This is the cost of the text-to-speech service.
    public let tts: Double?
    /// This is the cost of Vapi.
    public let vapi: Double?
    /// This is the cost of chat interactions.
    public let chat: Double?
    /// This is the total cost of the call.
    public let total: Double?
    /// This is the LLM prompt tokens used for the call.
    public let llmPromptTokens: Double?
    /// This is the LLM completion tokens used for the call.
    public let llmCompletionTokens: Double?
    /// This is the TTS characters used for the call.
    public let ttsCharacters: Double?
    /// This is the cost of the analysis.
    public let analysisCostBreakdown: AnalysisCostBreakdown?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        transport: Double? = nil,
        stt: Double? = nil,
        llm: Double? = nil,
        tts: Double? = nil,
        vapi: Double? = nil,
        chat: Double? = nil,
        total: Double? = nil,
        llmPromptTokens: Double? = nil,
        llmCompletionTokens: Double? = nil,
        ttsCharacters: Double? = nil,
        analysisCostBreakdown: AnalysisCostBreakdown? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.transport = transport
        self.stt = stt
        self.llm = llm
        self.tts = tts
        self.vapi = vapi
        self.chat = chat
        self.total = total
        self.llmPromptTokens = llmPromptTokens
        self.llmCompletionTokens = llmCompletionTokens
        self.ttsCharacters = ttsCharacters
        self.analysisCostBreakdown = analysisCostBreakdown
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transport = try container.decodeIfPresent(Double.self, forKey: .transport)
        self.stt = try container.decodeIfPresent(Double.self, forKey: .stt)
        self.llm = try container.decodeIfPresent(Double.self, forKey: .llm)
        self.tts = try container.decodeIfPresent(Double.self, forKey: .tts)
        self.vapi = try container.decodeIfPresent(Double.self, forKey: .vapi)
        self.chat = try container.decodeIfPresent(Double.self, forKey: .chat)
        self.total = try container.decodeIfPresent(Double.self, forKey: .total)
        self.llmPromptTokens = try container.decodeIfPresent(Double.self, forKey: .llmPromptTokens)
        self.llmCompletionTokens = try container.decodeIfPresent(Double.self, forKey: .llmCompletionTokens)
        self.ttsCharacters = try container.decodeIfPresent(Double.self, forKey: .ttsCharacters)
        self.analysisCostBreakdown = try container.decodeIfPresent(AnalysisCostBreakdown.self, forKey: .analysisCostBreakdown)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.transport, forKey: .transport)
        try container.encodeIfPresent(self.stt, forKey: .stt)
        try container.encodeIfPresent(self.llm, forKey: .llm)
        try container.encodeIfPresent(self.tts, forKey: .tts)
        try container.encodeIfPresent(self.vapi, forKey: .vapi)
        try container.encodeIfPresent(self.chat, forKey: .chat)
        try container.encodeIfPresent(self.total, forKey: .total)
        try container.encodeIfPresent(self.llmPromptTokens, forKey: .llmPromptTokens)
        try container.encodeIfPresent(self.llmCompletionTokens, forKey: .llmCompletionTokens)
        try container.encodeIfPresent(self.ttsCharacters, forKey: .ttsCharacters)
        try container.encodeIfPresent(self.analysisCostBreakdown, forKey: .analysisCostBreakdown)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case transport
        case stt
        case llm
        case tts
        case vapi
        case chat
        case total
        case llmPromptTokens
        case llmCompletionTokens
        case ttsCharacters
        case analysisCostBreakdown
    }
}
import Foundation

public struct GoogleRealtimeConfig: Codable, Hashable, Sendable {
    /// This is the nucleus sampling parameter that controls the cumulative probability of tokens considered during text generation.
    /// Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    public let topP: Double?
    /// This is the top-k sampling parameter that limits the number of highest probability tokens considered during text generation.
    /// Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    public let topK: Double?
    /// This is the presence penalty parameter that influences the model's likelihood to repeat information by penalizing tokens based on their presence in the text.
    /// Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    public let presencePenalty: Double?
    /// This is the frequency penalty parameter that influences the model's likelihood to repeat tokens by penalizing them based on their frequency in the text.
    /// Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    public let frequencyPenalty: Double?
    /// This is the speech configuration object that defines the voice settings to be used for the model's speech output.
    /// Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    public let speechConfig: GeminiMultimodalLiveSpeechConfig?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        topP: Double? = nil,
        topK: Double? = nil,
        presencePenalty: Double? = nil,
        frequencyPenalty: Double? = nil,
        speechConfig: GeminiMultimodalLiveSpeechConfig? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.topP = topP
        self.topK = topK
        self.presencePenalty = presencePenalty
        self.frequencyPenalty = frequencyPenalty
        self.speechConfig = speechConfig
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.topP = try container.decodeIfPresent(Double.self, forKey: .topP)
        self.topK = try container.decodeIfPresent(Double.self, forKey: .topK)
        self.presencePenalty = try container.decodeIfPresent(Double.self, forKey: .presencePenalty)
        self.frequencyPenalty = try container.decodeIfPresent(Double.self, forKey: .frequencyPenalty)
        self.speechConfig = try container.decodeIfPresent(GeminiMultimodalLiveSpeechConfig.self, forKey: .speechConfig)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.topP, forKey: .topP)
        try container.encodeIfPresent(self.topK, forKey: .topK)
        try container.encodeIfPresent(self.presencePenalty, forKey: .presencePenalty)
        try container.encodeIfPresent(self.frequencyPenalty, forKey: .frequencyPenalty)
        try container.encodeIfPresent(self.speechConfig, forKey: .speechConfig)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case topP
        case topK
        case presencePenalty
        case frequencyPenalty
        case speechConfig
    }
}
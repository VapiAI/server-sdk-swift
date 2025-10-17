import Foundation

public struct TranscriptionEndpointingPlan: Codable, Hashable, Sendable {
    /// The minimum number of seconds to wait after transcription ending with punctuation before sending a request to the model. Defaults to 0.1.
    /// 
    /// This setting exists because the transcriber punctuates the transcription when it's more confident that customer has completed a thought.
    /// 
    /// @default 0.1
    public let onPunctuationSeconds: Double?
    /// The minimum number of seconds to wait after transcription ending without punctuation before sending a request to the model. Defaults to 1.5.
    /// 
    /// This setting exists to catch the cases where the transcriber was not confident enough to punctuate the transcription, but the customer is done and has been silent for a long time.
    /// 
    /// @default 1.5
    public let onNoPunctuationSeconds: Double?
    /// The minimum number of seconds to wait after transcription ending with a number before sending a request to the model. Defaults to 0.4.
    /// 
    /// This setting exists because the transcriber will sometimes punctuate the transcription ending with a number, even though the customer hasn't uttered the full number. This happens commonly for long numbers when the customer reads the number in chunks.
    /// 
    /// @default 0.5
    public let onNumberSeconds: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        onPunctuationSeconds: Double? = nil,
        onNoPunctuationSeconds: Double? = nil,
        onNumberSeconds: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.onPunctuationSeconds = onPunctuationSeconds
        self.onNoPunctuationSeconds = onNoPunctuationSeconds
        self.onNumberSeconds = onNumberSeconds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.onPunctuationSeconds = try container.decodeIfPresent(Double.self, forKey: .onPunctuationSeconds)
        self.onNoPunctuationSeconds = try container.decodeIfPresent(Double.self, forKey: .onNoPunctuationSeconds)
        self.onNumberSeconds = try container.decodeIfPresent(Double.self, forKey: .onNumberSeconds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.onPunctuationSeconds, forKey: .onPunctuationSeconds)
        try container.encodeIfPresent(self.onNoPunctuationSeconds, forKey: .onNoPunctuationSeconds)
        try container.encodeIfPresent(self.onNumberSeconds, forKey: .onNumberSeconds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case onPunctuationSeconds
        case onNoPunctuationSeconds
        case onNumberSeconds
    }
}
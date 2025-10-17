import Foundation

public struct StopSpeakingPlan: Codable, Hashable, Sendable {
    /// This is the number of words that the customer has to say before the assistant will stop talking.
    /// 
    /// Words like "stop", "actually", "no", etc. will always interrupt immediately regardless of this value.
    /// 
    /// Words like "okay", "yeah", "right" will never interrupt.
    /// 
    /// When set to 0, `voiceSeconds` is used in addition to the transcriptions to determine the customer has started speaking.
    /// 
    /// Defaults to 0.
    /// 
    /// @default 0
    public let numWords: Double?
    /// This is the seconds customer has to speak before the assistant stops talking. This uses the VAD (Voice Activity Detection) spike to determine if the customer has started speaking.
    /// 
    /// Considerations:
    /// - A lower value might be more responsive but could potentially pick up non-speech sounds.
    /// - A higher value reduces false positives but might slightly delay the detection of speech onset.
    /// 
    /// This is only used if `numWords` is set to 0.
    /// 
    /// Defaults to 0.2
    /// 
    /// @default 0.2
    public let voiceSeconds: Double?
    /// This is the seconds to wait before the assistant will start talking again after being interrupted.
    /// 
    /// Defaults to 1.
    /// 
    /// @default 1
    public let backoffSeconds: Double?
    /// These are the phrases that will never interrupt the assistant, even if numWords threshold is met.
    /// These are typically acknowledgement or backchanneling phrases.
    public let acknowledgementPhrases: [String]?
    /// These are the phrases that will always interrupt the assistant immediately, regardless of numWords.
    /// These are typically phrases indicating disagreement or desire to stop.
    public let interruptionPhrases: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        numWords: Double? = nil,
        voiceSeconds: Double? = nil,
        backoffSeconds: Double? = nil,
        acknowledgementPhrases: [String]? = nil,
        interruptionPhrases: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.numWords = numWords
        self.voiceSeconds = voiceSeconds
        self.backoffSeconds = backoffSeconds
        self.acknowledgementPhrases = acknowledgementPhrases
        self.interruptionPhrases = interruptionPhrases
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.numWords = try container.decodeIfPresent(Double.self, forKey: .numWords)
        self.voiceSeconds = try container.decodeIfPresent(Double.self, forKey: .voiceSeconds)
        self.backoffSeconds = try container.decodeIfPresent(Double.self, forKey: .backoffSeconds)
        self.acknowledgementPhrases = try container.decodeIfPresent([String].self, forKey: .acknowledgementPhrases)
        self.interruptionPhrases = try container.decodeIfPresent([String].self, forKey: .interruptionPhrases)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.numWords, forKey: .numWords)
        try container.encodeIfPresent(self.voiceSeconds, forKey: .voiceSeconds)
        try container.encodeIfPresent(self.backoffSeconds, forKey: .backoffSeconds)
        try container.encodeIfPresent(self.acknowledgementPhrases, forKey: .acknowledgementPhrases)
        try container.encodeIfPresent(self.interruptionPhrases, forKey: .interruptionPhrases)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case numWords
        case voiceSeconds
        case backoffSeconds
        case acknowledgementPhrases
        case interruptionPhrases
    }
}
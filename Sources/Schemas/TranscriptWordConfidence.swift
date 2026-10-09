import Foundation

public struct TranscriptWordConfidence: Codable, Hashable, Sendable {
    /// The word as the transcriber recognised it.
    public let word: String
    /// Offset at which the word begins, measured from the start of the
    /// transcriber stream (ElevenLabs, which transcribes each utterance as its
    /// own request, measures from the start of that utterance's audio). The unit
    /// is transcriber-specific today: seconds for Deepgram, Soniox, Gladia and
    /// ElevenLabs realtime (`scribe_v2_realtime`); milliseconds for AssemblyAI,
    /// ElevenLabs HTTP Scribe and Google. Transcribers without per-word timing
    /// emit a placeholder, typically `0`.
    public let start: Double
    /// Offset at which the word ends, with the same origin and unit as `start`.
    public let end: Double
    /// The transcriber's confidence for this word, in [0, 1]. Transcribers that
    /// report no per-word score, or whose stream does not map one (Cartesia,
    /// ElevenLabs HTTP Scribe, Google, Talkscriber and custom transcribers), emit
    /// `1` for every word; that placeholder is not a measurement. ElevenLabs
    /// realtime passes through its token log-probability, which is not a [0, 1]
    /// confidence.
    public let confidence: Double
    /// The word with punctuation and casing applied, when the transcriber
    /// reports a punctuated form. The snake_case name deliberately mirrors the
    /// transcriber wire spelling already stored on every existing message;
    /// renaming it would break stored data.
    public let punctuatedWord: String?
    /// The language the transcriber detected for this word, when it reports one.
    public let language: String?
    /// The diarized speaker index this word was attributed to, when the
    /// transcriber reports one.
    public let speaker: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        word: String,
        start: Double,
        end: Double,
        confidence: Double,
        punctuatedWord: String? = nil,
        language: String? = nil,
        speaker: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.word = word
        self.start = start
        self.end = end
        self.confidence = confidence
        self.punctuatedWord = punctuatedWord
        self.language = language
        self.speaker = speaker
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.word = try container.decode(String.self, forKey: .word)
        self.start = try container.decode(Double.self, forKey: .start)
        self.end = try container.decode(Double.self, forKey: .end)
        self.confidence = try container.decode(Double.self, forKey: .confidence)
        self.punctuatedWord = try container.decodeIfPresent(String.self, forKey: .punctuatedWord)
        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.speaker = try container.decodeIfPresent(Double.self, forKey: .speaker)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.word, forKey: .word)
        try container.encode(self.start, forKey: .start)
        try container.encode(self.end, forKey: .end)
        try container.encode(self.confidence, forKey: .confidence)
        try container.encodeIfPresent(self.punctuatedWord, forKey: .punctuatedWord)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.speaker, forKey: .speaker)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case word
        case start
        case end
        case confidence
        case punctuatedWord = "punctuated_word"
        case language
        case speaker
    }
}
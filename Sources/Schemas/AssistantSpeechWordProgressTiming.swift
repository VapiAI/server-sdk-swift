import Foundation

public struct AssistantSpeechWordProgressTiming: Codable, Hashable, Sendable {
    /// Number of words spoken so far in this turn.
    public let wordsSpoken: Double
    /// Total number of words sent to the TTS provider for this turn.
    /// 
    /// **Important**: this value grows across events within a single turn because
    /// Minimax synthesizes audio incrementally as the LLM streams tokens. Treat
    /// it as "best known total so far" — it will stabilize once synthesis is
    /// complete.
    /// 
    /// A value of `0` is a valid sentinel meaning "not yet known". This can occur
    /// on the very first `assistant-speech` event of a turn if audio begins
    /// playing before the TTS provider has confirmed word-count data. Clients
    /// **must** guard against divide-by-zero when computing a progress fraction:
    /// 
    /// ```ts
    /// const pct = totalWords > 0 ? wordsSpoken / totalWords : 0;
    /// ```
    public let totalWords: Double
    /// The text of the latest spoken segment (sentence or clause). Use this
    /// for caption display — it corresponds to the chunk just confirmed by
    /// the TTS provider, unlike `text` on the parent message which carries
    /// the full turn text.
    public let segment: String?
    /// Audio duration in milliseconds for the latest spoken segment. Pair
    /// with `segment` to animate karaoke-style word reveals — divide the
    /// segment text across this duration for approximate per-word timing.
    public let segmentDurationMs: Double?
    /// Per-word timestamps for the latest spoken segment. Available when the
    /// TTS provider supports word-level timing (e.g. Minimax with
    /// subtitle_type: "word"). Syllables from the provider are aggregated
    /// into whole words with start/end times relative to the segment start.
    /// 
    /// Use these for precise karaoke-style highlighting instead of
    /// interpolating from segmentDurationMs.
    public let words: [AssistantSpeechWordTimestamp]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        wordsSpoken: Double,
        totalWords: Double,
        segment: String? = nil,
        segmentDurationMs: Double? = nil,
        words: [AssistantSpeechWordTimestamp]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.wordsSpoken = wordsSpoken
        self.totalWords = totalWords
        self.segment = segment
        self.segmentDurationMs = segmentDurationMs
        self.words = words
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.wordsSpoken = try container.decode(Double.self, forKey: .wordsSpoken)
        self.totalWords = try container.decode(Double.self, forKey: .totalWords)
        self.segment = try container.decodeIfPresent(String.self, forKey: .segment)
        self.segmentDurationMs = try container.decodeIfPresent(Double.self, forKey: .segmentDurationMs)
        self.words = try container.decodeIfPresent([AssistantSpeechWordTimestamp].self, forKey: .words)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.wordsSpoken, forKey: .wordsSpoken)
        try container.encode(self.totalWords, forKey: .totalWords)
        try container.encodeIfPresent(self.segment, forKey: .segment)
        try container.encodeIfPresent(self.segmentDurationMs, forKey: .segmentDurationMs)
        try container.encodeIfPresent(self.words, forKey: .words)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case wordsSpoken
        case totalWords
        case segment
        case segmentDurationMs
        case words
    }
}
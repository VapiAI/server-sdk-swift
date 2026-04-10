import Foundation

public struct AssistantSpeechWordAlignmentTiming: Codable, Hashable, Sendable {
    /// The individual words in this audio segment.
    public let words: [String]
    /// Start time in milliseconds for each word (parallel to `words`).
    public let wordsStartTimesMs: [Double]
    /// End time in milliseconds for each word (parallel to `words`).
    public let wordsEndTimesMs: [Double]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        words: [String],
        wordsStartTimesMs: [Double],
        wordsEndTimesMs: [Double],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.words = words
        self.wordsStartTimesMs = wordsStartTimesMs
        self.wordsEndTimesMs = wordsEndTimesMs
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.words = try container.decode([String].self, forKey: .words)
        self.wordsStartTimesMs = try container.decode([Double].self, forKey: .wordsStartTimesMs)
        self.wordsEndTimesMs = try container.decode([Double].self, forKey: .wordsEndTimesMs)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.words, forKey: .words)
        try container.encode(self.wordsStartTimesMs, forKey: .wordsStartTimesMs)
        try container.encode(self.wordsEndTimesMs, forKey: .wordsEndTimesMs)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case words
        case wordsStartTimesMs
        case wordsEndTimesMs
    }
}
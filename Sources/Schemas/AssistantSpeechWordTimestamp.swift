import Foundation

public struct AssistantSpeechWordTimestamp: Codable, Hashable, Sendable {
    /// The full word text (syllables aggregated into complete words).
    public let word: String
    /// Start time in milliseconds relative to the segment start.
    public let startMs: Double
    /// End time in milliseconds relative to the segment start.
    public let endMs: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        word: String,
        startMs: Double,
        endMs: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.word = word
        self.startMs = startMs
        self.endMs = endMs
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.word = try container.decode(String.self, forKey: .word)
        self.startMs = try container.decode(Double.self, forKey: .startMs)
        self.endMs = try container.decode(Double.self, forKey: .endMs)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.word, forKey: .word)
        try container.encode(self.startMs, forKey: .startMs)
        try container.encode(self.endMs, forKey: .endMs)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case word
        case startMs
        case endMs
    }
}
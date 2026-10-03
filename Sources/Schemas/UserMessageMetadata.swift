import Foundation

public struct UserMessageMetadata: Codable, Hashable, Sendable {
    /// Per-word confidence scores from the transcriber. After consecutive
    /// transcript fragments are merged into one message the list covers the whole
    /// merged message, or is absent when any fragment lacked word scores.
    public let wordLevelConfidence: [TranscriptWordConfidence]?
    /// Marks a message injected out-of-band rather than produced by the
    /// transcriber (e.g. an inbound SMS relayed into the conversation).
    public let type: String?
    /// The channel or address the out-of-band message arrived from (e.g. the
    /// sender's phone number for an SMS).
    public let source: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        wordLevelConfidence: [TranscriptWordConfidence]? = nil,
        type: String? = nil,
        source: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.wordLevelConfidence = wordLevelConfidence
        self.type = type
        self.source = source
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.wordLevelConfidence = try container.decodeIfPresent([TranscriptWordConfidence].self, forKey: .wordLevelConfidence)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.wordLevelConfidence, forKey: .wordLevelConfidence)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.source, forKey: .source)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case wordLevelConfidence
        case type
        case source
    }
}
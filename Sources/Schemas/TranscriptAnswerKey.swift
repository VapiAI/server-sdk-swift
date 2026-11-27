import Foundation

public struct TranscriptAnswerKey: Codable, Hashable, Sendable {
    /// This is the verbatim transcript of everything the recording contains. A
    /// mixed recording of both parties needs both parties' words, in order. At
    /// most 30,000 words.
    public let transcript: String
    /// These are values the transcript must carry, each scored exact, near or
    /// missed.
    public let keyValues: [TranscriptKeyValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        transcript: String,
        keyValues: [TranscriptKeyValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.transcript = transcript
        self.keyValues = keyValues
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transcript = try container.decode(String.self, forKey: .transcript)
        self.keyValues = try container.decodeIfPresent([TranscriptKeyValue].self, forKey: .keyValues)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.transcript, forKey: .transcript)
        try container.encodeIfPresent(self.keyValues, forKey: .keyValues)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case transcript
        case keyValues
    }
}
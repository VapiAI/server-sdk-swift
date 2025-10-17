import Foundation

public struct CreateSesameVoiceDto: Codable, Hashable, Sendable {
    /// The name of the voice.
    public let voiceName: String?
    /// The transcript of the utterance.
    public let transcription: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        voiceName: String? = nil,
        transcription: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.voiceName = voiceName
        self.transcription = transcription
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.voiceName = try container.decodeIfPresent(String.self, forKey: .voiceName)
        self.transcription = try container.decodeIfPresent(String.self, forKey: .transcription)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.voiceName, forKey: .voiceName)
        try container.encodeIfPresent(self.transcription, forKey: .transcription)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case voiceName
        case transcription
    }
}
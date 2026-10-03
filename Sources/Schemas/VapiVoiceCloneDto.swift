import Foundation

public struct VapiVoiceCloneDto: Codable, Hashable, Sendable {
    /// Display name for the cloned voice.
    public let name: String
    /// Optional language (ISO-639 / BCP-47). When omitted, xAI infers it from the
    /// reference audio.
    public let language: String?
    /// Reference audio to clone the voice from (up to 120 seconds). Supported formats: MP3, WAV, OGG/Opus, WebM, AAC, M4A, FLAC, WMA.
    public let files: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        language: String? = nil,
        files: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.language = language
        self.files = files
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.files = try container.decode([String].self, forKey: .files)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encode(self.files, forKey: .files)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case language
        case files
    }
}
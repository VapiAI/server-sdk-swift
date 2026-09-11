import Foundation

public struct CreateSesameVoiceDto: Codable, Hashable, Sendable {
    /// This is the audio file of the utterance to clone the voice from.
    /// Consumed by multer via FileInterceptor('file'), so it never reaches
    /// class-validator; declared here (like CreateFileDTO.file) so the OpenAPI
    /// spec is truthful about the multipart request body.
    public let file: String
    /// The name of the voice.
    public let voiceName: String
    /// The transcript of the utterance.
    public let transcription: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        file: String,
        voiceName: String,
        transcription: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.file = file
        self.voiceName = voiceName
        self.transcription = transcription
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.file = try container.decode(String.self, forKey: .file)
        self.voiceName = try container.decode(String.self, forKey: .voiceName)
        self.transcription = try container.decode(String.self, forKey: .transcription)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.file, forKey: .file)
        try container.encode(self.voiceName, forKey: .voiceName)
        try container.encode(self.transcription, forKey: .transcription)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case file
        case voiceName
        case transcription
    }
}
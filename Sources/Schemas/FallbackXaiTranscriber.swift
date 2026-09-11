import Foundation

public struct FallbackXaiTranscriber: Codable, Hashable, Sendable {
    /// The xAI speech-to-text model to use. xAI currently exposes a single STT model — placeholder for future model selection.
    public let model: FallbackXaiTranscriberModel?
    /// Single language for transcription as an ISO 639-1 code (e.g., `en`, `es`). Defaults to `en` if not set. xAI auto-detects when omitted via the API but Vapi defaults to English for deterministic behavior.
    public let language: FallbackXaiTranscriberLanguage?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: FallbackXaiTranscriberModel? = nil,
        language: FallbackXaiTranscriberLanguage? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.language = language
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(FallbackXaiTranscriberModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(FallbackXaiTranscriberLanguage.self, forKey: .language)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case language
    }
}
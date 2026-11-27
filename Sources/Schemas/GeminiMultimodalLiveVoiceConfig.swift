import Foundation

/// Voice selection configuration for Gemini Multimodal Live.
public struct GeminiMultimodalLiveVoiceConfig: Codable, Hashable, Sendable {
    /// Prebuilt voice used for Gemini Multimodal Live speech output.
    public let prebuiltVoiceConfig: GeminiMultimodalLivePrebuiltVoiceConfig
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        prebuiltVoiceConfig: GeminiMultimodalLivePrebuiltVoiceConfig,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.prebuiltVoiceConfig = prebuiltVoiceConfig
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.prebuiltVoiceConfig = try container.decode(GeminiMultimodalLivePrebuiltVoiceConfig.self, forKey: .prebuiltVoiceConfig)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.prebuiltVoiceConfig, forKey: .prebuiltVoiceConfig)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case prebuiltVoiceConfig
    }
}
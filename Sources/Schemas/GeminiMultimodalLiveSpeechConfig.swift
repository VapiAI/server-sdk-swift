import Foundation

public struct GeminiMultimodalLiveSpeechConfig: Codable, Hashable, Sendable {
    public let voiceConfig: GeminiMultimodalLiveVoiceConfig
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        voiceConfig: GeminiMultimodalLiveVoiceConfig,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.voiceConfig = voiceConfig
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.voiceConfig = try container.decode(GeminiMultimodalLiveVoiceConfig.self, forKey: .voiceConfig)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.voiceConfig, forKey: .voiceConfig)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case voiceConfig
    }
}
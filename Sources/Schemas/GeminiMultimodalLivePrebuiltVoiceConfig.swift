import Foundation

public struct GeminiMultimodalLivePrebuiltVoiceConfig: Codable, Hashable, Sendable {
    public let voiceName: GeminiMultimodalLivePrebuiltVoiceConfigVoiceName
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        voiceName: GeminiMultimodalLivePrebuiltVoiceConfigVoiceName,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.voiceName = voiceName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.voiceName = try container.decode(GeminiMultimodalLivePrebuiltVoiceConfigVoiceName.self, forKey: .voiceName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.voiceName, forKey: .voiceName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case voiceName
    }
}
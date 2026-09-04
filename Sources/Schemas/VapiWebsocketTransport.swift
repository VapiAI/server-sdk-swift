import Foundation

public struct VapiWebsocketTransport: Codable, Hashable, Sendable {
    /// This is the conversation type of the call (ie, voice or chat).
    public let conversationType: VapiWebsocketTransportConversationType?
    /// This is the audio format of the call. Defaults to 16KHz raw pcm_s16le
    public let audioFormat: AudioFormat?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conversationType: VapiWebsocketTransportConversationType? = nil,
        audioFormat: AudioFormat? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conversationType = conversationType
        self.audioFormat = audioFormat
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conversationType = try container.decodeIfPresent(VapiWebsocketTransportConversationType.self, forKey: .conversationType)
        self.audioFormat = try container.decodeIfPresent(AudioFormat.self, forKey: .audioFormat)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.conversationType, forKey: .conversationType)
        try container.encodeIfPresent(self.audioFormat, forKey: .audioFormat)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conversationType
        case audioFormat
    }
}
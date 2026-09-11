import Foundation

public struct AudioFormat: Codable, Hashable, Sendable {
    /// This is the sample rate of the call.
    /// 
    /// @default 16000
    public let sampleRate: Double
    /// This is the audio format of the call.
    /// 
    /// @default 'pcm_s16le'
    public let format: [String: JSONValue]
    /// This is the container format of the call.
    /// 
    /// @default 'raw'
    public let container: AudioFormatContainer?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        sampleRate: Double,
        format: [String: JSONValue],
        container: AudioFormatContainer? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.sampleRate = sampleRate
        self.format = format
        self.container = container
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sampleRate = try container.decode(Double.self, forKey: .sampleRate)
        self.format = try container.decode([String: JSONValue].self, forKey: .format)
        self.container = try container.decodeIfPresent(AudioFormatContainer.self, forKey: .container)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.sampleRate, forKey: .sampleRate)
        try container.encode(self.format, forKey: .format)
        try container.encodeIfPresent(self.container, forKey: .container)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case sampleRate
        case format
        case container
    }
}
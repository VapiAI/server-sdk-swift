import Foundation

public struct NeetsVoice: Codable, Hashable, Sendable {
    public let voiceId: JSONValue?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        voiceId: JSONValue? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.voiceId = voiceId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.voiceId = try container.decodeIfPresent(JSONValue.self, forKey: .voiceId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.voiceId, forKey: .voiceId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case voiceId
    }
}
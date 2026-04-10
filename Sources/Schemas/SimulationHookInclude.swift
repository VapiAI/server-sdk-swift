import Foundation

public struct SimulationHookInclude: Codable, Hashable, Sendable {
    /// Include transcript in the hook payload
    public let transcript: Bool?
    /// Include messages in the hook payload
    public let messages: Bool?
    /// Include recordingUrl in the hook payload
    public let recordingUrl: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        transcript: Bool? = nil,
        messages: Bool? = nil,
        recordingUrl: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.transcript = transcript
        self.messages = messages
        self.recordingUrl = recordingUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transcript = try container.decodeIfPresent(Bool.self, forKey: .transcript)
        self.messages = try container.decodeIfPresent(Bool.self, forKey: .messages)
        self.recordingUrl = try container.decodeIfPresent(Bool.self, forKey: .recordingUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.transcript, forKey: .transcript)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.recordingUrl, forKey: .recordingUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case transcript
        case messages
        case recordingUrl
    }
}
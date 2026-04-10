import Foundation

public struct SimulationRunItemCallMetadata: Codable, Hashable, Sendable {
    /// This is the transcript of the conversation.
    public let transcript: String?
    /// This is the list of conversation messages in OpenAI format.
    public let messages: [[String: JSONValue]]?
    /// This is the URL to the call recording.
    public let recordingUrl: String?
    /// This is the call monitoring data (live listen URL).
    public let monitor: SimulationRunItemCallMonitor?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        transcript: String? = nil,
        messages: [[String: JSONValue]]? = nil,
        recordingUrl: String? = nil,
        monitor: SimulationRunItemCallMonitor? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.transcript = transcript
        self.messages = messages
        self.recordingUrl = recordingUrl
        self.monitor = monitor
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transcript = try container.decodeIfPresent(String.self, forKey: .transcript)
        self.messages = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .messages)
        self.recordingUrl = try container.decodeIfPresent(String.self, forKey: .recordingUrl)
        self.monitor = try container.decodeIfPresent(SimulationRunItemCallMonitor.self, forKey: .monitor)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.transcript, forKey: .transcript)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.recordingUrl, forKey: .recordingUrl)
        try container.encodeIfPresent(self.monitor, forKey: .monitor)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case transcript
        case messages
        case recordingUrl
        case monitor
    }
}
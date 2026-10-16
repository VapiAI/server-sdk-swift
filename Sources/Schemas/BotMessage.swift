import Foundation

/// An assistant-authored entry in the call message history, including content, timing, source, and duration.
public struct BotMessage: Codable, Hashable, Sendable {
    /// The role of the bot in the conversation.
    public let role: String
    /// The message content from the bot.
    public let message: String
    /// The timestamp when the message was sent.
    public let time: Double
    /// The timestamp when the message ended.
    public let endTime: Double
    /// The number of seconds from the start of the conversation.
    public let secondsFromStart: Double
    /// The source of the message.
    public let source: String?
    /// The duration of the message in seconds.
    public let duration: Double?
    /// The name of the assistant that produced this message. In a squad or
    /// handoff call this is the specific sub-agent active when the message was
    /// spoken, letting the transcript label each message by speaker.
    public let assistantName: String?
    /// The ID of the assistant that produced this message. Stable reference for
    /// the assistant named in `assistantName`.
    public let assistantId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        role: String,
        message: String,
        time: Double,
        endTime: Double,
        secondsFromStart: Double,
        source: String? = nil,
        duration: Double? = nil,
        assistantName: String? = nil,
        assistantId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.role = role
        self.message = message
        self.time = time
        self.endTime = endTime
        self.secondsFromStart = secondsFromStart
        self.source = source
        self.duration = duration
        self.assistantName = assistantName
        self.assistantId = assistantId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.role = try container.decode(String.self, forKey: .role)
        self.message = try container.decode(String.self, forKey: .message)
        self.time = try container.decode(Double.self, forKey: .time)
        self.endTime = try container.decode(Double.self, forKey: .endTime)
        self.secondsFromStart = try container.decode(Double.self, forKey: .secondsFromStart)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.duration = try container.decodeIfPresent(Double.self, forKey: .duration)
        self.assistantName = try container.decodeIfPresent(String.self, forKey: .assistantName)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.time, forKey: .time)
        try container.encode(self.endTime, forKey: .endTime)
        try container.encode(self.secondsFromStart, forKey: .secondsFromStart)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.duration, forKey: .duration)
        try container.encodeIfPresent(self.assistantName, forKey: .assistantName)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case message
        case time
        case endTime
        case secondsFromStart
        case source
        case duration
        case assistantName
        case assistantId
    }
}
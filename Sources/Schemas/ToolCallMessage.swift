import Foundation

public struct ToolCallMessage: Codable, Hashable, Sendable {
    /// The role of the tool call in the conversation.
    public let role: String
    /// The list of tool calls made during the conversation.
    public let toolCalls: [[String: JSONValue]]
    /// The message content for the tool call.
    public let message: String
    /// The timestamp when the message was sent.
    public let time: Double
    /// The number of seconds from the start of the conversation.
    public let secondsFromStart: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        role: String,
        toolCalls: [[String: JSONValue]],
        message: String,
        time: Double,
        secondsFromStart: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.role = role
        self.toolCalls = toolCalls
        self.message = message
        self.time = time
        self.secondsFromStart = secondsFromStart
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.role = try container.decode(String.self, forKey: .role)
        self.toolCalls = try container.decode([[String: JSONValue]].self, forKey: .toolCalls)
        self.message = try container.decode(String.self, forKey: .message)
        self.time = try container.decode(Double.self, forKey: .time)
        self.secondsFromStart = try container.decode(Double.self, forKey: .secondsFromStart)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.toolCalls, forKey: .toolCalls)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.time, forKey: .time)
        try container.encode(self.secondsFromStart, forKey: .secondsFromStart)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case toolCalls
        case message
        case time
        case secondsFromStart
    }
}
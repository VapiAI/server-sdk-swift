import Foundation

/// An entry in the call message history that records the result and metadata for a completed tool call.
public struct ToolCallResultMessage: Codable, Hashable, Sendable {
    /// The role of the tool call result in the conversation.
    public let role: String
    /// The ID of the tool call.
    public let toolCallId: String
    /// The name of the tool that returned the result.
    public let name: String
    /// The result of the tool call in JSON format.
    public let result: String
    /// The timestamp when the message was sent.
    public let time: Double
    /// The number of seconds from the start of the conversation.
    public let secondsFromStart: Double
    /// The metadata for the tool call result.
    public let metadata: [String: JSONValue]?
    /// Warnings raised for this tool call result, e.g. when the response is
    /// larger than recommended for voice AI context windows.
    public let warnings: [ToolCallResultMessageWarning]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        role: String,
        toolCallId: String,
        name: String,
        result: String,
        time: Double,
        secondsFromStart: Double,
        metadata: [String: JSONValue]? = nil,
        warnings: [ToolCallResultMessageWarning]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.role = role
        self.toolCallId = toolCallId
        self.name = name
        self.result = result
        self.time = time
        self.secondsFromStart = secondsFromStart
        self.metadata = metadata
        self.warnings = warnings
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.role = try container.decode(String.self, forKey: .role)
        self.toolCallId = try container.decode(String.self, forKey: .toolCallId)
        self.name = try container.decode(String.self, forKey: .name)
        self.result = try container.decode(String.self, forKey: .result)
        self.time = try container.decode(Double.self, forKey: .time)
        self.secondsFromStart = try container.decode(Double.self, forKey: .secondsFromStart)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.warnings = try container.decodeIfPresent([ToolCallResultMessageWarning].self, forKey: .warnings)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.toolCallId, forKey: .toolCallId)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.result, forKey: .result)
        try container.encode(self.time, forKey: .time)
        try container.encode(self.secondsFromStart, forKey: .secondsFromStart)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.warnings, forKey: .warnings)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case toolCallId
        case name
        case result
        case time
        case secondsFromStart
        case metadata
        case warnings
    }
}
import Foundation

public struct UserMessage: Codable, Hashable, Sendable {
    /// The role of the user in the conversation.
    public let role: String
    /// The message content from the user.
    public let message: String
    /// The timestamp when the message was sent.
    public let time: Double
    /// The timestamp when the message ended.
    public let endTime: Double
    /// The number of seconds from the start of the conversation.
    public let secondsFromStart: Double
    /// The duration of the message in seconds.
    public let duration: Double?
    /// Indicates if the message was filtered for security reasons.
    public let isFiltered: Bool?
    /// List of detected security threats if the message was filtered.
    public let detectedThreats: [String]?
    /// The original message before filtering (only included if content was filtered).
    public let originalMessage: String?
    /// The metadata associated with the message. Currently used to store the transcriber's word level confidence.
    public let metadata: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        role: String,
        message: String,
        time: Double,
        endTime: Double,
        secondsFromStart: Double,
        duration: Double? = nil,
        isFiltered: Bool? = nil,
        detectedThreats: [String]? = nil,
        originalMessage: String? = nil,
        metadata: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.role = role
        self.message = message
        self.time = time
        self.endTime = endTime
        self.secondsFromStart = secondsFromStart
        self.duration = duration
        self.isFiltered = isFiltered
        self.detectedThreats = detectedThreats
        self.originalMessage = originalMessage
        self.metadata = metadata
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.role = try container.decode(String.self, forKey: .role)
        self.message = try container.decode(String.self, forKey: .message)
        self.time = try container.decode(Double.self, forKey: .time)
        self.endTime = try container.decode(Double.self, forKey: .endTime)
        self.secondsFromStart = try container.decode(Double.self, forKey: .secondsFromStart)
        self.duration = try container.decodeIfPresent(Double.self, forKey: .duration)
        self.isFiltered = try container.decodeIfPresent(Bool.self, forKey: .isFiltered)
        self.detectedThreats = try container.decodeIfPresent([String].self, forKey: .detectedThreats)
        self.originalMessage = try container.decodeIfPresent(String.self, forKey: .originalMessage)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
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
        try container.encodeIfPresent(self.duration, forKey: .duration)
        try container.encodeIfPresent(self.isFiltered, forKey: .isFiltered)
        try container.encodeIfPresent(self.detectedThreats, forKey: .detectedThreats)
        try container.encodeIfPresent(self.originalMessage, forKey: .originalMessage)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case message
        case time
        case endTime
        case secondsFromStart
        case duration
        case isFiltered
        case detectedThreats
        case originalMessage
        case metadata
    }
}
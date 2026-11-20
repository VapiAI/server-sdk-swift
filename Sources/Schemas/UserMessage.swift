import Foundation

/// A user-authored entry in the call message history, including content, timing, security-filter results, and optional speaker metadata.
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
    /// The transcriber's confidence score for this message, in [0, 1]. Only
    /// ever set alongside `confidenceSource` — see there for why an unmarked
    /// or out-of-range score is never stored.
    public let confidence: Double?
    /// Whether `confidence` came directly from the transcriber ('provider') or
    /// was computed by Vapi ('derived').
    /// 
    /// 'derived' means Vapi computed the score from the transcriber's per-word
    /// scores; the exact aggregation is provider-specific (an average, a median
    /// or a minimum, depending on the transcriber). It is also 'derived' when
    /// consecutive transcript fragments were merged into one message, where the
    /// score is the minimum across the fragments.
    /// 
    /// Absent means no trustworthy score was available for this message: either
    /// the transcriber does not report one, or the value it reported was invalid
    /// and was dropped. A merged message is unmarked whenever any fragment it
    /// contains was unmarked.
    public let confidenceSource: UserMessageConfidenceSource?
    /// The metadata associated with the message. Currently used to store the transcriber's word level confidence.
    public let metadata: UserMessageMetadata?
    /// Stable speaker label for diarized user speakers (e.g., "Speaker 1").
    public let speakerLabel: String?
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
        confidence: Double? = nil,
        confidenceSource: UserMessageConfidenceSource? = nil,
        metadata: UserMessageMetadata? = nil,
        speakerLabel: String? = nil,
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
        self.confidence = confidence
        self.confidenceSource = confidenceSource
        self.metadata = metadata
        self.speakerLabel = speakerLabel
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
        self.confidence = try container.decodeIfPresent(Double.self, forKey: .confidence)
        self.confidenceSource = try container.decodeIfPresent(UserMessageConfidenceSource.self, forKey: .confidenceSource)
        self.metadata = try container.decodeIfPresent(UserMessageMetadata.self, forKey: .metadata)
        self.speakerLabel = try container.decodeIfPresent(String.self, forKey: .speakerLabel)
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
        try container.encodeIfPresent(self.confidence, forKey: .confidence)
        try container.encodeIfPresent(self.confidenceSource, forKey: .confidenceSource)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.speakerLabel, forKey: .speakerLabel)
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
        case confidence
        case confidenceSource
        case metadata
        case speakerLabel
    }
}
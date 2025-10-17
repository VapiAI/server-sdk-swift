import Foundation

public struct RecordingConsentPlanStayOnLine: Codable, Hashable, Sendable {
    /// This is the message asking for consent to record the call.
    /// If the type is `stay-on-line`, the message should ask the user to hang up if they do not consent.
    /// If the type is `verbal`, the message should ask the user to verbally consent or decline.
    public let message: String
    /// This is the voice to use for the consent message. If not specified, inherits from the assistant's voice.
    /// Use a different voice for the consent message for a better user experience.
    public let voice: RecordingConsentPlanStayOnLineVoice?
    /// Number of seconds to wait before transferring to the assistant if user stays on the call
    public let waitSeconds: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        message: String,
        voice: RecordingConsentPlanStayOnLineVoice? = nil,
        waitSeconds: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.message = message
        self.voice = voice
        self.waitSeconds = waitSeconds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
        self.voice = try container.decodeIfPresent(RecordingConsentPlanStayOnLineVoice.self, forKey: .voice)
        self.waitSeconds = try container.decodeIfPresent(Double.self, forKey: .waitSeconds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.message, forKey: .message)
        try container.encodeIfPresent(self.voice, forKey: .voice)
        try container.encodeIfPresent(self.waitSeconds, forKey: .waitSeconds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case message
        case voice
        case waitSeconds
    }
}
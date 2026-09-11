import Foundation

/// Configuration for requesting explicit verbal recording consent, including the announcement voice and action to take when the customer declines.
public struct RecordingConsentPlanVerbal: Codable, Hashable, Sendable {
    /// This is the message asking for consent to record the call.
    /// If the type is `stay-on-line`, the message should ask the user to hang up if they do not consent.
    /// If the type is `verbal`, the message should ask the user to verbally consent or decline.
    public let message: String
    /// This is the voice to use for the consent message. If not specified, inherits from the assistant's voice.
    /// Use a different voice for the consent message for a better user experience.
    public let voice: RecordingConsentPlanVerbalVoice?
    /// This controls whether the consent assistant speaks first or waits for the caller to speak first.
    /// 
    /// Use:
    /// - `assistant-speaks-first` (default) to have the consent assistant play the consent message as soon as the call is answered.
    /// - `assistant-waits-for-user` to have the consent assistant wait for the caller to speak before playing the consent message.
    /// 
    /// We strongly recommend `assistant-waits-for-user` for outbound calls. Some telephony providers signal "answered" while the line is still ringing, which can cause the consent message to play into a ringing line and be missed by the caller. Waiting for the caller to speak first guarantees they hear the full consent message.
    /// 
    /// Note: when combined with `type: 'stay-on-line'`, silence only counts toward consent after the caller has spoken at least once.
    /// 
    /// @default 'assistant-speaks-first'
    public let firstMessageMode: RecordingConsentPlanVerbalFirstMessageMode?
    /// Tool to execute if user verbally declines recording consent
    public let declineTool: [String: JSONValue]?
    /// ID of existing tool to execute if user verbally declines recording consent
    public let declineToolId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        message: String,
        voice: RecordingConsentPlanVerbalVoice? = nil,
        firstMessageMode: RecordingConsentPlanVerbalFirstMessageMode? = nil,
        declineTool: [String: JSONValue]? = nil,
        declineToolId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.message = message
        self.voice = voice
        self.firstMessageMode = firstMessageMode
        self.declineTool = declineTool
        self.declineToolId = declineToolId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
        self.voice = try container.decodeIfPresent(RecordingConsentPlanVerbalVoice.self, forKey: .voice)
        self.firstMessageMode = try container.decodeIfPresent(RecordingConsentPlanVerbalFirstMessageMode.self, forKey: .firstMessageMode)
        self.declineTool = try container.decodeIfPresent([String: JSONValue].self, forKey: .declineTool)
        self.declineToolId = try container.decodeIfPresent(String.self, forKey: .declineToolId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.message, forKey: .message)
        try container.encodeIfPresent(self.voice, forKey: .voice)
        try container.encodeIfPresent(self.firstMessageMode, forKey: .firstMessageMode)
        try container.encodeIfPresent(self.declineTool, forKey: .declineTool)
        try container.encodeIfPresent(self.declineToolId, forKey: .declineToolId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case message
        case voice
        case firstMessageMode
        case declineTool
        case declineToolId
    }
}
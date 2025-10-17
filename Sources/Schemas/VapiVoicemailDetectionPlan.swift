import Foundation

public struct VapiVoicemailDetectionPlan: Codable, Hashable, Sendable {
    /// This is the maximum duration from the start of the call that we will wait for a voicemail beep, before speaking our message
    /// 
    /// - If we detect a voicemail beep before this, we will speak the message at that point.
    /// 
    /// - Setting too low a value means that the bot will start speaking its voicemail message too early. If it does so before the actual beep, it will get cut off. You should definitely tune this to your use case.
    /// 
    /// @default 30
    /// @min 0
    /// @max 60
    public let beepMaxAwaitSeconds: Double?
    /// This is the backoff plan for the voicemail detection.
    public let backoffPlan: VoicemailDetectionBackoffPlan?
    /// This is the detection type to use for voicemail detection.
    /// - 'audio': Uses native audio models (default)
    /// - 'transcript': Uses ASR/transcript-based detection
    /// @default 'audio' (audio detection)
    public let type: VapiVoicemailDetectionPlanType?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        beepMaxAwaitSeconds: Double? = nil,
        backoffPlan: VoicemailDetectionBackoffPlan? = nil,
        type: VapiVoicemailDetectionPlanType? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.beepMaxAwaitSeconds = beepMaxAwaitSeconds
        self.backoffPlan = backoffPlan
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.beepMaxAwaitSeconds = try container.decodeIfPresent(Double.self, forKey: .beepMaxAwaitSeconds)
        self.backoffPlan = try container.decodeIfPresent(VoicemailDetectionBackoffPlan.self, forKey: .backoffPlan)
        self.type = try container.decodeIfPresent(VapiVoicemailDetectionPlanType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.beepMaxAwaitSeconds, forKey: .beepMaxAwaitSeconds)
        try container.encodeIfPresent(self.backoffPlan, forKey: .backoffPlan)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case beepMaxAwaitSeconds
        case backoffPlan
        case type
    }
}
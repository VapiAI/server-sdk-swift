import Foundation

public struct TransportConfigurationTwilio: Codable, Hashable, Sendable {
    public let provider: Twilio
    /// The integer number of seconds that we should allow the phone to ring before assuming there is no answer.
    /// The default is `60` seconds and the maximum is `600` seconds.
    /// For some call flows, we will add a 5-second buffer to the timeout value you provide.
    /// For this reason, a timeout value of 10 seconds could result in an actual timeout closer to 15 seconds.
    /// You can set this to a short time, such as `15` seconds, to hang up before reaching an answering machine or voicemail.
    /// 
    /// @default 60
    public let timeout: Double?
    /// Whether to record the call.
    /// Can be `true` to record the phone call, or `false` to not.
    /// The default is `false`.
    /// 
    /// @default false
    public let record: Bool?
    /// The number of channels in the final recording.
    /// Can be: `mono` or `dual`.
    /// The default is `mono`.
    /// `mono` records both legs of the call in a single channel of the recording file.
    /// `dual` records each leg to a separate channel of the recording file.
    /// The first channel of a dual-channel recording contains the parent call and the second channel contains the child call.
    /// 
    /// @default 'mono'
    public let recordingChannels: TransportConfigurationTwilioRecordingChannels?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: Twilio,
        timeout: Double? = nil,
        record: Bool? = nil,
        recordingChannels: TransportConfigurationTwilioRecordingChannels? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.timeout = timeout
        self.record = record
        self.recordingChannels = recordingChannels
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(Twilio.self, forKey: .provider)
        self.timeout = try container.decodeIfPresent(Double.self, forKey: .timeout)
        self.record = try container.decodeIfPresent(Bool.self, forKey: .record)
        self.recordingChannels = try container.decodeIfPresent(TransportConfigurationTwilioRecordingChannels.self, forKey: .recordingChannels)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.timeout, forKey: .timeout)
        try container.encodeIfPresent(self.record, forKey: .record)
        try container.encodeIfPresent(self.recordingChannels, forKey: .recordingChannels)
    }

    public enum Twilio: String, Codable, Hashable, CaseIterable, Sendable {
        case twilio
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case timeout
        case record
        case recordingChannels
    }
}
import Foundation

public struct TavusConversationProperties: Codable, Hashable, Sendable {
    /// The maximum duration of the call in seconds. The default `maxCallDuration` is 3600 seconds (1 hour).
    /// Once the time limit specified by this parameter has been reached, the conversation will automatically shut down.
    public let maxCallDuration: Double?
    /// The duration in seconds after which the call will be automatically shut down once the last participant leaves.
    public let participantLeftTimeout: Double?
    /// Starting from conversation creation, the duration in seconds after which the call will be automatically shut down if no participant joins the call.
    /// Default is 300 seconds (5 minutes).
    public let participantAbsentTimeout: Double?
    /// If true, the user will be able to record the conversation.
    public let enableRecording: Bool?
    /// If true, the user will be able to transcribe the conversation.
    /// You can find more instructions on displaying transcriptions if you are using your custom DailyJS components here.
    /// You need to have an event listener on Daily that listens for `app-messages`.
    public let enableTranscription: Bool?
    /// If true, the background will be replaced with a greenscreen (RGB values: `[0, 255, 155]`).
    /// You can use WebGL on the frontend to make the greenscreen transparent or change its color.
    public let applyGreenscreen: Bool?
    /// The language of the conversation. Please provide the **full language name**, not the two-letter code.
    /// If you are using your own TTS voice, please ensure it supports the language you provide.
    /// If you are using a stock replica or default persona, please note that only ElevenLabs and Cartesia supported languages are available.
    /// You can find a full list of supported languages for Cartesia here, for ElevenLabs here, and for PlayHT here.
    public let language: String?
    /// The name of the S3 bucket where the recording will be stored.
    public let recordingS3BucketName: String?
    /// The region of the S3 bucket where the recording will be stored.
    public let recordingS3BucketRegion: String?
    /// The ARN of the role that will be assumed to access the S3 bucket.
    public let awsAssumeRoleArn: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        maxCallDuration: Double? = nil,
        participantLeftTimeout: Double? = nil,
        participantAbsentTimeout: Double? = nil,
        enableRecording: Bool? = nil,
        enableTranscription: Bool? = nil,
        applyGreenscreen: Bool? = nil,
        language: String? = nil,
        recordingS3BucketName: String? = nil,
        recordingS3BucketRegion: String? = nil,
        awsAssumeRoleArn: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.maxCallDuration = maxCallDuration
        self.participantLeftTimeout = participantLeftTimeout
        self.participantAbsentTimeout = participantAbsentTimeout
        self.enableRecording = enableRecording
        self.enableTranscription = enableTranscription
        self.applyGreenscreen = applyGreenscreen
        self.language = language
        self.recordingS3BucketName = recordingS3BucketName
        self.recordingS3BucketRegion = recordingS3BucketRegion
        self.awsAssumeRoleArn = awsAssumeRoleArn
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.maxCallDuration = try container.decodeIfPresent(Double.self, forKey: .maxCallDuration)
        self.participantLeftTimeout = try container.decodeIfPresent(Double.self, forKey: .participantLeftTimeout)
        self.participantAbsentTimeout = try container.decodeIfPresent(Double.self, forKey: .participantAbsentTimeout)
        self.enableRecording = try container.decodeIfPresent(Bool.self, forKey: .enableRecording)
        self.enableTranscription = try container.decodeIfPresent(Bool.self, forKey: .enableTranscription)
        self.applyGreenscreen = try container.decodeIfPresent(Bool.self, forKey: .applyGreenscreen)
        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.recordingS3BucketName = try container.decodeIfPresent(String.self, forKey: .recordingS3BucketName)
        self.recordingS3BucketRegion = try container.decodeIfPresent(String.self, forKey: .recordingS3BucketRegion)
        self.awsAssumeRoleArn = try container.decodeIfPresent(String.self, forKey: .awsAssumeRoleArn)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.maxCallDuration, forKey: .maxCallDuration)
        try container.encodeIfPresent(self.participantLeftTimeout, forKey: .participantLeftTimeout)
        try container.encodeIfPresent(self.participantAbsentTimeout, forKey: .participantAbsentTimeout)
        try container.encodeIfPresent(self.enableRecording, forKey: .enableRecording)
        try container.encodeIfPresent(self.enableTranscription, forKey: .enableTranscription)
        try container.encodeIfPresent(self.applyGreenscreen, forKey: .applyGreenscreen)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.recordingS3BucketName, forKey: .recordingS3BucketName)
        try container.encodeIfPresent(self.recordingS3BucketRegion, forKey: .recordingS3BucketRegion)
        try container.encodeIfPresent(self.awsAssumeRoleArn, forKey: .awsAssumeRoleArn)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case maxCallDuration
        case participantLeftTimeout
        case participantAbsentTimeout
        case enableRecording
        case enableTranscription
        case applyGreenscreen
        case language
        case recordingS3BucketName
        case recordingS3BucketRegion
        case awsAssumeRoleArn
    }
}
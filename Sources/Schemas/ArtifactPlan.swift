import Foundation

public struct ArtifactPlan: Codable, Hashable, Sendable {
    /// This determines whether assistant's calls are recorded. Defaults to true.
    /// 
    /// Usage:
    /// - If you don't want to record the calls, set this to false.
    /// - If you want to record the calls when `assistant.hipaaEnabled` (deprecated) or `assistant.compliancePlan.hipaaEnabled` explicity set this to true and make sure to provide S3 or GCP credentials on the Provider Credentials page in the Dashboard.
    /// 
    /// You can find the recording at `call.artifact.recordingUrl` and `call.artifact.stereoRecordingUrl` after the call is ended.
    /// 
    /// @default true
    public let recordingEnabled: Bool?
    /// This determines the format of the recording. Defaults to `wav;l16`.
    /// 
    /// @default 'wav;l16'
    public let recordingFormat: ArtifactPlanRecordingFormat?
    /// This determines whether to use custom storage (S3 or GCP) for call recordings when storage credentials are configured.
    /// 
    /// When set to false, recordings will be stored on Vapi's storage instead of your custom storage, even if you have custom storage credentials configured.
    /// 
    /// Usage:
    /// - Set to false if you have custom storage configured but want to store recordings on Vapi's storage for this assistant.
    /// - Set to true (or leave unset) to use your custom storage for recordings when available.
    /// 
    /// @default true
    public let recordingUseCustomStorageEnabled: Bool?
    /// This determines whether the video is recorded during the call. Defaults to false. Only relevant for `webCall` type.
    /// 
    /// You can find the video recording at `call.artifact.videoRecordingUrl` after the call is ended.
    /// 
    /// @default false
    public let videoRecordingEnabled: Bool?
    /// This determines whether the artifact contains the full message history, even after handoff context engineering. Defaults to false.
    public let fullMessageHistoryEnabled: Bool?
    /// This determines whether the SIP packet capture is enabled. Defaults to true. Only relevant for `phone` type calls where phone number's provider is `vapi` or `byo-phone-number`.
    /// 
    /// You can find the packet capture at `call.artifact.pcapUrl` after the call is ended.
    /// 
    /// @default true
    public let pcapEnabled: Bool?
    /// This is the path where the SIP packet capture will be uploaded. This is only used if you have provided S3 or GCP credentials on the Provider Credentials page in the Dashboard.
    /// 
    /// If credential.s3PathPrefix or credential.bucketPlan.path is set, this will append to it.
    /// 
    /// Usage:
    /// - If you want to upload the packet capture to a specific path, set this to the path. Example: `/my-assistant-captures`.
    /// - If you want to upload the packet capture to the root of the bucket, set this to `/`.
    /// 
    /// @default '/'
    public let pcapS3PathPrefix: String?
    /// This determines whether to use custom storage (S3 or GCP) for SIP packet captures when storage credentials are configured.
    /// 
    /// When set to false, packet captures will be stored on Vapi's storage instead of your custom storage, even if you have custom storage credentials configured.
    /// 
    /// Usage:
    /// - Set to false if you have custom storage configured but want to store packet captures on Vapi's storage for this assistant.
    /// - Set to true (or leave unset) to use your custom storage for packet captures when available.
    /// 
    /// @default true
    public let pcapUseCustomStorageEnabled: Bool?
    /// This determines whether the call logs are enabled. Defaults to true.
    /// 
    /// @default true
    public let loggingEnabled: Bool?
    /// This determines whether to use custom storage (S3 or GCP) for call logs when storage credentials are configured.
    /// 
    /// When set to false, logs will be stored on Vapi's storage instead of your custom storage, even if you have custom storage credentials configured.
    /// 
    /// Usage:
    /// - Set to false if you have custom storage configured but want to store logs on Vapi's storage for this assistant.
    /// - Set to true (or leave unset) to use your custom storage for logs when available.
    /// 
    /// @default true
    public let loggingUseCustomStorageEnabled: Bool?
    /// This is the plan for `call.artifact.transcript`. To disable, set `transcriptPlan.enabled` to false.
    public let transcriptPlan: TranscriptPlan?
    /// This is the path where the recording will be uploaded. This is only used if you have provided S3 or GCP credentials on the Provider Credentials page in the Dashboard.
    /// 
    /// If credential.s3PathPrefix or credential.bucketPlan.path is set, this will append to it.
    /// 
    /// Usage:
    /// - If you want to upload the recording to a specific path, set this to the path. Example: `/my-assistant-recordings`.
    /// - If you want to upload the recording to the root of the bucket, set this to `/`.
    /// 
    /// @default '/'
    public let recordingPath: String?
    /// This is an array of structured output IDs to be calculated during the call.
    /// The outputs will be extracted and stored in `call.artifact.structuredOutputs` after the call is ended.
    public let structuredOutputIds: [String]?
    /// This is the path where the call logs will be uploaded. This is only used if you have provided S3 or GCP credentials on the Provider Credentials page in the Dashboard.
    /// 
    /// If credential.s3PathPrefix or credential.bucketPlan.path is set, this will append to it.
    /// 
    /// Usage:
    /// - If you want to upload the call logs to a specific path, set this to the path. Example: `/my-assistant-logs`.
    /// - If you want to upload the call logs to the root of the bucket, set this to `/`.
    /// 
    /// @default '/'
    public let loggingPath: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        recordingEnabled: Bool? = nil,
        recordingFormat: ArtifactPlanRecordingFormat? = nil,
        recordingUseCustomStorageEnabled: Bool? = nil,
        videoRecordingEnabled: Bool? = nil,
        fullMessageHistoryEnabled: Bool? = nil,
        pcapEnabled: Bool? = nil,
        pcapS3PathPrefix: String? = nil,
        pcapUseCustomStorageEnabled: Bool? = nil,
        loggingEnabled: Bool? = nil,
        loggingUseCustomStorageEnabled: Bool? = nil,
        transcriptPlan: TranscriptPlan? = nil,
        recordingPath: String? = nil,
        structuredOutputIds: [String]? = nil,
        loggingPath: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.recordingEnabled = recordingEnabled
        self.recordingFormat = recordingFormat
        self.recordingUseCustomStorageEnabled = recordingUseCustomStorageEnabled
        self.videoRecordingEnabled = videoRecordingEnabled
        self.fullMessageHistoryEnabled = fullMessageHistoryEnabled
        self.pcapEnabled = pcapEnabled
        self.pcapS3PathPrefix = pcapS3PathPrefix
        self.pcapUseCustomStorageEnabled = pcapUseCustomStorageEnabled
        self.loggingEnabled = loggingEnabled
        self.loggingUseCustomStorageEnabled = loggingUseCustomStorageEnabled
        self.transcriptPlan = transcriptPlan
        self.recordingPath = recordingPath
        self.structuredOutputIds = structuredOutputIds
        self.loggingPath = loggingPath
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.recordingEnabled = try container.decodeIfPresent(Bool.self, forKey: .recordingEnabled)
        self.recordingFormat = try container.decodeIfPresent(ArtifactPlanRecordingFormat.self, forKey: .recordingFormat)
        self.recordingUseCustomStorageEnabled = try container.decodeIfPresent(Bool.self, forKey: .recordingUseCustomStorageEnabled)
        self.videoRecordingEnabled = try container.decodeIfPresent(Bool.self, forKey: .videoRecordingEnabled)
        self.fullMessageHistoryEnabled = try container.decodeIfPresent(Bool.self, forKey: .fullMessageHistoryEnabled)
        self.pcapEnabled = try container.decodeIfPresent(Bool.self, forKey: .pcapEnabled)
        self.pcapS3PathPrefix = try container.decodeIfPresent(String.self, forKey: .pcapS3PathPrefix)
        self.pcapUseCustomStorageEnabled = try container.decodeIfPresent(Bool.self, forKey: .pcapUseCustomStorageEnabled)
        self.loggingEnabled = try container.decodeIfPresent(Bool.self, forKey: .loggingEnabled)
        self.loggingUseCustomStorageEnabled = try container.decodeIfPresent(Bool.self, forKey: .loggingUseCustomStorageEnabled)
        self.transcriptPlan = try container.decodeIfPresent(TranscriptPlan.self, forKey: .transcriptPlan)
        self.recordingPath = try container.decodeIfPresent(String.self, forKey: .recordingPath)
        self.structuredOutputIds = try container.decodeIfPresent([String].self, forKey: .structuredOutputIds)
        self.loggingPath = try container.decodeIfPresent(String.self, forKey: .loggingPath)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.recordingEnabled, forKey: .recordingEnabled)
        try container.encodeIfPresent(self.recordingFormat, forKey: .recordingFormat)
        try container.encodeIfPresent(self.recordingUseCustomStorageEnabled, forKey: .recordingUseCustomStorageEnabled)
        try container.encodeIfPresent(self.videoRecordingEnabled, forKey: .videoRecordingEnabled)
        try container.encodeIfPresent(self.fullMessageHistoryEnabled, forKey: .fullMessageHistoryEnabled)
        try container.encodeIfPresent(self.pcapEnabled, forKey: .pcapEnabled)
        try container.encodeIfPresent(self.pcapS3PathPrefix, forKey: .pcapS3PathPrefix)
        try container.encodeIfPresent(self.pcapUseCustomStorageEnabled, forKey: .pcapUseCustomStorageEnabled)
        try container.encodeIfPresent(self.loggingEnabled, forKey: .loggingEnabled)
        try container.encodeIfPresent(self.loggingUseCustomStorageEnabled, forKey: .loggingUseCustomStorageEnabled)
        try container.encodeIfPresent(self.transcriptPlan, forKey: .transcriptPlan)
        try container.encodeIfPresent(self.recordingPath, forKey: .recordingPath)
        try container.encodeIfPresent(self.structuredOutputIds, forKey: .structuredOutputIds)
        try container.encodeIfPresent(self.loggingPath, forKey: .loggingPath)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case recordingEnabled
        case recordingFormat
        case recordingUseCustomStorageEnabled
        case videoRecordingEnabled
        case fullMessageHistoryEnabled
        case pcapEnabled
        case pcapS3PathPrefix
        case pcapUseCustomStorageEnabled
        case loggingEnabled
        case loggingUseCustomStorageEnabled
        case transcriptPlan
        case recordingPath
        case structuredOutputIds
        case loggingPath
    }
}
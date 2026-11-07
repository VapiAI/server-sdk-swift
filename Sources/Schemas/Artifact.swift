import Foundation

/// Artifacts generated during a call, including messages, recordings, transcript, logs, packet capture, workflow-node data, variables, performance metrics, structured outputs, scorecards, and transfers.
public struct Artifact: Codable, Hashable, Sendable {
    /// These are the messages that were spoken during the call.
    public let messages: [ArtifactMessagesItem]?
    /// These are the messages that were spoken during the call, formatted for OpenAI.
    public let messagesOpenAiFormatted: [OpenAiMessage]?
    /// Structured outputs skipped because their conditions were not met, keyed by saved or runtime output ID.
    public let skippedStructuredOutputs: [String: SkippedStructuredOutput]?
    /// These are the transfer records for the call's transfer attempts (warm and blind), including
    /// destination, mode, and status. Warm transfer records also include transcripts and messages.
    public let transfers: [TransferArtifact]?
    /// This is the recording url for the call. To enable, set `assistant.artifactPlan.recordingEnabled`.
    public let recordingUrl: String?
    /// This is the stereo recording url for the call. To enable, set `assistant.artifactPlan.recordingEnabled`.
    public let stereoRecordingUrl: String?
    /// This is video recording url for the call. To enable, set `assistant.artifactPlan.videoRecordingEnabled`.
    public let videoRecordingUrl: String?
    /// This is video recording start delay in ms. To enable, set `assistant.artifactPlan.videoRecordingEnabled`. This can be used to align the playback of the recording with artifact.messages timestamps.
    public let videoRecordingStartDelaySeconds: Double?
    /// This is the recording url for the call. To enable, set `assistant.artifactPlan.recordingEnabled`.
    public let recording: Recording?
    /// This is the transcript of the call. This is derived from `artifact.messages` but provided for convenience.
    public let transcript: String?
    /// This is the packet capture url for the call. This is only available for `phone` type calls where phone number's provider is `vapi` or `byo-phone-number`.
    public let pcapUrl: String?
    /// This is the url for the call logs. This includes all logging output during the call for debugging purposes.
    public let logUrl: String?
    /// This is the history of workflow nodes that were executed during the call.
    public let nodes: [NodeArtifact]?
    /// Ordered list of assistants that were active during the call, including after transfers and handoffs.
    public let assistantActivations: [AssistantActivation]?
    /// These are the variable values at the end of the workflow execution.
    public let variableValues: [String: JSONValue]?
    /// This is the performance metrics for the call. It contains the turn latency, broken down by component.
    public let performanceMetrics: PerformanceMetrics?
    /// These are the structured outputs that will be extracted from the call.
    /// To enable, set `assistant.artifactPlan.structuredOutputIds` with the IDs of the structured outputs you want to extract.
    public let structuredOutputs: [String: JSONValue]?
    /// These are the scorecards that have been evaluated based on the structured outputs extracted during the call.
    /// To enable, set `assistant.artifactPlan.scorecardIds` or `assistant.artifactPlan.scorecards` with the IDs or objects of the scorecards you want to evaluate.
    public let scorecards: [String: JSONValue]?
    /// This is when the structured outputs were last updated
    public let structuredOutputsLastUpdatedAt: Date?
    /// This is a presigned URL to download the mono recording without
    /// authentication. Populated on API responses and server messages; never
    /// stored. Expires at `presignedUrlsExpiresAt` — after that, use
    /// `GET /call/{id}/mono-recording`.
    public let presignedMonoUrl: String?
    /// This is a presigned URL to download the stereo recording without
    /// authentication. Expires at `presignedUrlsExpiresAt` — after that, use
    /// `GET /call/{id}/stereo-recording`.
    public let presignedStereoUrl: String?
    /// This is a presigned URL to download the video recording without
    /// authentication. Expires at `presignedUrlsExpiresAt` — after that, use
    /// `GET /call/{id}/video-recording`.
    public let presignedVideoUrl: String?
    /// This is a presigned URL to download the assistant-channel mono recording
    /// without authentication. Expires at `presignedUrlsExpiresAt`.
    public let presignedAssistantUrl: String?
    /// This is a presigned URL to download the customer-channel mono recording
    /// without authentication. Expires at `presignedUrlsExpiresAt`.
    public let presignedCustomerUrl: String?
    /// This is a presigned URL to download the packet capture without
    /// authentication. Expires at `presignedUrlsExpiresAt`.
    public let presignedPcapUrl: String?
    /// This is a presigned URL to download the call logs without
    /// authentication. Expires at `presignedUrlsExpiresAt`.
    public let presignedLogUrl: String?
    /// This is when the presigned URLs above expire, as an ISO 8601 timestamp.
    /// The raw `*Url` fields remain the stable identifiers and do not expire.
    /// Presigned URLs are regenerated per response and per webhook delivery, so
    /// values differ across retries.
    public let presignedUrlsExpiresAt: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messages: [ArtifactMessagesItem]? = nil,
        messagesOpenAiFormatted: [OpenAiMessage]? = nil,
        skippedStructuredOutputs: [String: SkippedStructuredOutput]? = nil,
        transfers: [TransferArtifact]? = nil,
        recordingUrl: String? = nil,
        stereoRecordingUrl: String? = nil,
        videoRecordingUrl: String? = nil,
        videoRecordingStartDelaySeconds: Double? = nil,
        recording: Recording? = nil,
        transcript: String? = nil,
        pcapUrl: String? = nil,
        logUrl: String? = nil,
        nodes: [NodeArtifact]? = nil,
        assistantActivations: [AssistantActivation]? = nil,
        variableValues: [String: JSONValue]? = nil,
        performanceMetrics: PerformanceMetrics? = nil,
        structuredOutputs: [String: JSONValue]? = nil,
        scorecards: [String: JSONValue]? = nil,
        structuredOutputsLastUpdatedAt: Date? = nil,
        presignedMonoUrl: String? = nil,
        presignedStereoUrl: String? = nil,
        presignedVideoUrl: String? = nil,
        presignedAssistantUrl: String? = nil,
        presignedCustomerUrl: String? = nil,
        presignedPcapUrl: String? = nil,
        presignedLogUrl: String? = nil,
        presignedUrlsExpiresAt: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.messagesOpenAiFormatted = messagesOpenAiFormatted
        self.skippedStructuredOutputs = skippedStructuredOutputs
        self.transfers = transfers
        self.recordingUrl = recordingUrl
        self.stereoRecordingUrl = stereoRecordingUrl
        self.videoRecordingUrl = videoRecordingUrl
        self.videoRecordingStartDelaySeconds = videoRecordingStartDelaySeconds
        self.recording = recording
        self.transcript = transcript
        self.pcapUrl = pcapUrl
        self.logUrl = logUrl
        self.nodes = nodes
        self.assistantActivations = assistantActivations
        self.variableValues = variableValues
        self.performanceMetrics = performanceMetrics
        self.structuredOutputs = structuredOutputs
        self.scorecards = scorecards
        self.structuredOutputsLastUpdatedAt = structuredOutputsLastUpdatedAt
        self.presignedMonoUrl = presignedMonoUrl
        self.presignedStereoUrl = presignedStereoUrl
        self.presignedVideoUrl = presignedVideoUrl
        self.presignedAssistantUrl = presignedAssistantUrl
        self.presignedCustomerUrl = presignedCustomerUrl
        self.presignedPcapUrl = presignedPcapUrl
        self.presignedLogUrl = presignedLogUrl
        self.presignedUrlsExpiresAt = presignedUrlsExpiresAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decodeIfPresent([ArtifactMessagesItem].self, forKey: .messages)
        self.messagesOpenAiFormatted = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messagesOpenAiFormatted)
        self.skippedStructuredOutputs = try container.decodeIfPresent([String: SkippedStructuredOutput].self, forKey: .skippedStructuredOutputs)
        self.transfers = try container.decodeIfPresent([TransferArtifact].self, forKey: .transfers)
        self.recordingUrl = try container.decodeIfPresent(String.self, forKey: .recordingUrl)
        self.stereoRecordingUrl = try container.decodeIfPresent(String.self, forKey: .stereoRecordingUrl)
        self.videoRecordingUrl = try container.decodeIfPresent(String.self, forKey: .videoRecordingUrl)
        self.videoRecordingStartDelaySeconds = try container.decodeIfPresent(Double.self, forKey: .videoRecordingStartDelaySeconds)
        self.recording = try container.decodeIfPresent(Recording.self, forKey: .recording)
        self.transcript = try container.decodeIfPresent(String.self, forKey: .transcript)
        self.pcapUrl = try container.decodeIfPresent(String.self, forKey: .pcapUrl)
        self.logUrl = try container.decodeIfPresent(String.self, forKey: .logUrl)
        self.nodes = try container.decodeIfPresent([NodeArtifact].self, forKey: .nodes)
        self.assistantActivations = try container.decodeIfPresent([AssistantActivation].self, forKey: .assistantActivations)
        self.variableValues = try container.decodeIfPresent([String: JSONValue].self, forKey: .variableValues)
        self.performanceMetrics = try container.decodeIfPresent(PerformanceMetrics.self, forKey: .performanceMetrics)
        self.structuredOutputs = try container.decodeIfPresent([String: JSONValue].self, forKey: .structuredOutputs)
        self.scorecards = try container.decodeIfPresent([String: JSONValue].self, forKey: .scorecards)
        self.structuredOutputsLastUpdatedAt = try container.decodeIfPresent(Date.self, forKey: .structuredOutputsLastUpdatedAt)
        self.presignedMonoUrl = try container.decodeIfPresent(String.self, forKey: .presignedMonoUrl)
        self.presignedStereoUrl = try container.decodeIfPresent(String.self, forKey: .presignedStereoUrl)
        self.presignedVideoUrl = try container.decodeIfPresent(String.self, forKey: .presignedVideoUrl)
        self.presignedAssistantUrl = try container.decodeIfPresent(String.self, forKey: .presignedAssistantUrl)
        self.presignedCustomerUrl = try container.decodeIfPresent(String.self, forKey: .presignedCustomerUrl)
        self.presignedPcapUrl = try container.decodeIfPresent(String.self, forKey: .presignedPcapUrl)
        self.presignedLogUrl = try container.decodeIfPresent(String.self, forKey: .presignedLogUrl)
        self.presignedUrlsExpiresAt = try container.decodeIfPresent(String.self, forKey: .presignedUrlsExpiresAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.messagesOpenAiFormatted, forKey: .messagesOpenAiFormatted)
        try container.encodeIfPresent(self.skippedStructuredOutputs, forKey: .skippedStructuredOutputs)
        try container.encodeIfPresent(self.transfers, forKey: .transfers)
        try container.encodeIfPresent(self.recordingUrl, forKey: .recordingUrl)
        try container.encodeIfPresent(self.stereoRecordingUrl, forKey: .stereoRecordingUrl)
        try container.encodeIfPresent(self.videoRecordingUrl, forKey: .videoRecordingUrl)
        try container.encodeIfPresent(self.videoRecordingStartDelaySeconds, forKey: .videoRecordingStartDelaySeconds)
        try container.encodeIfPresent(self.recording, forKey: .recording)
        try container.encodeIfPresent(self.transcript, forKey: .transcript)
        try container.encodeIfPresent(self.pcapUrl, forKey: .pcapUrl)
        try container.encodeIfPresent(self.logUrl, forKey: .logUrl)
        try container.encodeIfPresent(self.nodes, forKey: .nodes)
        try container.encodeIfPresent(self.assistantActivations, forKey: .assistantActivations)
        try container.encodeIfPresent(self.variableValues, forKey: .variableValues)
        try container.encodeIfPresent(self.performanceMetrics, forKey: .performanceMetrics)
        try container.encodeIfPresent(self.structuredOutputs, forKey: .structuredOutputs)
        try container.encodeIfPresent(self.scorecards, forKey: .scorecards)
        try container.encodeIfPresent(self.structuredOutputsLastUpdatedAt, forKey: .structuredOutputsLastUpdatedAt)
        try container.encodeIfPresent(self.presignedMonoUrl, forKey: .presignedMonoUrl)
        try container.encodeIfPresent(self.presignedStereoUrl, forKey: .presignedStereoUrl)
        try container.encodeIfPresent(self.presignedVideoUrl, forKey: .presignedVideoUrl)
        try container.encodeIfPresent(self.presignedAssistantUrl, forKey: .presignedAssistantUrl)
        try container.encodeIfPresent(self.presignedCustomerUrl, forKey: .presignedCustomerUrl)
        try container.encodeIfPresent(self.presignedPcapUrl, forKey: .presignedPcapUrl)
        try container.encodeIfPresent(self.presignedLogUrl, forKey: .presignedLogUrl)
        try container.encodeIfPresent(self.presignedUrlsExpiresAt, forKey: .presignedUrlsExpiresAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case messagesOpenAiFormatted = "messagesOpenAIFormatted"
        case skippedStructuredOutputs
        case transfers
        case recordingUrl
        case stereoRecordingUrl
        case videoRecordingUrl
        case videoRecordingStartDelaySeconds
        case recording
        case transcript
        case pcapUrl
        case logUrl
        case nodes
        case assistantActivations
        case variableValues
        case performanceMetrics
        case structuredOutputs
        case scorecards
        case structuredOutputsLastUpdatedAt
        case presignedMonoUrl
        case presignedStereoUrl
        case presignedVideoUrl
        case presignedAssistantUrl
        case presignedCustomerUrl
        case presignedPcapUrl
        case presignedLogUrl
        case presignedUrlsExpiresAt
    }
}
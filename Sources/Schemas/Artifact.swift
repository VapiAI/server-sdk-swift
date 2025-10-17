import Foundation

public struct Artifact: Codable, Hashable, Sendable {
    /// These are the messages that were spoken during the call.
    public let messages: [ArtifactMessagesItem]?
    /// These are the messages that were spoken during the call, formatted for OpenAI.
    public let messagesOpenAiFormatted: [OpenAiMessage]?
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
    /// These are the variable values at the end of the workflow execution.
    public let variableValues: [String: JSONValue]?
    /// This is the performance metrics for the call. It contains the turn latency, broken down by component.
    public let performanceMetrics: PerformanceMetrics?
    /// These are the structured outputs that will be extracted from the call.
    /// To enable, set `assistant.artifactPlan.structuredOutputIds` with the IDs of the structured outputs you want to extract.
    public let structuredOutputs: [String: JSONValue]?
    /// These are the transfer records from warm transfers, including destinations, transcripts, and status.
    public let transfers: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messages: [ArtifactMessagesItem]? = nil,
        messagesOpenAiFormatted: [OpenAiMessage]? = nil,
        recordingUrl: String? = nil,
        stereoRecordingUrl: String? = nil,
        videoRecordingUrl: String? = nil,
        videoRecordingStartDelaySeconds: Double? = nil,
        recording: Recording? = nil,
        transcript: String? = nil,
        pcapUrl: String? = nil,
        logUrl: String? = nil,
        nodes: [NodeArtifact]? = nil,
        variableValues: [String: JSONValue]? = nil,
        performanceMetrics: PerformanceMetrics? = nil,
        structuredOutputs: [String: JSONValue]? = nil,
        transfers: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.messagesOpenAiFormatted = messagesOpenAiFormatted
        self.recordingUrl = recordingUrl
        self.stereoRecordingUrl = stereoRecordingUrl
        self.videoRecordingUrl = videoRecordingUrl
        self.videoRecordingStartDelaySeconds = videoRecordingStartDelaySeconds
        self.recording = recording
        self.transcript = transcript
        self.pcapUrl = pcapUrl
        self.logUrl = logUrl
        self.nodes = nodes
        self.variableValues = variableValues
        self.performanceMetrics = performanceMetrics
        self.structuredOutputs = structuredOutputs
        self.transfers = transfers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decodeIfPresent([ArtifactMessagesItem].self, forKey: .messages)
        self.messagesOpenAiFormatted = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messagesOpenAiFormatted)
        self.recordingUrl = try container.decodeIfPresent(String.self, forKey: .recordingUrl)
        self.stereoRecordingUrl = try container.decodeIfPresent(String.self, forKey: .stereoRecordingUrl)
        self.videoRecordingUrl = try container.decodeIfPresent(String.self, forKey: .videoRecordingUrl)
        self.videoRecordingStartDelaySeconds = try container.decodeIfPresent(Double.self, forKey: .videoRecordingStartDelaySeconds)
        self.recording = try container.decodeIfPresent(Recording.self, forKey: .recording)
        self.transcript = try container.decodeIfPresent(String.self, forKey: .transcript)
        self.pcapUrl = try container.decodeIfPresent(String.self, forKey: .pcapUrl)
        self.logUrl = try container.decodeIfPresent(String.self, forKey: .logUrl)
        self.nodes = try container.decodeIfPresent([NodeArtifact].self, forKey: .nodes)
        self.variableValues = try container.decodeIfPresent([String: JSONValue].self, forKey: .variableValues)
        self.performanceMetrics = try container.decodeIfPresent(PerformanceMetrics.self, forKey: .performanceMetrics)
        self.structuredOutputs = try container.decodeIfPresent([String: JSONValue].self, forKey: .structuredOutputs)
        self.transfers = try container.decodeIfPresent([String].self, forKey: .transfers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.messagesOpenAiFormatted, forKey: .messagesOpenAiFormatted)
        try container.encodeIfPresent(self.recordingUrl, forKey: .recordingUrl)
        try container.encodeIfPresent(self.stereoRecordingUrl, forKey: .stereoRecordingUrl)
        try container.encodeIfPresent(self.videoRecordingUrl, forKey: .videoRecordingUrl)
        try container.encodeIfPresent(self.videoRecordingStartDelaySeconds, forKey: .videoRecordingStartDelaySeconds)
        try container.encodeIfPresent(self.recording, forKey: .recording)
        try container.encodeIfPresent(self.transcript, forKey: .transcript)
        try container.encodeIfPresent(self.pcapUrl, forKey: .pcapUrl)
        try container.encodeIfPresent(self.logUrl, forKey: .logUrl)
        try container.encodeIfPresent(self.nodes, forKey: .nodes)
        try container.encodeIfPresent(self.variableValues, forKey: .variableValues)
        try container.encodeIfPresent(self.performanceMetrics, forKey: .performanceMetrics)
        try container.encodeIfPresent(self.structuredOutputs, forKey: .structuredOutputs)
        try container.encodeIfPresent(self.transfers, forKey: .transfers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case messagesOpenAiFormatted = "messagesOpenAIFormatted"
        case recordingUrl
        case stereoRecordingUrl
        case videoRecordingUrl
        case videoRecordingStartDelaySeconds
        case recording
        case transcript
        case pcapUrl
        case logUrl
        case nodes
        case variableValues
        case performanceMetrics
        case structuredOutputs
        case transfers
    }
}
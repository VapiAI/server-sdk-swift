import Foundation

public struct Recording: Codable, Hashable, Sendable {
    /// This is the stereo recording url for the call. To enable, set `assistant.artifactPlan.recordingEnabled`.
    public let stereoUrl: String?
    /// This is the video recording url for the call. To enable, set `assistant.artifactPlan.videoRecordingEnabled`.
    public let videoUrl: String?
    /// This is video recording start delay in ms. To enable, set `assistant.artifactPlan.videoRecordingEnabled`. This can be used to align the playback of the recording with artifact.messages timestamps.
    public let videoRecordingStartDelaySeconds: Double?
    /// This is the mono recording url for the call. To enable, set `assistant.artifactPlan.recordingEnabled`.
    public let mono: Mono?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        stereoUrl: String? = nil,
        videoUrl: String? = nil,
        videoRecordingStartDelaySeconds: Double? = nil,
        mono: Mono? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.stereoUrl = stereoUrl
        self.videoUrl = videoUrl
        self.videoRecordingStartDelaySeconds = videoRecordingStartDelaySeconds
        self.mono = mono
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.stereoUrl = try container.decodeIfPresent(String.self, forKey: .stereoUrl)
        self.videoUrl = try container.decodeIfPresent(String.self, forKey: .videoUrl)
        self.videoRecordingStartDelaySeconds = try container.decodeIfPresent(Double.self, forKey: .videoRecordingStartDelaySeconds)
        self.mono = try container.decodeIfPresent(Mono.self, forKey: .mono)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.stereoUrl, forKey: .stereoUrl)
        try container.encodeIfPresent(self.videoUrl, forKey: .videoUrl)
        try container.encodeIfPresent(self.videoRecordingStartDelaySeconds, forKey: .videoRecordingStartDelaySeconds)
        try container.encodeIfPresent(self.mono, forKey: .mono)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case stereoUrl
        case videoUrl
        case videoRecordingStartDelaySeconds
        case mono
    }
}
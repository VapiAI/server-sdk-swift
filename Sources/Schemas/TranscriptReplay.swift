import Foundation

public struct TranscriptReplay: Codable, Hashable, Sendable {
    /// This is the HTTPS URL of the recording, fetched when each run starts and
    /// never stored. Use a presigned URL that stays valid until the run executes.
    /// WAV, MP3, FLAC and OGG are supported; MP4 and M4A only when the file was
    /// written for streaming.
    public let recordingUrl: String
    /// This is the answer key, inline. Supply this or `answerKeyUrl`, not both.
    /// Organizations with HIPAA, PCI or zero data retention enabled must use
    /// `answerKeyUrl`, so no answer key is stored.
    public let answerKey: TranscriptAnswerKey?
    /// This is the HTTPS URL of a JSON answer key with the same shape as
    /// `answerKey`, fetched when each run starts and never stored.
    public let answerKeyUrl: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        recordingUrl: String,
        answerKey: TranscriptAnswerKey? = nil,
        answerKeyUrl: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.recordingUrl = recordingUrl
        self.answerKey = answerKey
        self.answerKeyUrl = answerKeyUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.recordingUrl = try container.decode(String.self, forKey: .recordingUrl)
        self.answerKey = try container.decodeIfPresent(TranscriptAnswerKey.self, forKey: .answerKey)
        self.answerKeyUrl = try container.decodeIfPresent(String.self, forKey: .answerKeyUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.recordingUrl, forKey: .recordingUrl)
        try container.encodeIfPresent(self.answerKey, forKey: .answerKey)
        try container.encodeIfPresent(self.answerKeyUrl, forKey: .answerKeyUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case recordingUrl
        case answerKey
        case answerKeyUrl
    }
}
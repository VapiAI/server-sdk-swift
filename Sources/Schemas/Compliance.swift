import Foundation

public struct Compliance: Codable, Hashable, Sendable {
    /// This is the recording consent of the call. Configure in `assistant.compliancePlan.recordingConsentPlan`.
    public let recordingConsent: RecordingConsent?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        recordingConsent: RecordingConsent? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.recordingConsent = recordingConsent
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.recordingConsent = try container.decodeIfPresent(RecordingConsent.self, forKey: .recordingConsent)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.recordingConsent, forKey: .recordingConsent)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case recordingConsent
    }
}
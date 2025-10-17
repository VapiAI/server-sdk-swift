import Foundation

public struct VoicemailDetectionBackoffPlan: Codable, Hashable, Sendable {
    /// This is the number of seconds to wait before starting the first retry attempt.
    public let startAtSeconds: Double?
    /// This is the interval in seconds between retry attempts.
    public let frequencySeconds: Double?
    /// This is the maximum number of retry attempts before giving up.
    public let maxRetries: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        startAtSeconds: Double? = nil,
        frequencySeconds: Double? = nil,
        maxRetries: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.startAtSeconds = startAtSeconds
        self.frequencySeconds = frequencySeconds
        self.maxRetries = maxRetries
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.startAtSeconds = try container.decodeIfPresent(Double.self, forKey: .startAtSeconds)
        self.frequencySeconds = try container.decodeIfPresent(Double.self, forKey: .frequencySeconds)
        self.maxRetries = try container.decodeIfPresent(Double.self, forKey: .maxRetries)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.startAtSeconds, forKey: .startAtSeconds)
        try container.encodeIfPresent(self.frequencySeconds, forKey: .frequencySeconds)
        try container.encodeIfPresent(self.maxRetries, forKey: .maxRetries)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case startAtSeconds
        case frequencySeconds
        case maxRetries
    }
}
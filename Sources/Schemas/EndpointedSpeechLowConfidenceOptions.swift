import Foundation

public struct EndpointedSpeechLowConfidenceOptions: Codable, Hashable, Sendable {
    /// This is the minimum confidence threshold.
    /// Transcripts with confidence below this value will be discarded.
    /// 
    /// @default confidenceMax - 0.2
    public let confidenceMin: Double?
    /// This is the maximum confidence threshold.
    /// Transcripts with confidence at or above this value will be processed normally.
    /// 
    /// @default transcriber's confidenceThreshold
    public let confidenceMax: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        confidenceMin: Double? = nil,
        confidenceMax: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.confidenceMin = confidenceMin
        self.confidenceMax = confidenceMax
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.confidenceMin = try container.decodeIfPresent(Double.self, forKey: .confidenceMin)
        self.confidenceMax = try container.decodeIfPresent(Double.self, forKey: .confidenceMax)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.confidenceMin, forKey: .confidenceMin)
        try container.encodeIfPresent(self.confidenceMax, forKey: .confidenceMax)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case confidenceMin
        case confidenceMax
    }
}
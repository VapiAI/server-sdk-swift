import Foundation

/// Lists backup transcriber configurations that can be used if the primary transcriber fails.
public struct FallbackTranscriberPlan: Codable, Hashable, Sendable {
    /// Transcriber configurations available when the primary transcriber fails.
    public let transcribers: [FallbackTranscriberPlanTranscribersItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        transcribers: [FallbackTranscriberPlanTranscribersItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.transcribers = transcribers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transcribers = try container.decodeIfPresent([FallbackTranscriberPlanTranscribersItem].self, forKey: .transcribers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.transcribers, forKey: .transcribers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case transcribers
    }
}
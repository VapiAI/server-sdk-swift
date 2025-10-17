import Foundation

public struct FallbackTranscriberPlan: Codable, Hashable, Sendable {
    public let transcribers: [FallbackTranscriberPlanTranscribersItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        transcribers: [FallbackTranscriberPlanTranscribersItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.transcribers = transcribers
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transcribers = try container.decode([FallbackTranscriberPlanTranscribersItem].self, forKey: .transcribers)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.transcribers, forKey: .transcribers)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case transcribers
    }
}
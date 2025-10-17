import Foundation

public struct FallbackPlan: Codable, Hashable, Sendable {
    /// This is the list of voices to fallback to in the event that the primary voice provider fails.
    public let voices: [FallbackPlanVoicesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        voices: [FallbackPlanVoicesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.voices = voices
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.voices = try container.decode([FallbackPlanVoicesItem].self, forKey: .voices)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.voices, forKey: .voices)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case voices
    }
}
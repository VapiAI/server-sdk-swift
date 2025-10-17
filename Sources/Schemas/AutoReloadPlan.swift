import Foundation

public struct AutoReloadPlan: Codable, Hashable, Sendable {
    /// This the amount of credits to reload.
    public let credits: Double
    /// This is the limit at which the reload is triggered.
    public let threshold: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        credits: Double,
        threshold: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.credits = credits
        self.threshold = threshold
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.credits = try container.decode(Double.self, forKey: .credits)
        self.threshold = try container.decode(Double.self, forKey: .threshold)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.credits, forKey: .credits)
        try container.encode(self.threshold, forKey: .threshold)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case credits
        case threshold
    }
}
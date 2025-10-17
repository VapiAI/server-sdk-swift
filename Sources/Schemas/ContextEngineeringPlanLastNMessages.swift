import Foundation

public struct ContextEngineeringPlanLastNMessages: Codable, Hashable, Sendable {
    /// This is the maximum number of messages to include in the context engineering plan.
    public let maxMessages: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        maxMessages: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.maxMessages = maxMessages
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.maxMessages = try container.decode(Double.self, forKey: .maxMessages)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.maxMessages, forKey: .maxMessages)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case maxMessages
    }
}
import Foundation

public struct MinMessagesCondition: Codable, Hashable, Sendable {
    /// This is the minimum number of conversation messages required for the
    /// structured output to run.
    /// 
    /// A count of 0 removes the runtime default minimum, so the structured output
    /// runs regardless of how few messages the conversation has.
    public let count: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        count: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.count = count
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Double.self, forKey: .count)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.count, forKey: .count)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case count
    }
}
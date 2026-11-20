import Foundation

public struct TrafficTabEndedReasonCountDto: Codable, Hashable, Sendable {
    public let reason: String
    public let count: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        reason: String,
        count: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.reason = reason
        self.count = count
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.reason = try container.decode(String.self, forKey: .reason)
        self.count = try container.decode(Double.self, forKey: .count)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.reason, forKey: .reason)
        try container.encode(self.count, forKey: .count)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case reason
        case count
    }
}
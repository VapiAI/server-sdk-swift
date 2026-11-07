import Foundation

public struct TrafficAllocationTarget: Codable, Hashable, Sendable {
    /// The assistant version this target sends calls to, such as "v7".
    public let assistantVersion: String
    /// The target's place in the split, starting at 0. Set from the order of the targets array.
    public let position: Double
    /// Share of calls sent to this version, from 0 to 100 with up to three decimal places. Targets add up to exactly 100. A 0% target keeps the version in the split without sending it calls.
    public let percentage: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantVersion: String,
        position: Double,
        percentage: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantVersion = assistantVersion
        self.position = position
        self.percentage = percentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantVersion = try container.decode(String.self, forKey: .assistantVersion)
        self.position = try container.decode(Double.self, forKey: .position)
        self.percentage = try container.decode(Double.self, forKey: .percentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assistantVersion, forKey: .assistantVersion)
        try container.encode(self.position, forKey: .position)
        try container.encode(self.percentage, forKey: .percentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantVersion
        case position
        case percentage
    }
}
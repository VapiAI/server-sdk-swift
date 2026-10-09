import Foundation

public struct CreateTrafficAllocationTargetDto: Codable, Hashable, Sendable {
    /// A published version of this assistant, such as "v7". To split onto a new version, publish it first, then create the allocation.
    public let assistantVersion: String
    /// Share of calls sent to this version, from 0 to 100 with up to three decimal places. Finer values are rejected, not rounded. All targets together add up to exactly 100. Position is taken from array order.
    public let percentage: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantVersion: String,
        percentage: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantVersion = assistantVersion
        self.percentage = percentage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantVersion = try container.decode(String.self, forKey: .assistantVersion)
        self.percentage = try container.decode(Double.self, forKey: .percentage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assistantVersion, forKey: .assistantVersion)
        try container.encode(self.percentage, forKey: .percentage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantVersion
        case percentage
    }
}
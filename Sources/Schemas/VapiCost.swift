import Foundation

public struct VapiCost: Codable, Hashable, Sendable {
    /// This is the sub type of the cost.
    public let subType: VapiCostSubType
    /// This is the minutes of Vapi usage. This should match `call.endedAt` - `call.startedAt`.
    public let minutes: Double
    /// This is the cost of the component in USD.
    public let cost: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        subType: VapiCostSubType,
        minutes: Double,
        cost: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.subType = subType
        self.minutes = minutes
        self.cost = cost
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.subType = try container.decode(VapiCostSubType.self, forKey: .subType)
        self.minutes = try container.decode(Double.self, forKey: .minutes)
        self.cost = try container.decode(Double.self, forKey: .cost)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.subType, forKey: .subType)
        try container.encode(self.minutes, forKey: .minutes)
        try container.encode(self.cost, forKey: .cost)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case subType
        case minutes
        case cost
    }
}
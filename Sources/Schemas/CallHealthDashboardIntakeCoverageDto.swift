import Foundation

public struct CallHealthDashboardIntakeCoverageDto: Codable, Hashable, Sendable {
    public let deliveryMode: CallHealthDashboardIntakeCoverageDtoDeliveryMode
    public let endToEndCoverage: CallHealthDashboardIntakeCoverageDtoEndToEndCoverage
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        deliveryMode: CallHealthDashboardIntakeCoverageDtoDeliveryMode,
        endToEndCoverage: CallHealthDashboardIntakeCoverageDtoEndToEndCoverage,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.deliveryMode = deliveryMode
        self.endToEndCoverage = endToEndCoverage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.deliveryMode = try container.decode(CallHealthDashboardIntakeCoverageDtoDeliveryMode.self, forKey: .deliveryMode)
        self.endToEndCoverage = try container.decode(CallHealthDashboardIntakeCoverageDtoEndToEndCoverage.self, forKey: .endToEndCoverage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.deliveryMode, forKey: .deliveryMode)
        try container.encode(self.endToEndCoverage, forKey: .endToEndCoverage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case deliveryMode
        case endToEndCoverage
    }
}
import Foundation

public struct CallHealthDashboardSweepCoverageDto: Codable, Hashable, Sendable {
    public let state: CallHealthDashboardSweepCoverageDtoState
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        state: CallHealthDashboardSweepCoverageDtoState,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.state = state
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.state = try container.decode(CallHealthDashboardSweepCoverageDtoState.self, forKey: .state)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.state, forKey: .state)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case state
    }
}
import Foundation

public struct CallHealthDashboardIssueCoverageDto: Codable, Hashable, Sendable {
    public let state: CallHealthDashboardIssueCoverageDtoState
    public let asOf: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        state: CallHealthDashboardIssueCoverageDtoState,
        asOf: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.state = state
        self.asOf = asOf
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.state = try container.decode(CallHealthDashboardIssueCoverageDtoState.self, forKey: .state)
        self.asOf = try container.decode(Date.self, forKey: .asOf)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.state, forKey: .state)
        try container.encode(self.asOf, forKey: .asOf)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case state
        case asOf
    }
}
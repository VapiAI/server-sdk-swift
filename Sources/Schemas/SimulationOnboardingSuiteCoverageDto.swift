import Foundation

public struct SimulationOnboardingSuiteCoverageDto: Codable, Hashable, Sendable {
    /// Requirements at least one simulation covers.
    public let covered: Double
    /// Requirements in the agreed draft.
    public let total: Double
    /// Requirements no simulation covers, and why.
    public let gaps: [SimulationOnboardingCoverageGapDto]
    /// Planned scenarios an edit with `retryFailed` would regenerate.
    public let retryable: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        covered: Double,
        total: Double,
        gaps: [SimulationOnboardingCoverageGapDto],
        retryable: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.covered = covered
        self.total = total
        self.gaps = gaps
        self.retryable = retryable
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.covered = try container.decode(Double.self, forKey: .covered)
        self.total = try container.decode(Double.self, forKey: .total)
        self.gaps = try container.decode([SimulationOnboardingCoverageGapDto].self, forKey: .gaps)
        self.retryable = try container.decode(Double.self, forKey: .retryable)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.covered, forKey: .covered)
        try container.encode(self.total, forKey: .total)
        try container.encode(self.gaps, forKey: .gaps)
        try container.encode(self.retryable, forKey: .retryable)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case covered
        case total
        case gaps
        case retryable
    }
}
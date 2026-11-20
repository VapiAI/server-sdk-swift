import Foundation

public struct CallHealthDashboardAssignmentCoverageDto: Codable, Hashable, Sendable {
    public let pending: Int
    public let unmatched: Int
    public let skipped: Int
    public let unavailable: Int
    public let error: Int
    public let coverageGapCount: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        pending: Int,
        unmatched: Int,
        skipped: Int,
        unavailable: Int,
        error: Int,
        coverageGapCount: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.pending = pending
        self.unmatched = unmatched
        self.skipped = skipped
        self.unavailable = unavailable
        self.error = error
        self.coverageGapCount = coverageGapCount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pending = try container.decode(Int.self, forKey: .pending)
        self.unmatched = try container.decode(Int.self, forKey: .unmatched)
        self.skipped = try container.decode(Int.self, forKey: .skipped)
        self.unavailable = try container.decode(Int.self, forKey: .unavailable)
        self.error = try container.decode(Int.self, forKey: .error)
        self.coverageGapCount = try container.decode(Int.self, forKey: .coverageGapCount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.pending, forKey: .pending)
        try container.encode(self.unmatched, forKey: .unmatched)
        try container.encode(self.skipped, forKey: .skipped)
        try container.encode(self.unavailable, forKey: .unavailable)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.coverageGapCount, forKey: .coverageGapCount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case pending
        case unmatched
        case skipped
        case unavailable
        case error
        case coverageGapCount
    }
}
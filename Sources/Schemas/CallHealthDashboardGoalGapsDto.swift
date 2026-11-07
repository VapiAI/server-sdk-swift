import Foundation

public struct CallHealthDashboardGoalGapsDto: Codable, Hashable, Sendable {
    public let pending: Int
    public let unavailable: Int
    public let skipped: Int
    public let error: Int
    public let excluded: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        pending: Int,
        unavailable: Int,
        skipped: Int,
        error: Int,
        excluded: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.pending = pending
        self.unavailable = unavailable
        self.skipped = skipped
        self.error = error
        self.excluded = excluded
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pending = try container.decode(Int.self, forKey: .pending)
        self.unavailable = try container.decode(Int.self, forKey: .unavailable)
        self.skipped = try container.decode(Int.self, forKey: .skipped)
        self.error = try container.decode(Int.self, forKey: .error)
        self.excluded = try container.decode(Int.self, forKey: .excluded)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.pending, forKey: .pending)
        try container.encode(self.unavailable, forKey: .unavailable)
        try container.encode(self.skipped, forKey: .skipped)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.excluded, forKey: .excluded)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case pending
        case unavailable
        case skipped
        case error
        case excluded
    }
}
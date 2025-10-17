import Foundation

public struct SchedulePlan: Codable, Hashable, Sendable {
    /// This is the ISO 8601 date-time string of the earliest time the call can be scheduled.
    public let earliestAt: Date
    /// This is the ISO 8601 date-time string of the latest time the call can be scheduled.
    public let latestAt: Date?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        earliestAt: Date,
        latestAt: Date? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.earliestAt = earliestAt
        self.latestAt = latestAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.earliestAt = try container.decode(Date.self, forKey: .earliestAt)
        self.latestAt = try container.decodeIfPresent(Date.self, forKey: .latestAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.earliestAt, forKey: .earliestAt)
        try container.encodeIfPresent(self.latestAt, forKey: .latestAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case earliestAt
        case latestAt
    }
}
import Foundation

public struct CallHealthDashboardIssueDailyDto: Codable, Hashable, Sendable {
    /// UTC calendar date, with boundary buckets clipped to the requested window.
    public let date: CalendarDate
    /// Distinct visible calls matching this issue in the bucket.
    public let affectedCallCount: Int
    /// All accepted current-goal outcomes for the issue's assistant in the bucket.
    public let analyzedCallCount: Int
    /// affectedCallCount / analyzedCallCount; omitted for a zero denominator.
    public let affectedCallRate: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        date: CalendarDate,
        affectedCallCount: Int,
        analyzedCallCount: Int,
        affectedCallRate: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.date = date
        self.affectedCallCount = affectedCallCount
        self.analyzedCallCount = analyzedCallCount
        self.affectedCallRate = affectedCallRate
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.date = try container.decode(CalendarDate.self, forKey: .date)
        self.affectedCallCount = try container.decode(Int.self, forKey: .affectedCallCount)
        self.analyzedCallCount = try container.decode(Int.self, forKey: .analyzedCallCount)
        self.affectedCallRate = try container.decodeIfPresent(Double.self, forKey: .affectedCallRate)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.affectedCallCount, forKey: .affectedCallCount)
        try container.encode(self.analyzedCallCount, forKey: .analyzedCallCount)
        try container.encodeIfPresent(self.affectedCallRate, forKey: .affectedCallRate)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case date
        case affectedCallCount
        case analyzedCallCount
        case affectedCallRate
    }
}
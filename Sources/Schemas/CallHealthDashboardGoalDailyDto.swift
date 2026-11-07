import Foundation

public struct CallHealthDashboardGoalDailyDto: Codable, Hashable, Sendable {
    public let registeredCallCount: Int
    /// Calls with an accepted semantic eligibility decision and binary goal outcome.
    public let eligibleCallCount: Int
    /// Accepted semantic exclusions; absent from the goal denominator.
    public let ineligibleCallCount: Int
    /// No accepted eligibility decision, including technical or privacy exclusions.
    public let unassessedCallCount: Int
    public let goalMetCount: Int
    public let goalNotMetCount: Int
    public let evaluatedCallCount: Int
    /// Accepted current-goal results, including ineligible; independent of issue processing.
    public let analyzedCallCount: Int
    /// Goal-met / evaluatedCallCount; omitted when there are no binary outcomes.
    public let goalMetRate: Double?
    public let goalNotMetRate: Double?
    /// UTC calendar date; the first and last buckets are clipped to the requested window.
    public let date: CalendarDate
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        registeredCallCount: Int,
        eligibleCallCount: Int,
        ineligibleCallCount: Int,
        unassessedCallCount: Int,
        goalMetCount: Int,
        goalNotMetCount: Int,
        evaluatedCallCount: Int,
        analyzedCallCount: Int,
        goalMetRate: Double? = nil,
        goalNotMetRate: Double? = nil,
        date: CalendarDate,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.registeredCallCount = registeredCallCount
        self.eligibleCallCount = eligibleCallCount
        self.ineligibleCallCount = ineligibleCallCount
        self.unassessedCallCount = unassessedCallCount
        self.goalMetCount = goalMetCount
        self.goalNotMetCount = goalNotMetCount
        self.evaluatedCallCount = evaluatedCallCount
        self.analyzedCallCount = analyzedCallCount
        self.goalMetRate = goalMetRate
        self.goalNotMetRate = goalNotMetRate
        self.date = date
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.registeredCallCount = try container.decode(Int.self, forKey: .registeredCallCount)
        self.eligibleCallCount = try container.decode(Int.self, forKey: .eligibleCallCount)
        self.ineligibleCallCount = try container.decode(Int.self, forKey: .ineligibleCallCount)
        self.unassessedCallCount = try container.decode(Int.self, forKey: .unassessedCallCount)
        self.goalMetCount = try container.decode(Int.self, forKey: .goalMetCount)
        self.goalNotMetCount = try container.decode(Int.self, forKey: .goalNotMetCount)
        self.evaluatedCallCount = try container.decode(Int.self, forKey: .evaluatedCallCount)
        self.analyzedCallCount = try container.decode(Int.self, forKey: .analyzedCallCount)
        self.goalMetRate = try container.decodeIfPresent(Double.self, forKey: .goalMetRate)
        self.goalNotMetRate = try container.decodeIfPresent(Double.self, forKey: .goalNotMetRate)
        self.date = try container.decode(CalendarDate.self, forKey: .date)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.registeredCallCount, forKey: .registeredCallCount)
        try container.encode(self.eligibleCallCount, forKey: .eligibleCallCount)
        try container.encode(self.ineligibleCallCount, forKey: .ineligibleCallCount)
        try container.encode(self.unassessedCallCount, forKey: .unassessedCallCount)
        try container.encode(self.goalMetCount, forKey: .goalMetCount)
        try container.encode(self.goalNotMetCount, forKey: .goalNotMetCount)
        try container.encode(self.evaluatedCallCount, forKey: .evaluatedCallCount)
        try container.encode(self.analyzedCallCount, forKey: .analyzedCallCount)
        try container.encodeIfPresent(self.goalMetRate, forKey: .goalMetRate)
        try container.encodeIfPresent(self.goalNotMetRate, forKey: .goalNotMetRate)
        try container.encode(self.date, forKey: .date)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case registeredCallCount
        case eligibleCallCount
        case ineligibleCallCount
        case unassessedCallCount
        case goalMetCount
        case goalNotMetCount
        case evaluatedCallCount
        case analyzedCallCount
        case goalMetRate
        case goalNotMetRate
        case date
    }
}
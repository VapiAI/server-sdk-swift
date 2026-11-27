import Foundation

public struct TrafficTabVersionMetricsDto: Codable, Hashable, Sendable {
    public let assistantVersionId: Nullable<String>?
    /// The published version label, such as "v7". Null when no version row resolves (unversioned calls, or a since-purged version).
    public let assistantVersionLabel: Nullable<String>?
    /// True for the row aggregating calls with no assistant version (stored as SQL NULL).
    public let unversioned: Bool?
    public let calls: Double
    /// The version's share in the currently-governing allocation. Null when the version is not in the current split — never rendered as 0%.
    public let configuredPercentage: Nullable<Double>?
    /// calls / totalCalls * 100 over the window, rounded to 3 decimals.
    public let actualPercentage: Double
    public let durationSeconds: TrafficTabDurationSecondsDto
    public let costPerMinute: TrafficTabCostPerMinuteDto
    public let latencyMs: TrafficTabLatencyMsDto
    /// Full per-reason counts; the UI unions and top-Ns.
    public let endedReasons: [TrafficTabEndedReasonCountDto]
    public let timeseries: [TrafficTabTimeseriesPointDto]
    /// Present only when structuredOutputIds was given.
    public let structuredOutputs: [TrafficTabStructuredOutputDto]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantVersionId: Nullable<String>? = nil,
        assistantVersionLabel: Nullable<String>? = nil,
        unversioned: Bool? = nil,
        calls: Double,
        configuredPercentage: Nullable<Double>? = nil,
        actualPercentage: Double,
        durationSeconds: TrafficTabDurationSecondsDto,
        costPerMinute: TrafficTabCostPerMinuteDto,
        latencyMs: TrafficTabLatencyMsDto,
        endedReasons: [TrafficTabEndedReasonCountDto],
        timeseries: [TrafficTabTimeseriesPointDto],
        structuredOutputs: [TrafficTabStructuredOutputDto]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantVersionId = assistantVersionId
        self.assistantVersionLabel = assistantVersionLabel
        self.unversioned = unversioned
        self.calls = calls
        self.configuredPercentage = configuredPercentage
        self.actualPercentage = actualPercentage
        self.durationSeconds = durationSeconds
        self.costPerMinute = costPerMinute
        self.latencyMs = latencyMs
        self.endedReasons = endedReasons
        self.timeseries = timeseries
        self.structuredOutputs = structuredOutputs
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantVersionId = try container.decodeNullableIfPresent(String.self, forKey: .assistantVersionId)
        self.assistantVersionLabel = try container.decodeNullableIfPresent(String.self, forKey: .assistantVersionLabel)
        self.unversioned = try container.decodeIfPresent(Bool.self, forKey: .unversioned)
        self.calls = try container.decode(Double.self, forKey: .calls)
        self.configuredPercentage = try container.decodeNullableIfPresent(Double.self, forKey: .configuredPercentage)
        self.actualPercentage = try container.decode(Double.self, forKey: .actualPercentage)
        self.durationSeconds = try container.decode(TrafficTabDurationSecondsDto.self, forKey: .durationSeconds)
        self.costPerMinute = try container.decode(TrafficTabCostPerMinuteDto.self, forKey: .costPerMinute)
        self.latencyMs = try container.decode(TrafficTabLatencyMsDto.self, forKey: .latencyMs)
        self.endedReasons = try container.decode([TrafficTabEndedReasonCountDto].self, forKey: .endedReasons)
        self.timeseries = try container.decode([TrafficTabTimeseriesPointDto].self, forKey: .timeseries)
        self.structuredOutputs = try container.decodeIfPresent([TrafficTabStructuredOutputDto].self, forKey: .structuredOutputs)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.assistantVersionId, forKey: .assistantVersionId)
        try container.encodeNullableIfPresent(self.assistantVersionLabel, forKey: .assistantVersionLabel)
        try container.encodeIfPresent(self.unversioned, forKey: .unversioned)
        try container.encode(self.calls, forKey: .calls)
        try container.encodeNullableIfPresent(self.configuredPercentage, forKey: .configuredPercentage)
        try container.encode(self.actualPercentage, forKey: .actualPercentage)
        try container.encode(self.durationSeconds, forKey: .durationSeconds)
        try container.encode(self.costPerMinute, forKey: .costPerMinute)
        try container.encode(self.latencyMs, forKey: .latencyMs)
        try container.encode(self.endedReasons, forKey: .endedReasons)
        try container.encode(self.timeseries, forKey: .timeseries)
        try container.encodeIfPresent(self.structuredOutputs, forKey: .structuredOutputs)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantVersionId
        case assistantVersionLabel
        case unversioned
        case calls
        case configuredPercentage
        case actualPercentage
        case durationSeconds
        case costPerMinute
        case latencyMs
        case endedReasons
        case timeseries
        case structuredOutputs
    }
}
import Foundation

public struct SimulationRunItemCounts: Codable, Hashable, Sendable {
    /// The total number of run items.
    public let total: Double
    /// The number of run items that passed all required evaluations.
    public let passed: Double
    /// The number of run items that failed at least one required evaluation.
    public let failed: Double
    /// The number of run items currently running or evaluating.
    public let running: Double
    /// The number of run items waiting to start.
    public let queued: Double
    /// The number of run items that were canceled.
    public let canceled: Double
    /// Number of distinct simulations represented by the run items. Omitted when any item has no simulation ID.
    public let distinctSimulationTotal: Double?
    /// Number of distinct simulations with a failed or canceled item. Omitted when any item has no simulation ID.
    public let distinctSimulationFailed: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        total: Double,
        passed: Double,
        failed: Double,
        running: Double,
        queued: Double,
        canceled: Double,
        distinctSimulationTotal: Double? = nil,
        distinctSimulationFailed: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.total = total
        self.passed = passed
        self.failed = failed
        self.running = running
        self.queued = queued
        self.canceled = canceled
        self.distinctSimulationTotal = distinctSimulationTotal
        self.distinctSimulationFailed = distinctSimulationFailed
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.total = try container.decode(Double.self, forKey: .total)
        self.passed = try container.decode(Double.self, forKey: .passed)
        self.failed = try container.decode(Double.self, forKey: .failed)
        self.running = try container.decode(Double.self, forKey: .running)
        self.queued = try container.decode(Double.self, forKey: .queued)
        self.canceled = try container.decode(Double.self, forKey: .canceled)
        self.distinctSimulationTotal = try container.decodeIfPresent(Double.self, forKey: .distinctSimulationTotal)
        self.distinctSimulationFailed = try container.decodeIfPresent(Double.self, forKey: .distinctSimulationFailed)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.total, forKey: .total)
        try container.encode(self.passed, forKey: .passed)
        try container.encode(self.failed, forKey: .failed)
        try container.encode(self.running, forKey: .running)
        try container.encode(self.queued, forKey: .queued)
        try container.encode(self.canceled, forKey: .canceled)
        try container.encodeIfPresent(self.distinctSimulationTotal, forKey: .distinctSimulationTotal)
        try container.encodeIfPresent(self.distinctSimulationFailed, forKey: .distinctSimulationFailed)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case total
        case passed
        case failed
        case running
        case queued
        case canceled
        case distinctSimulationTotal
        case distinctSimulationFailed
    }
}
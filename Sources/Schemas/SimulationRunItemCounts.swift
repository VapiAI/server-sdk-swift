import Foundation

public struct SimulationRunItemCounts: Codable, Hashable, Sendable {
    /// Total number of run items
    public let total: Double
    /// Number of passed run items
    public let passed: Double
    /// Number of failed run items
    public let failed: Double
    /// Number of running/evaluating run items
    public let running: Double
    /// Number of queued run items
    public let queued: Double
    /// Number of canceled run items
    public let canceled: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        total: Double,
        passed: Double,
        failed: Double,
        running: Double,
        queued: Double,
        canceled: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.total = total
        self.passed = passed
        self.failed = failed
        self.running = running
        self.queued = queued
        self.canceled = canceled
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
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case total
        case passed
        case failed
        case running
        case queued
        case canceled
    }
}
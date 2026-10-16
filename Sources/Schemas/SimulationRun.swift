import Foundation

public struct SimulationRun: Codable, Hashable, Sendable {
    /// Unique identifier for the run
    public let id: String
    /// Organization ID
    public let orgId: String
    /// The run's current status. One of `queued`, `running`, or `ended`.
    public let status: SimulationRunStatus
    /// When the run was queued
    public let queuedAt: Date
    /// When the run started
    public let startedAt: Date?
    /// When the run ended
    public let endedAt: Date?
    /// Why the run ended, when applicable.
    public let endedReason: String?
    /// ISO 8601 date-time when created
    public let createdAt: Date
    /// ISO 8601 date-time when last updated
    public let updatedAt: Date
    /// Aggregate counts of the run's items by status.
    public let itemCounts: SimulationRunItemCounts?
    /// The simulations and suites included in the run.
    public let simulations: [SimulationRunSimulationsItem]
    /// The assistant or squad the run was tested against.
    public let target: SimulationRunTarget
    /// The number of times each simulation was run. Defaults to 1.
    public let iterations: Double?
    /// The transport used for the run, either voice or chat.
    public let transport: SimulationRunTransportConfiguration?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        orgId: String,
        status: SimulationRunStatus,
        queuedAt: Date,
        startedAt: Date? = nil,
        endedAt: Date? = nil,
        endedReason: String? = nil,
        createdAt: Date,
        updatedAt: Date,
        itemCounts: SimulationRunItemCounts? = nil,
        simulations: [SimulationRunSimulationsItem],
        target: SimulationRunTarget,
        iterations: Double? = nil,
        transport: SimulationRunTransportConfiguration? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.orgId = orgId
        self.status = status
        self.queuedAt = queuedAt
        self.startedAt = startedAt
        self.endedAt = endedAt
        self.endedReason = endedReason
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.itemCounts = itemCounts
        self.simulations = simulations
        self.target = target
        self.iterations = iterations
        self.transport = transport
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.status = try container.decode(SimulationRunStatus.self, forKey: .status)
        self.queuedAt = try container.decode(Date.self, forKey: .queuedAt)
        self.startedAt = try container.decodeIfPresent(Date.self, forKey: .startedAt)
        self.endedAt = try container.decodeIfPresent(Date.self, forKey: .endedAt)
        self.endedReason = try container.decodeIfPresent(String.self, forKey: .endedReason)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.itemCounts = try container.decodeIfPresent(SimulationRunItemCounts.self, forKey: .itemCounts)
        self.simulations = try container.decode([SimulationRunSimulationsItem].self, forKey: .simulations)
        self.target = try container.decode(SimulationRunTarget.self, forKey: .target)
        self.iterations = try container.decodeIfPresent(Double.self, forKey: .iterations)
        self.transport = try container.decodeIfPresent(SimulationRunTransportConfiguration.self, forKey: .transport)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.queuedAt, forKey: .queuedAt)
        try container.encodeIfPresent(self.startedAt, forKey: .startedAt)
        try container.encodeIfPresent(self.endedAt, forKey: .endedAt)
        try container.encodeIfPresent(self.endedReason, forKey: .endedReason)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.itemCounts, forKey: .itemCounts)
        try container.encode(self.simulations, forKey: .simulations)
        try container.encode(self.target, forKey: .target)
        try container.encodeIfPresent(self.iterations, forKey: .iterations)
        try container.encodeIfPresent(self.transport, forKey: .transport)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case orgId
        case status
        case queuedAt
        case startedAt
        case endedAt
        case endedReason
        case createdAt
        case updatedAt
        case itemCounts
        case simulations
        case target
        case iterations
        case transport
    }
}
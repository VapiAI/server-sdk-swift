import Foundation

public struct SimulationRunItem: Codable, Hashable, Sendable {
    /// This is the unique identifier for the simulation run item.
    public let id: String
    /// This is the unique identifier for the organization.
    public let orgId: String
    /// This is the ID of the simulation this run belongs to.
    public let simulationId: String
    /// This is the current status of the run.
    public let status: SimulationRunItemStatus
    /// This is the ISO 8601 date-time string of when the run was queued.
    public let queuedAt: Date
    /// This is the ISO 8601 date-time string of when the run started.
    public let startedAt: Date?
    /// This is the ISO 8601 date-time string of when the run completed.
    public let completedAt: Date?
    /// This is the ISO 8601 date-time string of when the run failed.
    public let failedAt: Date?
    /// This is the ISO 8601 date-time string of when the run was canceled.
    public let canceledAt: Date?
    /// This is the reason for failure.
    public let failureReason: String?
    /// This is the ID of the target Vapi call (the assistant being tested).
    public let callId: String?
    /// This is the ISO 8601 date-time string of when the run item was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the run item was last updated.
    public let updatedAt: Date
    /// This is the ID of the parent run (batch/group).
    public let runId: String?
    /// Hooks configured for this simulation run item
    public let hooks: [SimulationRunItemHooksItem]?
    /// This is the iteration number (1-indexed) when run with iterations > 1.
    public let iterationNumber: Double?
    /// This is the session ID for chat-based simulations (webchat transport).
    public let sessionId: String?
    /// This is the scenario ID at run creation time.
    public let scenarioId: String?
    /// This is the personality ID at run creation time.
    public let personalityId: String?
    /// This is the metadata containing snapshots and call data.
    public let metadata: SimulationRunItemMetadata?
    /// This is the results of the simulation run.
    public let results: SimulationRunItemResults?
    /// This is the AI-generated improvement suggestions for failed runs.
    public let improvementSuggestions: SimulationRunItemImprovements?
    /// This is the configuration for how this simulation run executes.
    public let configurations: SimulationRunConfiguration?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        orgId: String,
        simulationId: String,
        status: SimulationRunItemStatus,
        queuedAt: Date,
        startedAt: Date? = nil,
        completedAt: Date? = nil,
        failedAt: Date? = nil,
        canceledAt: Date? = nil,
        failureReason: String? = nil,
        callId: String? = nil,
        createdAt: Date,
        updatedAt: Date,
        runId: String? = nil,
        hooks: [SimulationRunItemHooksItem]? = nil,
        iterationNumber: Double? = nil,
        sessionId: String? = nil,
        scenarioId: String? = nil,
        personalityId: String? = nil,
        metadata: SimulationRunItemMetadata? = nil,
        results: SimulationRunItemResults? = nil,
        improvementSuggestions: SimulationRunItemImprovements? = nil,
        configurations: SimulationRunConfiguration? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.orgId = orgId
        self.simulationId = simulationId
        self.status = status
        self.queuedAt = queuedAt
        self.startedAt = startedAt
        self.completedAt = completedAt
        self.failedAt = failedAt
        self.canceledAt = canceledAt
        self.failureReason = failureReason
        self.callId = callId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.runId = runId
        self.hooks = hooks
        self.iterationNumber = iterationNumber
        self.sessionId = sessionId
        self.scenarioId = scenarioId
        self.personalityId = personalityId
        self.metadata = metadata
        self.results = results
        self.improvementSuggestions = improvementSuggestions
        self.configurations = configurations
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.simulationId = try container.decode(String.self, forKey: .simulationId)
        self.status = try container.decode(SimulationRunItemStatus.self, forKey: .status)
        self.queuedAt = try container.decode(Date.self, forKey: .queuedAt)
        self.startedAt = try container.decodeIfPresent(Date.self, forKey: .startedAt)
        self.completedAt = try container.decodeIfPresent(Date.self, forKey: .completedAt)
        self.failedAt = try container.decodeIfPresent(Date.self, forKey: .failedAt)
        self.canceledAt = try container.decodeIfPresent(Date.self, forKey: .canceledAt)
        self.failureReason = try container.decodeIfPresent(String.self, forKey: .failureReason)
        self.callId = try container.decodeIfPresent(String.self, forKey: .callId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.runId = try container.decodeIfPresent(String.self, forKey: .runId)
        self.hooks = try container.decodeIfPresent([SimulationRunItemHooksItem].self, forKey: .hooks)
        self.iterationNumber = try container.decodeIfPresent(Double.self, forKey: .iterationNumber)
        self.sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        self.scenarioId = try container.decodeIfPresent(String.self, forKey: .scenarioId)
        self.personalityId = try container.decodeIfPresent(String.self, forKey: .personalityId)
        self.metadata = try container.decodeIfPresent(SimulationRunItemMetadata.self, forKey: .metadata)
        self.results = try container.decodeIfPresent(SimulationRunItemResults.self, forKey: .results)
        self.improvementSuggestions = try container.decodeIfPresent(SimulationRunItemImprovements.self, forKey: .improvementSuggestions)
        self.configurations = try container.decodeIfPresent(SimulationRunConfiguration.self, forKey: .configurations)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.simulationId, forKey: .simulationId)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.queuedAt, forKey: .queuedAt)
        try container.encodeIfPresent(self.startedAt, forKey: .startedAt)
        try container.encodeIfPresent(self.completedAt, forKey: .completedAt)
        try container.encodeIfPresent(self.failedAt, forKey: .failedAt)
        try container.encodeIfPresent(self.canceledAt, forKey: .canceledAt)
        try container.encodeIfPresent(self.failureReason, forKey: .failureReason)
        try container.encodeIfPresent(self.callId, forKey: .callId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.runId, forKey: .runId)
        try container.encodeIfPresent(self.hooks, forKey: .hooks)
        try container.encodeIfPresent(self.iterationNumber, forKey: .iterationNumber)
        try container.encodeIfPresent(self.sessionId, forKey: .sessionId)
        try container.encodeIfPresent(self.scenarioId, forKey: .scenarioId)
        try container.encodeIfPresent(self.personalityId, forKey: .personalityId)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.results, forKey: .results)
        try container.encodeIfPresent(self.improvementSuggestions, forKey: .improvementSuggestions)
        try container.encodeIfPresent(self.configurations, forKey: .configurations)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case orgId
        case simulationId
        case status
        case queuedAt
        case startedAt
        case completedAt
        case failedAt
        case canceledAt
        case failureReason
        case callId
        case createdAt
        case updatedAt
        case runId
        case hooks
        case iterationNumber
        case sessionId
        case scenarioId
        case personalityId
        case metadata
        case results
        case improvementSuggestions
        case configurations
    }
}
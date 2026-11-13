import Foundation

public struct SimulationOnboardingSuiteViewDto: Codable, Hashable, Sendable {
    /// The generated simulation suite id and name.
    public let suite: SimulationOnboardingSuiteRefDto
    /// Assistant the suite is assigned to.
    public let assistantId: String
    /// The suite's simulations, in order.
    public let simulations: [SimulationOnboardingSuiteSimulationDto]
    /// Counts of covered and total requirements, uncovered requirements, and scenarios available to retry.
    public let coverage: SimulationOnboardingSuiteCoverageDto
    /// The test requirements used to generate the suite. Match their ids to `coverage.gaps` to identify uncovered requirements.
    public let requirements: [SimulationOnboardingRequirementDto]
    /// Links to simulation testing best practices and tool mocking documentation.
    public let docs: SimulationOnboardingSuiteDocsDto
    /// True when the request matched one already applied (same `idempotencyKey` or `patchKey`) and nothing changed.
    public let reused: Bool
    /// Simulations an edit asked to rewrite that were not rewritten, for example because the rewrite did not generate in time. Retry them with a new `patchKey`.
    public let failedEditSimulationIds: [String]?
    /// Tool paths the suite's simulations do not exercise as configured, such as a tool mocked although it runs natively. Omitted when there are none.
    public let toolGaps: [SimulationOnboardingToolGapDto]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        suite: SimulationOnboardingSuiteRefDto,
        assistantId: String,
        simulations: [SimulationOnboardingSuiteSimulationDto],
        coverage: SimulationOnboardingSuiteCoverageDto,
        requirements: [SimulationOnboardingRequirementDto],
        docs: SimulationOnboardingSuiteDocsDto,
        reused: Bool,
        failedEditSimulationIds: [String]? = nil,
        toolGaps: [SimulationOnboardingToolGapDto]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.suite = suite
        self.assistantId = assistantId
        self.simulations = simulations
        self.coverage = coverage
        self.requirements = requirements
        self.docs = docs
        self.reused = reused
        self.failedEditSimulationIds = failedEditSimulationIds
        self.toolGaps = toolGaps
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.suite = try container.decode(SimulationOnboardingSuiteRefDto.self, forKey: .suite)
        self.assistantId = try container.decode(String.self, forKey: .assistantId)
        self.simulations = try container.decode([SimulationOnboardingSuiteSimulationDto].self, forKey: .simulations)
        self.coverage = try container.decode(SimulationOnboardingSuiteCoverageDto.self, forKey: .coverage)
        self.requirements = try container.decode([SimulationOnboardingRequirementDto].self, forKey: .requirements)
        self.docs = try container.decode(SimulationOnboardingSuiteDocsDto.self, forKey: .docs)
        self.reused = try container.decode(Bool.self, forKey: .reused)
        self.failedEditSimulationIds = try container.decodeIfPresent([String].self, forKey: .failedEditSimulationIds)
        self.toolGaps = try container.decodeIfPresent([SimulationOnboardingToolGapDto].self, forKey: .toolGaps)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.suite, forKey: .suite)
        try container.encode(self.assistantId, forKey: .assistantId)
        try container.encode(self.simulations, forKey: .simulations)
        try container.encode(self.coverage, forKey: .coverage)
        try container.encode(self.requirements, forKey: .requirements)
        try container.encode(self.docs, forKey: .docs)
        try container.encode(self.reused, forKey: .reused)
        try container.encodeIfPresent(self.failedEditSimulationIds, forKey: .failedEditSimulationIds)
        try container.encodeIfPresent(self.toolGaps, forKey: .toolGaps)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case suite
        case assistantId
        case simulations
        case coverage
        case requirements
        case docs
        case reused
        case failedEditSimulationIds
        case toolGaps
    }
}
import Foundation

public struct Scenario: Codable, Hashable, Sendable {
    /// This is the unique identifier for the scenario.
    public let id: String
    /// This is the unique identifier for the organization this scenario belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the scenario was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the scenario was last updated.
    public let updatedAt: Date
    /// This is the name of the scenario.
    public let name: String
    /// This is the script/instructions for the tester to follow during the simulation.
    public let instructions: String
    /// This is the structured output-based evaluation plan for the simulation.
    /// Each item defines a structured output to extract and evaluate against an expected value.
    public let evaluations: [EvaluationPlanItem]
    /// Hooks to run on simulation lifecycle events
    public let hooks: [ScenarioHooksItem]?
    /// Overrides to inject into the simulated target assistant or squad
    public let targetOverrides: AssistantOverrides?
    /// Scenario-level tool call mocks to use during simulations.
    public let toolMocks: [ScenarioToolMock]?
    /// Optional folder path for organizing scenarios.
    /// Supports up to 3 levels (e.g., "dept/feature/variant").
    /// Maps to GitOps resource folder structure.
    public let path: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String,
        instructions: String,
        evaluations: [EvaluationPlanItem],
        hooks: [ScenarioHooksItem]? = nil,
        targetOverrides: AssistantOverrides? = nil,
        toolMocks: [ScenarioToolMock]? = nil,
        path: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.instructions = instructions
        self.evaluations = evaluations
        self.hooks = hooks
        self.targetOverrides = targetOverrides
        self.toolMocks = toolMocks
        self.path = path
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.instructions = try container.decode(String.self, forKey: .instructions)
        self.evaluations = try container.decode([EvaluationPlanItem].self, forKey: .evaluations)
        self.hooks = try container.decodeIfPresent([ScenarioHooksItem].self, forKey: .hooks)
        self.targetOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .targetOverrides)
        self.toolMocks = try container.decodeIfPresent([ScenarioToolMock].self, forKey: .toolMocks)
        self.path = try container.decodeNullableIfPresent(String.self, forKey: .path)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.instructions, forKey: .instructions)
        try container.encode(self.evaluations, forKey: .evaluations)
        try container.encodeIfPresent(self.hooks, forKey: .hooks)
        try container.encodeIfPresent(self.targetOverrides, forKey: .targetOverrides)
        try container.encodeIfPresent(self.toolMocks, forKey: .toolMocks)
        try container.encodeNullableIfPresent(self.path, forKey: .path)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case instructions
        case evaluations
        case hooks
        case targetOverrides
        case toolMocks
        case path
    }
}
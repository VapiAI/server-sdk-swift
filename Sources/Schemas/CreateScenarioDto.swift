import Foundation

public struct CreateScenarioDto: Codable, Hashable, Sendable {
    /// This is the name of the scenario.
    public let name: String
    /// This is the script/instructions for the tester to follow during the simulation.
    public let instructions: String
    /// This is the structured output-based evaluation plan for the simulation.
    /// Each item defines a structured output to extract and evaluate against an expected value.
    public let evaluations: [EvaluationPlanItem]
    /// Hooks to run on simulation lifecycle events
    public let hooks: [CreateScenarioDtoHooksItem]?
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
        name: String,
        instructions: String,
        evaluations: [EvaluationPlanItem],
        hooks: [CreateScenarioDtoHooksItem]? = nil,
        targetOverrides: AssistantOverrides? = nil,
        toolMocks: [ScenarioToolMock]? = nil,
        path: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
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
        self.name = try container.decode(String.self, forKey: .name)
        self.instructions = try container.decode(String.self, forKey: .instructions)
        self.evaluations = try container.decode([EvaluationPlanItem].self, forKey: .evaluations)
        self.hooks = try container.decodeIfPresent([CreateScenarioDtoHooksItem].self, forKey: .hooks)
        self.targetOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .targetOverrides)
        self.toolMocks = try container.decodeIfPresent([ScenarioToolMock].self, forKey: .toolMocks)
        self.path = try container.decodeNullableIfPresent(String.self, forKey: .path)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
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
        case name
        case instructions
        case evaluations
        case hooks
        case targetOverrides
        case toolMocks
        case path
    }
}
import Foundation

public struct SimulationRunItemImprovements: Codable, Hashable, Sendable {
    /// This is a summary analysis of why evaluations failed.
    public let analysis: String
    /// This is the list of suggestions for improving the system prompt.
    public let systemPromptSuggestions: [SimulationRunItemImprovementSuggestion]
    /// This is the list of suggestions for improving tools.
    public let toolSuggestions: [SimulationRunItemImprovementSuggestion]
    /// This is the list of suggestions for improving the scenario/evaluation plan.
    public let scenarioSuggestions: [SimulationRunItemImprovementSuggestion]
    /// This is a complete revised system prompt if major changes are needed.
    public let suggestedSystemPrompt: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        analysis: String,
        systemPromptSuggestions: [SimulationRunItemImprovementSuggestion],
        toolSuggestions: [SimulationRunItemImprovementSuggestion],
        scenarioSuggestions: [SimulationRunItemImprovementSuggestion],
        suggestedSystemPrompt: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.analysis = analysis
        self.systemPromptSuggestions = systemPromptSuggestions
        self.toolSuggestions = toolSuggestions
        self.scenarioSuggestions = scenarioSuggestions
        self.suggestedSystemPrompt = suggestedSystemPrompt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.analysis = try container.decode(String.self, forKey: .analysis)
        self.systemPromptSuggestions = try container.decode([SimulationRunItemImprovementSuggestion].self, forKey: .systemPromptSuggestions)
        self.toolSuggestions = try container.decode([SimulationRunItemImprovementSuggestion].self, forKey: .toolSuggestions)
        self.scenarioSuggestions = try container.decode([SimulationRunItemImprovementSuggestion].self, forKey: .scenarioSuggestions)
        self.suggestedSystemPrompt = try container.decodeIfPresent(String.self, forKey: .suggestedSystemPrompt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.analysis, forKey: .analysis)
        try container.encode(self.systemPromptSuggestions, forKey: .systemPromptSuggestions)
        try container.encode(self.toolSuggestions, forKey: .toolSuggestions)
        try container.encode(self.scenarioSuggestions, forKey: .scenarioSuggestions)
        try container.encodeIfPresent(self.suggestedSystemPrompt, forKey: .suggestedSystemPrompt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case analysis
        case systemPromptSuggestions
        case toolSuggestions
        case scenarioSuggestions
        case suggestedSystemPrompt
    }
}
import Foundation

public struct SimulationRunSimulationEntry: Codable, Hashable, Sendable {
    /// ID of an existing simulation to run. When provided, scenarioId/personalityId/inline fields are ignored.
    public let simulationId: String?
    /// ID of an existing scenario. Cannot be combined with inline scenario.
    public let scenarioId: String?
    /// Inline scenario configuration. Cannot be combined with scenarioId.
    public let scenario: CreateScenarioDto?
    /// ID of an existing personality. Cannot be combined with inline personality.
    public let personalityId: String?
    /// Inline personality configuration. Cannot be combined with personalityId.
    public let personality: CreatePersonalityDto?
    /// Optional name for this simulation entry
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        simulationId: String? = nil,
        scenarioId: String? = nil,
        scenario: CreateScenarioDto? = nil,
        personalityId: String? = nil,
        personality: CreatePersonalityDto? = nil,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.simulationId = simulationId
        self.scenarioId = scenarioId
        self.scenario = scenario
        self.personalityId = personalityId
        self.personality = personality
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.simulationId = try container.decodeIfPresent(String.self, forKey: .simulationId)
        self.scenarioId = try container.decodeIfPresent(String.self, forKey: .scenarioId)
        self.scenario = try container.decodeIfPresent(CreateScenarioDto.self, forKey: .scenario)
        self.personalityId = try container.decodeIfPresent(String.self, forKey: .personalityId)
        self.personality = try container.decodeIfPresent(CreatePersonalityDto.self, forKey: .personality)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.simulationId, forKey: .simulationId)
        try container.encodeIfPresent(self.scenarioId, forKey: .scenarioId)
        try container.encodeIfPresent(self.scenario, forKey: .scenario)
        try container.encodeIfPresent(self.personalityId, forKey: .personalityId)
        try container.encodeIfPresent(self.personality, forKey: .personality)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case simulationId
        case scenarioId
        case scenario
        case personalityId
        case personality
        case name
    }
}
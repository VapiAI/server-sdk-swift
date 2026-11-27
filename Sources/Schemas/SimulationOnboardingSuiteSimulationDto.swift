import Foundation

public struct SimulationOnboardingSuiteSimulationDto: Codable, Hashable, Sendable {
    /// Simulation id; pass it back to edit or remove the simulation.
    public let id: String
    /// Scenario the simulation runs.
    public let scenarioId: String
    /// Scenario name.
    public let name: String
    /// Name of the simulated caller's personality.
    public let personalityName: String?
    /// Each success criterion, as the yes/no question it is judged by.
    public let successCriteria: [String]
    /// Requirement ids this simulation covers, e.g. `R3`.
    public let requirementIds: [String]
    /// Tools the scenario mocks.
    public let mockedTools: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        scenarioId: String,
        name: String,
        personalityName: String? = nil,
        successCriteria: [String],
        requirementIds: [String],
        mockedTools: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.scenarioId = scenarioId
        self.name = name
        self.personalityName = personalityName
        self.successCriteria = successCriteria
        self.requirementIds = requirementIds
        self.mockedTools = mockedTools
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.scenarioId = try container.decode(String.self, forKey: .scenarioId)
        self.name = try container.decode(String.self, forKey: .name)
        self.personalityName = try container.decodeIfPresent(String.self, forKey: .personalityName)
        self.successCriteria = try container.decode([String].self, forKey: .successCriteria)
        self.requirementIds = try container.decode([String].self, forKey: .requirementIds)
        self.mockedTools = try container.decode([String].self, forKey: .mockedTools)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.scenarioId, forKey: .scenarioId)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.personalityName, forKey: .personalityName)
        try container.encode(self.successCriteria, forKey: .successCriteria)
        try container.encode(self.requirementIds, forKey: .requirementIds)
        try container.encode(self.mockedTools, forKey: .mockedTools)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case scenarioId
        case name
        case personalityName
        case successCriteria
        case requirementIds
        case mockedTools
    }
}
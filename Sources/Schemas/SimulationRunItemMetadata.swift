import Foundation

public struct SimulationRunItemMetadata: Codable, Hashable, Sendable {
    /// This is a snapshot of the assistant at run creation time.
    public let assistant: [String: JSONValue]?
    /// This is a snapshot of the squad at run creation time.
    public let squad: [String: JSONValue]?
    /// This is a snapshot of the scenario at run creation time.
    public let scenario: [String: JSONValue]?
    /// This is a snapshot of the personality at run creation time.
    public let personality: [String: JSONValue]?
    /// This is a snapshot of the simulation at run creation time.
    public let simulation: [String: JSONValue]?
    /// This is the call-related data (transcript, messages, recording).
    public let call: SimulationRunItemCallMetadata?
    /// Hook execution state for this run item (used for idempotency + debugging).
    public let hooks: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistant: [String: JSONValue]? = nil,
        squad: [String: JSONValue]? = nil,
        scenario: [String: JSONValue]? = nil,
        personality: [String: JSONValue]? = nil,
        simulation: [String: JSONValue]? = nil,
        call: SimulationRunItemCallMetadata? = nil,
        hooks: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistant = assistant
        self.squad = squad
        self.scenario = scenario
        self.personality = personality
        self.simulation = simulation
        self.call = call
        self.hooks = hooks
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistant = try container.decodeIfPresent([String: JSONValue].self, forKey: .assistant)
        self.squad = try container.decodeIfPresent([String: JSONValue].self, forKey: .squad)
        self.scenario = try container.decodeIfPresent([String: JSONValue].self, forKey: .scenario)
        self.personality = try container.decodeIfPresent([String: JSONValue].self, forKey: .personality)
        self.simulation = try container.decodeIfPresent([String: JSONValue].self, forKey: .simulation)
        self.call = try container.decodeIfPresent(SimulationRunItemCallMetadata.self, forKey: .call)
        self.hooks = try container.decodeIfPresent([String: JSONValue].self, forKey: .hooks)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.squad, forKey: .squad)
        try container.encodeIfPresent(self.scenario, forKey: .scenario)
        try container.encodeIfPresent(self.personality, forKey: .personality)
        try container.encodeIfPresent(self.simulation, forKey: .simulation)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.hooks, forKey: .hooks)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistant
        case squad
        case scenario
        case personality
        case simulation
        case call
        case hooks
    }
}
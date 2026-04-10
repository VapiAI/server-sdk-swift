import Foundation

public struct HandoffDestinationSquad: Codable, Hashable, Sendable {
    /// This is the plan for manipulating the message context before handing off the call to the squad.
    public let contextEngineeringPlan: HandoffDestinationSquadContextEngineeringPlan?
    /// This is the squad id to transfer the call to.
    public let squadId: String?
    /// This is a transient squad to transfer the call to.
    public let squad: CreateSquadDto?
    /// This is the name of the entry assistant to start with when handing off to the squad.
    /// If not provided, the first member of the squad will be used.
    public let entryAssistantName: String?
    /// This is the variable extraction plan for the handoff tool.
    public let variableExtractionPlan: VariableExtractionPlan?
    /// These are the overrides to apply to the squad configuration.
    /// Maps to squad-level membersOverrides.
    public let squadOverrides: AssistantOverrides?
    /// This is the description of the destination, used by the AI to choose when and how to transfer the call.
    public let description: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        contextEngineeringPlan: HandoffDestinationSquadContextEngineeringPlan? = nil,
        squadId: String? = nil,
        squad: CreateSquadDto? = nil,
        entryAssistantName: String? = nil,
        variableExtractionPlan: VariableExtractionPlan? = nil,
        squadOverrides: AssistantOverrides? = nil,
        description: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.contextEngineeringPlan = contextEngineeringPlan
        self.squadId = squadId
        self.squad = squad
        self.entryAssistantName = entryAssistantName
        self.variableExtractionPlan = variableExtractionPlan
        self.squadOverrides = squadOverrides
        self.description = description
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contextEngineeringPlan = try container.decodeIfPresent(HandoffDestinationSquadContextEngineeringPlan.self, forKey: .contextEngineeringPlan)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.squad = try container.decodeIfPresent(CreateSquadDto.self, forKey: .squad)
        self.entryAssistantName = try container.decodeIfPresent(String.self, forKey: .entryAssistantName)
        self.variableExtractionPlan = try container.decodeIfPresent(VariableExtractionPlan.self, forKey: .variableExtractionPlan)
        self.squadOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .squadOverrides)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.contextEngineeringPlan, forKey: .contextEngineeringPlan)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.squad, forKey: .squad)
        try container.encodeIfPresent(self.entryAssistantName, forKey: .entryAssistantName)
        try container.encodeIfPresent(self.variableExtractionPlan, forKey: .variableExtractionPlan)
        try container.encodeIfPresent(self.squadOverrides, forKey: .squadOverrides)
        try container.encodeIfPresent(self.description, forKey: .description)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case contextEngineeringPlan
        case squadId
        case squad
        case entryAssistantName
        case variableExtractionPlan
        case squadOverrides
        case description
    }
}
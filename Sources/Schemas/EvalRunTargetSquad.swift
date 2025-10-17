import Foundation

public struct EvalRunTargetSquad: Codable, Hashable, Sendable {
    /// This is the transient squad that will be run against the eval
    public let squad: CreateSquadDto?
    /// This is the overrides that will be applied to the assistants.
    public let assistantOverrides: AssistantOverrides?
    /// This is the id of the squad that will be run against the eval
    public let squadId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        squad: CreateSquadDto? = nil,
        assistantOverrides: AssistantOverrides? = nil,
        squadId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.squad = squad
        self.assistantOverrides = assistantOverrides
        self.squadId = squadId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.squad = try container.decodeIfPresent(CreateSquadDto.self, forKey: .squad)
        self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.squad, forKey: .squad)
        try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case squad
        case assistantOverrides
        case squadId
    }
}
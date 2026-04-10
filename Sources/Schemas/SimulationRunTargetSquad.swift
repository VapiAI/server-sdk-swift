import Foundation

public struct SimulationRunTargetSquad: Codable, Hashable, Sendable {
    /// ID of an existing squad to test against. Cannot be combined with inline squad.
    public let squadId: String?
    /// Inline squad configuration to test against. Cannot be combined with squadId.
    public let squad: CreateSquadDto?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        squadId: String? = nil,
        squad: CreateSquadDto? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.squadId = squadId
        self.squad = squad
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.squad = try container.decodeIfPresent(CreateSquadDto.self, forKey: .squad)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.squad, forKey: .squad)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case squadId
        case squad
    }
}
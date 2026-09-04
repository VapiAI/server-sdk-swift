import Foundation

public struct SimulationRunListSource: Codable, Hashable, Sendable {
    public let type: SimulationRunListSourceType
    public let id: String?
    public let name: String
    public let linkable: Bool
    public let simulationIds: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: SimulationRunListSourceType,
        id: String? = nil,
        name: String,
        linkable: Bool,
        simulationIds: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.id = id
        self.name = name
        self.linkable = linkable
        self.simulationIds = simulationIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(SimulationRunListSourceType.self, forKey: .type)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.linkable = try container.decode(Bool.self, forKey: .linkable)
        self.simulationIds = try container.decode([String].self, forKey: .simulationIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.linkable, forKey: .linkable)
        try container.encode(self.simulationIds, forKey: .simulationIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case id
        case name
        case linkable
        case simulationIds
    }
}
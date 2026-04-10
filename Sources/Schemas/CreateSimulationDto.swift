import Foundation

public struct CreateSimulationDto: Codable, Hashable, Sendable {
    /// This is an optional friendly name for the simulation.
    public let name: String?
    /// This is the ID of the scenario to use for this simulation.
    public let scenarioId: String
    /// This is the ID of the personality to use for this simulation.
    public let personalityId: String
    /// Optional folder path for organizing simulations.
    /// Supports up to 3 levels (e.g., "dept/feature/variant").
    /// Maps to GitOps resource folder structure.
    public let path: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        scenarioId: String,
        personalityId: String,
        path: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.scenarioId = scenarioId
        self.personalityId = personalityId
        self.path = path
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.scenarioId = try container.decode(String.self, forKey: .scenarioId)
        self.personalityId = try container.decode(String.self, forKey: .personalityId)
        self.path = try container.decodeNullableIfPresent(String.self, forKey: .path)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.scenarioId, forKey: .scenarioId)
        try container.encode(self.personalityId, forKey: .personalityId)
        try container.encodeNullableIfPresent(self.path, forKey: .path)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case scenarioId
        case personalityId
        case path
    }
}
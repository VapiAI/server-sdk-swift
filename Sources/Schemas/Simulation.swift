import Foundation

public struct Simulation: Codable, Hashable, Sendable {
    /// This is the unique identifier for the simulation.
    public let id: String
    /// This is the unique identifier for the organization this simulation belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the simulation was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the simulation was last updated.
    public let updatedAt: Date
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
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String? = nil,
        scenarioId: String,
        personalityId: String,
        path: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.scenarioId = scenarioId
        self.personalityId = personalityId
        self.path = path
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.scenarioId = try container.decode(String.self, forKey: .scenarioId)
        self.personalityId = try container.decode(String.self, forKey: .personalityId)
        self.path = try container.decodeNullableIfPresent(String.self, forKey: .path)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.scenarioId, forKey: .scenarioId)
        try container.encode(self.personalityId, forKey: .personalityId)
        try container.encodeNullableIfPresent(self.path, forKey: .path)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case scenarioId
        case personalityId
        case path
    }
}
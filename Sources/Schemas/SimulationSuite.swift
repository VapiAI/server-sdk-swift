import Foundation

public struct SimulationSuite: Codable, Hashable, Sendable {
    /// This is the unique identifier for the simulation suite.
    public let id: String
    /// This is the unique identifier for the organization this suite belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the suite was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the suite was last updated.
    public let updatedAt: Date
    /// This is the name of the simulation suite.
    public let name: String
    /// This is the Slack webhook URL for notifications.
    public let slackWebhookUrl: String?
    /// Optional folder path for organizing simulation suites.
    /// Supports up to 3 levels (e.g., "dept/feature/variant").
    /// Maps to GitOps resource folder structure.
    public let path: Nullable<String>?
    /// This is the list of simulation IDs in this suite.
    public let simulationIds: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String,
        slackWebhookUrl: String? = nil,
        path: Nullable<String>? = nil,
        simulationIds: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.slackWebhookUrl = slackWebhookUrl
        self.path = path
        self.simulationIds = simulationIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.slackWebhookUrl = try container.decodeIfPresent(String.self, forKey: .slackWebhookUrl)
        self.path = try container.decodeNullableIfPresent(String.self, forKey: .path)
        self.simulationIds = try container.decode([String].self, forKey: .simulationIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.slackWebhookUrl, forKey: .slackWebhookUrl)
        try container.encodeNullableIfPresent(self.path, forKey: .path)
        try container.encode(self.simulationIds, forKey: .simulationIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case slackWebhookUrl
        case path
        case simulationIds
    }
}
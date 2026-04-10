import Foundation

public struct UpdateSimulationSuiteDto: Codable, Hashable, Sendable {
    /// This is the name of the simulation suite.
    public let name: String?
    /// This is the Slack webhook URL for notifications.
    public let slackWebhookUrl: String?
    /// This is the list of simulation IDs to include in the suite (replaces existing).
    public let simulationIds: [String]?
    /// Optional folder path for organizing simulation suites.
    /// Supports up to 3 levels (e.g., "dept/feature/variant").
    /// Set to null to remove from folder.
    public let path: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        slackWebhookUrl: String? = nil,
        simulationIds: [String]? = nil,
        path: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.slackWebhookUrl = slackWebhookUrl
        self.simulationIds = simulationIds
        self.path = path
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.slackWebhookUrl = try container.decodeIfPresent(String.self, forKey: .slackWebhookUrl)
        self.simulationIds = try container.decodeIfPresent([String].self, forKey: .simulationIds)
        self.path = try container.decodeNullableIfPresent(String.self, forKey: .path)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.slackWebhookUrl, forKey: .slackWebhookUrl)
        try container.encodeIfPresent(self.simulationIds, forKey: .simulationIds)
        try container.encodeNullableIfPresent(self.path, forKey: .path)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case slackWebhookUrl
        case simulationIds
        case path
    }
}
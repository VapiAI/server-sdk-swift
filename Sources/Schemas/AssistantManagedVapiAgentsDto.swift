import Foundation

public struct AssistantManagedVapiAgentsDto: Codable, Hashable, Sendable {
    /// The Vapi Agents agent that manages the assistant.
    public let agentId: String
    /// The agent's page in Vapi Agents.
    public let agentUrl: String
    /// The Vapi Agents MCP server, where an AI client makes the change instead.
    public let mcpUrl: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        agentId: String,
        agentUrl: String,
        mcpUrl: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.agentId = agentId
        self.agentUrl = agentUrl
        self.mcpUrl = mcpUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.agentId = try container.decode(String.self, forKey: .agentId)
        self.agentUrl = try container.decode(String.self, forKey: .agentUrl)
        self.mcpUrl = try container.decode(String.self, forKey: .mcpUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.agentId, forKey: .agentId)
        try container.encode(self.agentUrl, forKey: .agentUrl)
        try container.encode(self.mcpUrl, forKey: .mcpUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case agentId
        case agentUrl
        case mcpUrl
    }
}
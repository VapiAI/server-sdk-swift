import Foundation

public struct OpenAiReasonerSkill: Codable, Hashable, Sendable {
    /// Unique name within this assistant.
    public let name: String
    /// Explain when the reasoner should load this skill. Always visible in its catalog.
    public let description: String
    /// Full skill instructions, loaded only while this skill is active.
    public let content: String
    /// Tools available only after loading this skill. Can be combined with toolIds.
    public let tools: [OpenAiReasonerSkillToolsItem]?
    /// Existing organization-owned tools available only after loading this skill.
    public let toolIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        description: String,
        content: String,
        tools: [OpenAiReasonerSkillToolsItem]? = nil,
        toolIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.description = description
        self.content = content
        self.tools = tools
        self.toolIds = toolIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.content = try container.decode(String.self, forKey: .content)
        self.tools = try container.decodeIfPresent([OpenAiReasonerSkillToolsItem].self, forKey: .tools)
        self.toolIds = try container.decodeIfPresent([String].self, forKey: .toolIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.content, forKey: .content)
        try container.encodeIfPresent(self.tools, forKey: .tools)
        try container.encodeIfPresent(self.toolIds, forKey: .toolIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case description
        case content
        case tools
        case toolIds
    }
}
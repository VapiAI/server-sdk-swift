import Foundation

public struct Eval: Codable, Hashable, Sendable {
    /// This is the mock conversation that will be used to evaluate the flow of the conversation.
    /// 
    /// Mock Messages are used to simulate the flow of the conversation
    /// 
    /// Evaluation Messages are used as checkpoints in the flow where the model's response to previous conversation needs to be evaluated to check the content and tool calls
    public let messages: [EvalMessagesItem]
    public let id: String
    public let orgId: String
    public let createdAt: Date
    public let updatedAt: Date
    /// This is the name of the eval.
    /// It helps identify what the eval is checking for.
    public let name: String?
    /// This is the description of the eval.
    /// This helps describe the eval and its purpose in detail. It will not be used to evaluate the flow of the conversation.
    public let description: String?
    /// This is the type of the eval.
    /// Currently it is fixed to `chat.mockConversation`.
    public let type: ChatMockConversation
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messages: [EvalMessagesItem],
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String? = nil,
        description: String? = nil,
        type: ChatMockConversation,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.description = description
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decode([EvalMessagesItem].self, forKey: .messages)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.type = try container.decode(ChatMockConversation.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.messages, forKey: .messages)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.type, forKey: .type)
    }

    public enum ChatMockConversation: String, Codable, Hashable, CaseIterable, Sendable {
        case chatMockConversation = "chat.mockConversation"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case description
        case type
    }
}
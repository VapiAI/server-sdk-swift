import Foundation

public struct ServerMessageConversationUpdate: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ServerMessageConversationUpdatePhoneNumber?
    /// This is the type of the message. "conversation-update" is sent when an update is committed to the conversation history.
    public let type: ConversationUpdate
    /// This is the most up-to-date conversation history at the time the message is sent.
    public let messages: [ServerMessageConversationUpdateMessagesItem]?
    /// This is the most up-to-date conversation history at the time the message is sent, formatted for OpenAI.
    public let messagesOpenAiFormatted: [OpenAiMessage]
    /// This is the timestamp of the message.
    public let timestamp: Double?
    /// This is a live version of the `call.artifact`.
    /// 
    /// This matches what is stored on `call.artifact` after the call.
    public let artifact: Artifact?
    /// This is the assistant that the message is associated with.
    public let assistant: CreateAssistantDto?
    /// This is the customer that the message is associated with.
    public let customer: CreateCustomerDto?
    /// This is the call that the message is associated with.
    public let call: Call?
    /// This is the chat object.
    public let chat: Chat?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumber: ServerMessageConversationUpdatePhoneNumber? = nil,
        type: ConversationUpdate,
        messages: [ServerMessageConversationUpdateMessagesItem]? = nil,
        messagesOpenAiFormatted: [OpenAiMessage],
        timestamp: Double? = nil,
        artifact: Artifact? = nil,
        assistant: CreateAssistantDto? = nil,
        customer: CreateCustomerDto? = nil,
        call: Call? = nil,
        chat: Chat? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.type = type
        self.messages = messages
        self.messagesOpenAiFormatted = messagesOpenAiFormatted
        self.timestamp = timestamp
        self.artifact = artifact
        self.assistant = assistant
        self.customer = customer
        self.call = call
        self.chat = chat
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumber = try container.decodeIfPresent(ServerMessageConversationUpdatePhoneNumber.self, forKey: .phoneNumber)
        self.type = try container.decode(ConversationUpdate.self, forKey: .type)
        self.messages = try container.decodeIfPresent([ServerMessageConversationUpdateMessagesItem].self, forKey: .messages)
        self.messagesOpenAiFormatted = try container.decode([OpenAiMessage].self, forKey: .messagesOpenAiFormatted)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.artifact = try container.decodeIfPresent(Artifact.self, forKey: .artifact)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.call = try container.decodeIfPresent(Call.self, forKey: .call)
        self.chat = try container.decodeIfPresent(Chat.self, forKey: .chat)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encode(self.messagesOpenAiFormatted, forKey: .messagesOpenAiFormatted)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.artifact, forKey: .artifact)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.chat, forKey: .chat)
    }

    public enum ConversationUpdate: String, Codable, Hashable, CaseIterable, Sendable {
        case conversationUpdate = "conversation-update"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumber
        case type
        case messages
        case messagesOpenAiFormatted = "messagesOpenAIFormatted"
        case timestamp
        case artifact
        case assistant
        case customer
        case call
        case chat
    }
}
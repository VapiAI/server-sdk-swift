import Foundation

public struct ClientMessageConversationUpdate: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ClientMessageConversationUpdatePhoneNumber?
    /// This is the version label (e.g. `v3`) of the assistant the call was
    /// configured with. `null` for inline assistants, squad/workflow calls,
    /// pre-resolution assistant-request messages, and orgs not on
    /// assistant versioning.
    public let assistantVersion: Nullable<String>?
    /// This is the type of the message. "conversation-update" is sent when an update is committed to the conversation history.
    public let type: ClientMessageConversationUpdateType
    /// This is the most up-to-date conversation history at the time the message is sent.
    public let messages: [ClientMessageConversationUpdateMessagesItem]?
    /// This is the most up-to-date conversation history at the time the message is sent, formatted for OpenAI.
    public let messagesOpenAiFormatted: [OpenAiMessage]
    /// This is the timestamp of the message.
    public let timestamp: Double?
    /// This is the call that the message is associated with.
    public let call: Call?
    /// This is the customer that the message is associated with.
    public let customer: CreateCustomerDto?
    /// This is the assistant that the message is associated with.
    public let assistant: CreateAssistantDto?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumber: ClientMessageConversationUpdatePhoneNumber? = nil,
        assistantVersion: Nullable<String>? = nil,
        type: ClientMessageConversationUpdateType,
        messages: [ClientMessageConversationUpdateMessagesItem]? = nil,
        messagesOpenAiFormatted: [OpenAiMessage],
        timestamp: Double? = nil,
        call: Call? = nil,
        customer: CreateCustomerDto? = nil,
        assistant: CreateAssistantDto? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.assistantVersion = assistantVersion
        self.type = type
        self.messages = messages
        self.messagesOpenAiFormatted = messagesOpenAiFormatted
        self.timestamp = timestamp
        self.call = call
        self.customer = customer
        self.assistant = assistant
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumber = try container.decodeIfPresent(ClientMessageConversationUpdatePhoneNumber.self, forKey: .phoneNumber)
        self.assistantVersion = try container.decodeNullableIfPresent(String.self, forKey: .assistantVersion)
        self.type = try container.decode(ClientMessageConversationUpdateType.self, forKey: .type)
        self.messages = try container.decodeIfPresent([ClientMessageConversationUpdateMessagesItem].self, forKey: .messages)
        self.messagesOpenAiFormatted = try container.decode([OpenAiMessage].self, forKey: .messagesOpenAiFormatted)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.call = try container.decodeIfPresent(Call.self, forKey: .call)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encodeNullableIfPresent(self.assistantVersion, forKey: .assistantVersion)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encode(self.messagesOpenAiFormatted, forKey: .messagesOpenAiFormatted)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumber
        case assistantVersion
        case type
        case messages
        case messagesOpenAiFormatted = "messagesOpenAIFormatted"
        case timestamp
        case call
        case customer
        case assistant
    }
}
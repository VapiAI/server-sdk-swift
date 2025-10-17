import Foundation

public struct OpenAiWebChatRequest: Codable, Hashable, Sendable {
    /// The assistant ID to use for this chat
    public let assistantId: String
    /// This is the ID of the session that will be used for the chat.
    /// If provided, the conversation will continue from the previous state.
    /// If not provided or expired, a new session will be created.
    public let sessionId: String?
    /// These are the variable values that will be used to replace template variables in the assistant messages.
    /// Only variable substitution is supported in web chat - other assistant properties cannot be overridden.
    public let assistantOverrides: ChatAssistantOverrides?
    /// This is the customer information for the chat.
    /// Used to automatically manage sessions for repeat customers.
    public let customer: CreateWebCustomerDto?
    /// This is the input text for the chat.
    /// Can be a string or an array of chat messages.
    public let input: OpenAiWebChatRequestInput
    /// Whether to stream the response or not.
    public let stream: Bool?
    /// This is a flag to indicate end of session. When true, the session will be marked as completed and the chat will be ended.
    /// Used to end session to send End-of-session report to the customer.
    /// When flag is set to true, any messages sent will not be processed and session will directly be marked as completed.
    public let sessionEnd: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantId: String,
        sessionId: String? = nil,
        assistantOverrides: ChatAssistantOverrides? = nil,
        customer: CreateWebCustomerDto? = nil,
        input: OpenAiWebChatRequestInput,
        stream: Bool? = nil,
        sessionEnd: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantId = assistantId
        self.sessionId = sessionId
        self.assistantOverrides = assistantOverrides
        self.customer = customer
        self.input = input
        self.stream = stream
        self.sessionEnd = sessionEnd
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantId = try container.decode(String.self, forKey: .assistantId)
        self.sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        self.assistantOverrides = try container.decodeIfPresent(ChatAssistantOverrides.self, forKey: .assistantOverrides)
        self.customer = try container.decodeIfPresent(CreateWebCustomerDto.self, forKey: .customer)
        self.input = try container.decode(OpenAiWebChatRequestInput.self, forKey: .input)
        self.stream = try container.decodeIfPresent(Bool.self, forKey: .stream)
        self.sessionEnd = try container.decodeIfPresent(Bool.self, forKey: .sessionEnd)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.sessionId, forKey: .sessionId)
        try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encode(self.input, forKey: .input)
        try container.encodeIfPresent(self.stream, forKey: .stream)
        try container.encodeIfPresent(self.sessionEnd, forKey: .sessionEnd)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantId
        case sessionId
        case assistantOverrides
        case customer
        case input
        case stream
        case sessionEnd
    }
}
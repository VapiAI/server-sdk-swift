import Foundation

public struct ClientMessageToolCalls: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ClientMessageToolCallsPhoneNumber?
    /// This is the type of the message. "tool-calls" is sent to call a tool.
    public let type: ToolCalls?
    /// This is the list of tools calls that the model is requesting along with the original tool configuration.
    public let toolWithToolCallList: [ClientMessageToolCallsToolWithToolCallListItem]
    /// This is the timestamp of the message.
    public let timestamp: Double?
    /// This is the call that the message is associated with.
    public let call: Call?
    /// This is the customer that the message is associated with.
    public let customer: CreateCustomerDto?
    /// This is the assistant that the message is associated with.
    public let assistant: CreateAssistantDto?
    /// This is the list of tool calls that the model is requesting.
    public let toolCallList: [ToolCall]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumber: ClientMessageToolCallsPhoneNumber? = nil,
        type: ToolCalls? = nil,
        toolWithToolCallList: [ClientMessageToolCallsToolWithToolCallListItem],
        timestamp: Double? = nil,
        call: Call? = nil,
        customer: CreateCustomerDto? = nil,
        assistant: CreateAssistantDto? = nil,
        toolCallList: [ToolCall],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.type = type
        self.toolWithToolCallList = toolWithToolCallList
        self.timestamp = timestamp
        self.call = call
        self.customer = customer
        self.assistant = assistant
        self.toolCallList = toolCallList
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumber = try container.decodeIfPresent(ClientMessageToolCallsPhoneNumber.self, forKey: .phoneNumber)
        self.type = try container.decodeIfPresent(ToolCalls.self, forKey: .type)
        self.toolWithToolCallList = try container.decode([ClientMessageToolCallsToolWithToolCallListItem].self, forKey: .toolWithToolCallList)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.call = try container.decodeIfPresent(Call.self, forKey: .call)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.toolCallList = try container.decode([ToolCall].self, forKey: .toolCallList)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encode(self.toolWithToolCallList, forKey: .toolWithToolCallList)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encode(self.toolCallList, forKey: .toolCallList)
    }

    public enum ToolCalls: String, Codable, Hashable, CaseIterable, Sendable {
        case toolCalls = "tool-calls"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumber
        case type
        case toolWithToolCallList
        case timestamp
        case call
        case customer
        case assistant
        case toolCallList
    }
}
import Foundation

public struct ClientMessageWorkflowNodeStarted: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ClientMessageWorkflowNodeStartedPhoneNumber?
    /// This is the type of the message. "workflow.node.started" is sent when the active node changes.
    public let type: WorkflowNodeStarted
    /// This is the timestamp of the message.
    public let timestamp: Double?
    /// This is the call that the message is associated with.
    public let call: Call?
    /// This is the customer that the message is associated with.
    public let customer: CreateCustomerDto?
    /// This is the assistant that the message is associated with.
    public let assistant: CreateAssistantDto?
    /// This is the active node.
    public let node: [String: JSONValue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumber: ClientMessageWorkflowNodeStartedPhoneNumber? = nil,
        type: WorkflowNodeStarted,
        timestamp: Double? = nil,
        call: Call? = nil,
        customer: CreateCustomerDto? = nil,
        assistant: CreateAssistantDto? = nil,
        node: [String: JSONValue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.type = type
        self.timestamp = timestamp
        self.call = call
        self.customer = customer
        self.assistant = assistant
        self.node = node
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumber = try container.decodeIfPresent(ClientMessageWorkflowNodeStartedPhoneNumber.self, forKey: .phoneNumber)
        self.type = try container.decode(WorkflowNodeStarted.self, forKey: .type)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.call = try container.decodeIfPresent(Call.self, forKey: .call)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.node = try container.decode([String: JSONValue].self, forKey: .node)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encode(self.node, forKey: .node)
    }

    public enum WorkflowNodeStarted: String, Codable, Hashable, CaseIterable, Sendable {
        case workflowNodeStarted = "workflow.node.started"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumber
        case type
        case timestamp
        case call
        case customer
        case assistant
        case node
    }
}
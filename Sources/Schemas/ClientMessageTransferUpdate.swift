import Foundation

public struct ClientMessageTransferUpdate: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ClientMessageTransferUpdatePhoneNumber?
    /// This is the type of the message. "transfer-update" is sent whenever a transfer happens.
    public let type: TransferUpdate
    /// This is the destination of the transfer.
    public let destination: ClientMessageTransferUpdateDestination?
    /// This is the timestamp of the message.
    public let timestamp: Double?
    /// This is the call that the message is associated with.
    public let call: Call?
    /// This is the customer that the message is associated with.
    public let customer: CreateCustomerDto?
    /// This is the assistant that the message is associated with.
    public let assistant: CreateAssistantDto?
    /// This is the assistant that the call is being transferred to. This is only sent if `destination.type` is "assistant".
    public let toAssistant: CreateAssistantDto?
    /// This is the assistant that the call is being transferred from. This is only sent if `destination.type` is "assistant".
    public let fromAssistant: CreateAssistantDto?
    /// This is the step that the conversation moved to.
    public let toStepRecord: [String: JSONValue]?
    /// This is the step that the conversation moved from. =
    public let fromStepRecord: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumber: ClientMessageTransferUpdatePhoneNumber? = nil,
        type: TransferUpdate,
        destination: ClientMessageTransferUpdateDestination? = nil,
        timestamp: Double? = nil,
        call: Call? = nil,
        customer: CreateCustomerDto? = nil,
        assistant: CreateAssistantDto? = nil,
        toAssistant: CreateAssistantDto? = nil,
        fromAssistant: CreateAssistantDto? = nil,
        toStepRecord: [String: JSONValue]? = nil,
        fromStepRecord: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.type = type
        self.destination = destination
        self.timestamp = timestamp
        self.call = call
        self.customer = customer
        self.assistant = assistant
        self.toAssistant = toAssistant
        self.fromAssistant = fromAssistant
        self.toStepRecord = toStepRecord
        self.fromStepRecord = fromStepRecord
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumber = try container.decodeIfPresent(ClientMessageTransferUpdatePhoneNumber.self, forKey: .phoneNumber)
        self.type = try container.decode(TransferUpdate.self, forKey: .type)
        self.destination = try container.decodeIfPresent(ClientMessageTransferUpdateDestination.self, forKey: .destination)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.call = try container.decodeIfPresent(Call.self, forKey: .call)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.toAssistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .toAssistant)
        self.fromAssistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .fromAssistant)
        self.toStepRecord = try container.decodeIfPresent([String: JSONValue].self, forKey: .toStepRecord)
        self.fromStepRecord = try container.decodeIfPresent([String: JSONValue].self, forKey: .fromStepRecord)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.toAssistant, forKey: .toAssistant)
        try container.encodeIfPresent(self.fromAssistant, forKey: .fromAssistant)
        try container.encodeIfPresent(self.toStepRecord, forKey: .toStepRecord)
        try container.encodeIfPresent(self.fromStepRecord, forKey: .fromStepRecord)
    }

    public enum TransferUpdate: String, Codable, Hashable, CaseIterable, Sendable {
        case transferUpdate = "transfer-update"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumber
        case type
        case destination
        case timestamp
        case call
        case customer
        case assistant
        case toAssistant
        case fromAssistant
        case toStepRecord
        case fromStepRecord
    }
}
import Foundation

public struct ClientMessageSpeechUpdate: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ClientMessageSpeechUpdatePhoneNumber?
    /// This is the type of the message. "speech-update" is sent whenever assistant or user start or stop speaking.
    public let type: SpeechUpdate
    /// This is the status of the speech update.
    public let status: ClientMessageSpeechUpdateStatus
    /// This is the role which the speech update is for.
    public let role: ClientMessageSpeechUpdateRole
    /// This is the turn number of the speech update (0-indexed).
    public let turn: Double?
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
        phoneNumber: ClientMessageSpeechUpdatePhoneNumber? = nil,
        type: SpeechUpdate,
        status: ClientMessageSpeechUpdateStatus,
        role: ClientMessageSpeechUpdateRole,
        turn: Double? = nil,
        timestamp: Double? = nil,
        call: Call? = nil,
        customer: CreateCustomerDto? = nil,
        assistant: CreateAssistantDto? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.type = type
        self.status = status
        self.role = role
        self.turn = turn
        self.timestamp = timestamp
        self.call = call
        self.customer = customer
        self.assistant = assistant
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumber = try container.decodeIfPresent(ClientMessageSpeechUpdatePhoneNumber.self, forKey: .phoneNumber)
        self.type = try container.decode(SpeechUpdate.self, forKey: .type)
        self.status = try container.decode(ClientMessageSpeechUpdateStatus.self, forKey: .status)
        self.role = try container.decode(ClientMessageSpeechUpdateRole.self, forKey: .role)
        self.turn = try container.decodeIfPresent(Double.self, forKey: .turn)
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
        try container.encode(self.type, forKey: .type)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.role, forKey: .role)
        try container.encodeIfPresent(self.turn, forKey: .turn)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
    }

    public enum SpeechUpdate: String, Codable, Hashable, CaseIterable, Sendable {
        case speechUpdate = "speech-update"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumber
        case type
        case status
        case role
        case turn
        case timestamp
        case call
        case customer
        case assistant
    }
}
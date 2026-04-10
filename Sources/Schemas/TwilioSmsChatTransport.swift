import Foundation

public struct TwilioSmsChatTransport: Codable, Hashable, Sendable {
    /// This is the conversation type of the call (ie, voice or chat).
    public let conversationType: TwilioSmsChatTransportConversationType?
    /// This is the phone number that will be used to send the SMS.
    /// If provided, will create a new session. If not provided, uses existing session's phoneNumberId.
    /// The phone number must have SMS enabled and belong to your organization.
    public let phoneNumberId: String?
    /// This is the customer who will receive the SMS.
    /// If provided, will create a new session. If not provided, uses existing session's customer.
    public let customer: CreateCustomerDto?
    /// This is the customerId of the customer who will receive the SMS.
    public let customerId: String?
    /// Whether to use LLM-generated messages for outbound SMS.
    /// When true (default), input is processed by the assistant for a response.
    /// When false, the input text is forwarded directly as the SMS message without LLM processing.
    /// Useful for sending pre-defined messages or notifications.
    public let useLlmGeneratedMessageForOutbound: Bool?
    /// The type of transport to use for sending the chat response.
    /// Currently supports 'twilio.sms' for SMS delivery via Twilio.
    public let type: TwilioSmsChatTransportType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conversationType: TwilioSmsChatTransportConversationType? = nil,
        phoneNumberId: String? = nil,
        customer: CreateCustomerDto? = nil,
        customerId: String? = nil,
        useLlmGeneratedMessageForOutbound: Bool? = nil,
        type: TwilioSmsChatTransportType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conversationType = conversationType
        self.phoneNumberId = phoneNumberId
        self.customer = customer
        self.customerId = customerId
        self.useLlmGeneratedMessageForOutbound = useLlmGeneratedMessageForOutbound
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conversationType = try container.decodeIfPresent(TwilioSmsChatTransportConversationType.self, forKey: .conversationType)
        self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.customerId = try container.decodeIfPresent(String.self, forKey: .customerId)
        self.useLlmGeneratedMessageForOutbound = try container.decodeIfPresent(Bool.self, forKey: .useLlmGeneratedMessageForOutbound)
        self.type = try container.decode(TwilioSmsChatTransportType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.conversationType, forKey: .conversationType)
        try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.customerId, forKey: .customerId)
        try container.encodeIfPresent(self.useLlmGeneratedMessageForOutbound, forKey: .useLlmGeneratedMessageForOutbound)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conversationType
        case phoneNumberId
        case customer
        case customerId
        case useLlmGeneratedMessageForOutbound = "useLLMGeneratedMessageForOutbound"
        case type
    }
}
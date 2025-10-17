import Foundation

public struct TwilioSmsChatTransport: Codable, Hashable, Sendable {
    /// This is the phone number that will be used to send the SMS.
    /// If provided, will create a new session. If not provided, uses existing session's phoneNumberId.
    /// The phone number must have SMS enabled and belong to your organization.
    public let phoneNumberId: String?
    /// This is the customer who will receive the SMS.
    /// If provided, will create a new session. If not provided, uses existing session's customer.
    public let customer: CreateCustomerDto?
    /// Whether to use LLM-generated messages for outbound SMS.
    /// When true (default), input is processed by the assistant for a response.
    /// When false, the input text is forwarded directly as the SMS message without LLM processing.
    /// Useful for sending pre-defined messages or notifications.
    public let useLlmGeneratedMessageForOutbound: Bool?
    /// The type of transport to use for sending the chat response.
    /// Currently supports 'twilio.sms' for SMS delivery via Twilio.
    public let type: TwilioSms
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumberId: String? = nil,
        customer: CreateCustomerDto? = nil,
        useLlmGeneratedMessageForOutbound: Bool? = nil,
        type: TwilioSms,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumberId = phoneNumberId
        self.customer = customer
        self.useLlmGeneratedMessageForOutbound = useLlmGeneratedMessageForOutbound
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.useLlmGeneratedMessageForOutbound = try container.decodeIfPresent(Bool.self, forKey: .useLlmGeneratedMessageForOutbound)
        self.type = try container.decode(TwilioSms.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.useLlmGeneratedMessageForOutbound, forKey: .useLlmGeneratedMessageForOutbound)
        try container.encode(self.type, forKey: .type)
    }

    public enum TwilioSms: String, Codable, Hashable, CaseIterable, Sendable {
        case twilioSms = "twilio.sms"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumberId
        case customer
        case useLlmGeneratedMessageForOutbound = "useLLMGeneratedMessageForOutbound"
        case type
    }
}
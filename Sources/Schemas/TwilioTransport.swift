import Foundation

public struct TwilioTransport: Codable, Hashable, Sendable {
    /// This is the conversation type of the call (ie, voice or chat).
    public let conversationType: TwilioTransportConversationType?
    /// This is the account SID of the Twilio account.
    public let accountSid: String?
    /// This is the call SID of the Twilio call.
    public let callSid: String?
    /// This is the call token of the Twilio call.
    public let callToken: String?
    /// This is the phone number from which the call was forwarded.
    /// Undefined if the call was not forwarded.
    public let forwardedFrom: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conversationType: TwilioTransportConversationType? = nil,
        accountSid: String? = nil,
        callSid: String? = nil,
        callToken: String? = nil,
        forwardedFrom: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conversationType = conversationType
        self.accountSid = accountSid
        self.callSid = callSid
        self.callToken = callToken
        self.forwardedFrom = forwardedFrom
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conversationType = try container.decodeIfPresent(TwilioTransportConversationType.self, forKey: .conversationType)
        self.accountSid = try container.decodeIfPresent(String.self, forKey: .accountSid)
        self.callSid = try container.decodeIfPresent(String.self, forKey: .callSid)
        self.callToken = try container.decodeIfPresent(String.self, forKey: .callToken)
        self.forwardedFrom = try container.decodeIfPresent(String.self, forKey: .forwardedFrom)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.conversationType, forKey: .conversationType)
        try container.encodeIfPresent(self.accountSid, forKey: .accountSid)
        try container.encodeIfPresent(self.callSid, forKey: .callSid)
        try container.encodeIfPresent(self.callToken, forKey: .callToken)
        try container.encodeIfPresent(self.forwardedFrom, forKey: .forwardedFrom)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conversationType
        case accountSid
        case callSid
        case callToken
        case forwardedFrom
    }
}
import Foundation

public struct VapiSipTransport: Codable, Hashable, Sendable {
    /// This is the conversation type of the call (ie, voice or chat).
    public let conversationType: VapiSipTransportConversationType?
    /// This sets the timeout for outbound dial operations in seconds. This is the duration the call will ring before timing out.
    /// 
    /// @default 60
    public let dialTimeout: Double?
    /// This is the call SID of the Vapi SIP call.
    public let sbcCallSid: String?
    /// This is the call ID of the Vapi SIP call.
    public let callSid: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conversationType: VapiSipTransportConversationType? = nil,
        dialTimeout: Double? = nil,
        sbcCallSid: String? = nil,
        callSid: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conversationType = conversationType
        self.dialTimeout = dialTimeout
        self.sbcCallSid = sbcCallSid
        self.callSid = callSid
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conversationType = try container.decodeIfPresent(VapiSipTransportConversationType.self, forKey: .conversationType)
        self.dialTimeout = try container.decodeIfPresent(Double.self, forKey: .dialTimeout)
        self.sbcCallSid = try container.decodeIfPresent(String.self, forKey: .sbcCallSid)
        self.callSid = try container.decodeIfPresent(String.self, forKey: .callSid)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.conversationType, forKey: .conversationType)
        try container.encodeIfPresent(self.dialTimeout, forKey: .dialTimeout)
        try container.encodeIfPresent(self.sbcCallSid, forKey: .sbcCallSid)
        try container.encodeIfPresent(self.callSid, forKey: .callSid)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conversationType
        case dialTimeout
        case sbcCallSid
        case callSid
    }
}
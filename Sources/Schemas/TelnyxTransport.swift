import Foundation

public struct TelnyxTransport: Codable, Hashable, Sendable {
    /// This is the conversation type of the call (ie, voice or chat).
    public let conversationType: TelnyxTransportConversationType?
    /// This is the call control ID of the Telnyx call.
    public let callControlId: String?
    /// This is the call leg ID of the Telnyx call.
    public let callLegId: String?
    /// This is the call session ID of the Telnyx call.
    public let callSessionId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conversationType: TelnyxTransportConversationType? = nil,
        callControlId: String? = nil,
        callLegId: String? = nil,
        callSessionId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conversationType = conversationType
        self.callControlId = callControlId
        self.callLegId = callLegId
        self.callSessionId = callSessionId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conversationType = try container.decodeIfPresent(TelnyxTransportConversationType.self, forKey: .conversationType)
        self.callControlId = try container.decodeIfPresent(String.self, forKey: .callControlId)
        self.callLegId = try container.decodeIfPresent(String.self, forKey: .callLegId)
        self.callSessionId = try container.decodeIfPresent(String.self, forKey: .callSessionId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.conversationType, forKey: .conversationType)
        try container.encodeIfPresent(self.callControlId, forKey: .callControlId)
        try container.encodeIfPresent(self.callLegId, forKey: .callLegId)
        try container.encodeIfPresent(self.callSessionId, forKey: .callSessionId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conversationType
        case callControlId
        case callLegId
        case callSessionId
    }
}
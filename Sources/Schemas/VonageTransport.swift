import Foundation

public struct VonageTransport: Codable, Hashable, Sendable {
    /// This is the conversation type of the call (ie, voice or chat).
    public let conversationType: VonageTransportConversationType?
    /// This is the conversation UUID of the Vonage call.
    public let conversationUuid: String?
    /// This is the call ID of the Vonage call.
    public let callUuid: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conversationType: VonageTransportConversationType? = nil,
        conversationUuid: String? = nil,
        callUuid: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conversationType = conversationType
        self.conversationUuid = conversationUuid
        self.callUuid = callUuid
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conversationType = try container.decodeIfPresent(VonageTransportConversationType.self, forKey: .conversationType)
        self.conversationUuid = try container.decodeIfPresent(String.self, forKey: .conversationUuid)
        self.callUuid = try container.decodeIfPresent(String.self, forKey: .callUuid)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.conversationType, forKey: .conversationType)
        try container.encodeIfPresent(self.conversationUuid, forKey: .conversationUuid)
        try container.encodeIfPresent(self.callUuid, forKey: .callUuid)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conversationType
        case conversationUuid = "conversationUUID"
        case callUuid = "callUUID"
    }
}
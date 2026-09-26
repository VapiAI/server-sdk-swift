import Foundation

public struct VapiWebCallTransport: Codable, Hashable, Sendable {
    /// This is the conversation type of the call (ie, voice or chat).
    public let conversationType: VapiWebCallTransportConversationType?
    /// This determines whether the daily room will be deleted and all participants will be kicked once the user leaves the room.
    /// If set to `false`, the room will be kept alive even after the user leaves, allowing clients to reconnect to the same room.
    /// If set to `true`, the room will be deleted and reconnection will not be allowed.
    /// 
    /// Defaults to `true`.
    public let roomDeleteOnUserLeaveEnabled: Bool?
    /// This is the meeting token the web client should join the call with.
    /// When video recording is enabled, joining with this token starts the cloud
    /// recording automatically server-side, which is more reliable than the
    /// client starting it after joining. Set by the server; only present when
    /// video recording is enabled.
    public let callToken: String?
    /// This is the URL of the web call.
    public let callUrl: String?
    /// This is the SIP URI of the web call.
    public let callSipUri: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conversationType: VapiWebCallTransportConversationType? = nil,
        roomDeleteOnUserLeaveEnabled: Bool? = nil,
        callToken: String? = nil,
        callUrl: String? = nil,
        callSipUri: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conversationType = conversationType
        self.roomDeleteOnUserLeaveEnabled = roomDeleteOnUserLeaveEnabled
        self.callToken = callToken
        self.callUrl = callUrl
        self.callSipUri = callSipUri
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conversationType = try container.decodeIfPresent(VapiWebCallTransportConversationType.self, forKey: .conversationType)
        self.roomDeleteOnUserLeaveEnabled = try container.decodeIfPresent(Bool.self, forKey: .roomDeleteOnUserLeaveEnabled)
        self.callToken = try container.decodeIfPresent(String.self, forKey: .callToken)
        self.callUrl = try container.decodeIfPresent(String.self, forKey: .callUrl)
        self.callSipUri = try container.decodeIfPresent(String.self, forKey: .callSipUri)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.conversationType, forKey: .conversationType)
        try container.encodeIfPresent(self.roomDeleteOnUserLeaveEnabled, forKey: .roomDeleteOnUserLeaveEnabled)
        try container.encodeIfPresent(self.callToken, forKey: .callToken)
        try container.encodeIfPresent(self.callUrl, forKey: .callUrl)
        try container.encodeIfPresent(self.callSipUri, forKey: .callSipUri)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conversationType
        case roomDeleteOnUserLeaveEnabled
        case callToken
        case callUrl
        case callSipUri
    }
}
import Foundation

public struct RelayResponse: Codable, Hashable, Sendable {
    /// The status of the relay request
    public let status: RelayResponseStatus
    /// The unique identifier of the call, if delivered to a live call
    public let callId: String?
    /// The unique identifier of the session, if delivered to a headless session
    public let sessionId: String?
    public let chatId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: RelayResponseStatus,
        callId: String? = nil,
        sessionId: String? = nil,
        chatId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.callId = callId
        self.sessionId = sessionId
        self.chatId = chatId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(RelayResponseStatus.self, forKey: .status)
        self.callId = try container.decodeIfPresent(String.self, forKey: .callId)
        self.sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
        self.chatId = try container.decodeIfPresent(String.self, forKey: .chatId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.callId, forKey: .callId)
        try container.encodeIfPresent(self.sessionId, forKey: .sessionId)
        try container.encodeIfPresent(self.chatId, forKey: .chatId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case callId
        case sessionId
        case chatId
    }
}
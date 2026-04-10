import Foundation

public struct ClientInboundMessageSendTransportMessage: Codable, Hashable, Sendable {
    /// This is the transport-specific message to send.
    public let message: ClientInboundMessageSendTransportMessageMessage
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        message: ClientInboundMessageSendTransportMessageMessage,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(ClientInboundMessageSendTransportMessageMessage.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case message
    }
}
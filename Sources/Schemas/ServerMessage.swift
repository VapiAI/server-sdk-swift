import Foundation

public struct ServerMessage: Codable, Hashable, Sendable {
    /// These are all the messages that can be sent to your server before, after and during the call. Configure the messages you'd like to receive in `assistant.serverMessages`.
    /// 
    /// The server where the message is sent is determined by the following precedence order:
    /// 
    /// 1. `tool.server.url` (if configured, and only for "tool-calls" message)
    /// 2. `assistant.serverUrl` (if configure)
    /// 3. `phoneNumber.serverUrl` (if configured)
    /// 4. `org.serverUrl` (if configured)
    public let message: ServerMessageMessage
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        message: ServerMessageMessage,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(ServerMessageMessage.self, forKey: .message)
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
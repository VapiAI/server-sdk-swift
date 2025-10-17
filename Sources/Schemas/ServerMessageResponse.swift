import Foundation

public struct ServerMessageResponse: Codable, Hashable, Sendable {
    /// This is the response that is expected from the server to the message.
    /// 
    /// Note: Most messages don't expect a response. Only "assistant-request", "tool-calls" and "transfer-destination-request" do.
    public let messageResponse: ServerMessageResponseMessageResponse
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messageResponse: ServerMessageResponseMessageResponse,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messageResponse = messageResponse
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messageResponse = try container.decode(ServerMessageResponseMessageResponse.self, forKey: .messageResponse)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.messageResponse, forKey: .messageResponse)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messageResponse
    }
}
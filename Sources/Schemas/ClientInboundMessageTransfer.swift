import Foundation

public struct ClientInboundMessageTransfer: Codable, Hashable, Sendable {
    /// This is the destination to transfer the call to.
    public let destination: ClientInboundMessageTransferDestination?
    /// This is the content to say.
    public let content: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        destination: ClientInboundMessageTransferDestination? = nil,
        content: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.destination = destination
        self.content = content
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.destination = try container.decodeIfPresent(ClientInboundMessageTransferDestination.self, forKey: .destination)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.content, forKey: .content)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case destination
        case content
    }
}
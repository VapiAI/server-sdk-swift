import Foundation

public struct ServerMessageResponseTransferDestinationRequest: Codable, Hashable, Sendable {
    /// This is the destination you'd like the call to be transferred to.
    public let destination: ServerMessageResponseTransferDestinationRequestDestination?
    /// This is the message that will be spoken to the user as the tool is running.
    public let message: ServerMessageResponseTransferDestinationRequestMessage?
    /// This is the error message if the transfer should not be made.
    public let error: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        destination: ServerMessageResponseTransferDestinationRequestDestination? = nil,
        message: ServerMessageResponseTransferDestinationRequestMessage? = nil,
        error: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.destination = destination
        self.message = message
        self.error = error
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.destination = try container.decodeIfPresent(ServerMessageResponseTransferDestinationRequestDestination.self, forKey: .destination)
        self.message = try container.decodeIfPresent(ServerMessageResponseTransferDestinationRequestMessage.self, forKey: .message)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.message, forKey: .message)
        try container.encodeIfPresent(self.error, forKey: .error)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case destination
        case message
        case error
    }
}
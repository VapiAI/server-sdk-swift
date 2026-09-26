import Foundation

public struct TransferArtifact: Codable, Hashable, Sendable {
    /// The transfer destination (phone number or SIP URI).
    public let destination: TransferArtifactDestination
    /// The transfer mode (e.g. warm-transfer-experimental, blind-transfer).
    public let mode: TransferArtifactMode?
    /// Flat-text transcript / announcement preview of the transfer.
    public let transcript: String?
    /// The terminal status of the transfer, rendered as the status line.
    public let status: TransferArtifactStatus?
    /// The agent↔operator conversation captured during a
    /// warm-transfer-experimental, rendered as bubbles.
    public let messages: [TransferArtifactMessagesItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        destination: TransferArtifactDestination,
        mode: TransferArtifactMode? = nil,
        transcript: String? = nil,
        status: TransferArtifactStatus? = nil,
        messages: [TransferArtifactMessagesItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.destination = destination
        self.mode = mode
        self.transcript = transcript
        self.status = status
        self.messages = messages
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.destination = try container.decode(TransferArtifactDestination.self, forKey: .destination)
        self.mode = try container.decodeIfPresent(TransferArtifactMode.self, forKey: .mode)
        self.transcript = try container.decodeIfPresent(String.self, forKey: .transcript)
        self.status = try container.decodeIfPresent(TransferArtifactStatus.self, forKey: .status)
        self.messages = try container.decodeIfPresent([TransferArtifactMessagesItem].self, forKey: .messages)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.transcript, forKey: .transcript)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.messages, forKey: .messages)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case destination
        case mode
        case transcript
        case status
        case messages
    }
}
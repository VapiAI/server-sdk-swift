import Foundation

public struct TransferHookAction: Codable, Hashable, Sendable {
    /// This is the type of action - must be "transfer"
    public let type: Transfer
    /// This is the destination details for the transfer - can be a phone number or SIP URI
    public let destination: TransferHookActionDestination?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: Transfer,
        destination: TransferHookActionDestination? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.destination = destination
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(Transfer.self, forKey: .type)
        self.destination = try container.decodeIfPresent(TransferHookActionDestination.self, forKey: .destination)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.destination, forKey: .destination)
    }

    public enum Transfer: String, Codable, Hashable, CaseIterable, Sendable {
        case transfer
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case destination
    }
}
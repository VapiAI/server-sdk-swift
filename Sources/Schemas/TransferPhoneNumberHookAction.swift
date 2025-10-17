import Foundation

public struct TransferPhoneNumberHookAction: Codable, Hashable, Sendable {
    /// This is the destination details for the transfer - can be a phone number or SIP URI
    public let destination: TransferPhoneNumberHookActionDestination?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        destination: TransferPhoneNumberHookActionDestination? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.destination = destination
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.destination = try container.decodeIfPresent(TransferPhoneNumberHookActionDestination.self, forKey: .destination)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.destination, forKey: .destination)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case destination
    }
}
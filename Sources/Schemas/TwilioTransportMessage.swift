import Foundation

public struct TwilioTransportMessage: Codable, Hashable, Sendable {
    /// This is the TwiML to send to the Twilio call.
    public let twiml: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        twiml: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.twiml = twiml
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.twiml = try container.decode(String.self, forKey: .twiml)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.twiml, forKey: .twiml)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case twiml
    }
}
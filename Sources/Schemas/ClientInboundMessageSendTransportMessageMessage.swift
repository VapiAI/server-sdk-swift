import Foundation

/// This is the transport-specific message to send.
public enum ClientInboundMessageSendTransportMessageMessage: Codable, Hashable, Sendable {
    case twilio(TwilioTransportMessage)
    case vapiSip(VapiSipTransportMessage)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .transport)
        switch discriminant {
        case "twilio":
            self = .twilio(try TwilioTransportMessage(from: decoder))
        case "vapi.sip":
            self = .vapiSip(try VapiSipTransportMessage(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .twilio(let data):
            try container.encode("twilio", forKey: .transport)
            try data.encode(to: encoder)
        case .vapiSip(let data):
            try container.encode("vapi.sip", forKey: .transport)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case transport
    }
}
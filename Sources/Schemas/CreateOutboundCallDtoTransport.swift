import Foundation

/// This is the transport of the call.
public enum CreateOutboundCallDtoTransport: Codable, Hashable, Sendable {
    case daily(VapiWebCallTransport)
    case telnyx(TelnyxTransport)
    case twilio(TwilioTransport)
    case vapiSip(VapiSipTransport)
    case vapiWebsocket(VapiWebsocketTransport)
    case vonage(VonageTransport)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "daily":
            self = .daily(try VapiWebCallTransport(from: decoder))
        case "telnyx":
            self = .telnyx(try TelnyxTransport(from: decoder))
        case "twilio":
            self = .twilio(try TwilioTransport(from: decoder))
        case "vapi.sip":
            self = .vapiSip(try VapiSipTransport(from: decoder))
        case "vapi.websocket":
            self = .vapiWebsocket(try VapiWebsocketTransport(from: decoder))
        case "vonage":
            self = .vonage(try VonageTransport(from: decoder))
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
        case .daily(let data):
            try container.encode("daily", forKey: .provider)
            try data.encode(to: encoder)
        case .telnyx(let data):
            try container.encode("telnyx", forKey: .provider)
            try data.encode(to: encoder)
        case .twilio(let data):
            try container.encode("twilio", forKey: .provider)
            try data.encode(to: encoder)
        case .vapiSip(let data):
            try container.encode("vapi.sip", forKey: .provider)
            try data.encode(to: encoder)
        case .vapiWebsocket(let data):
            try container.encode("vapi.websocket", forKey: .provider)
            try data.encode(to: encoder)
        case .vonage(let data):
            try container.encode("vonage", forKey: .provider)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}
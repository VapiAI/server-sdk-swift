import Foundation

/// These are the messages that can be sent from client-side SDKs to control the call.
public enum ClientInboundMessageMessage: Codable, Hashable, Sendable {
    case addMessage(ClientInboundMessageAddMessage)
    case control(ClientInboundMessageControl)
    case endCall(ClientInboundMessageEndCall)
    case say(ClientInboundMessageSay)
    case sendTransportMessage(ClientInboundMessageSendTransportMessage)
    case transfer(ClientInboundMessageTransfer)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "add-message":
            self = .addMessage(try ClientInboundMessageAddMessage(from: decoder))
        case "control":
            self = .control(try ClientInboundMessageControl(from: decoder))
        case "end-call":
            self = .endCall(try ClientInboundMessageEndCall(from: decoder))
        case "say":
            self = .say(try ClientInboundMessageSay(from: decoder))
        case "send-transport-message":
            self = .sendTransportMessage(try ClientInboundMessageSendTransportMessage(from: decoder))
        case "transfer":
            self = .transfer(try ClientInboundMessageTransfer(from: decoder))
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
        case .addMessage(let data):
            try container.encode("add-message", forKey: .type)
            try data.encode(to: encoder)
        case .control(let data):
            try container.encode("control", forKey: .type)
            try data.encode(to: encoder)
        case .endCall(let data):
            try container.encode("end-call", forKey: .type)
            try data.encode(to: encoder)
        case .say(let data):
            try container.encode("say", forKey: .type)
            try data.encode(to: encoder)
        case .sendTransportMessage(let data):
            try container.encode("send-transport-message", forKey: .type)
            try data.encode(to: encoder)
        case .transfer(let data):
            try container.encode("transfer", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
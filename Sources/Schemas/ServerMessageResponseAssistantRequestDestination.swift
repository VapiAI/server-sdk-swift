import Foundation

/// This is the destination to transfer the inbound call to. This will immediately transfer without using any assistants.
/// 
/// If this is sent, `assistantId`, `assistant`, `squadId`, and `squad` are ignored.
public enum ServerMessageResponseAssistantRequestDestination: Codable, Hashable, Sendable {
    case number(TransferDestinationNumber)
    case sip(TransferDestinationSip)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "number":
            self = .number(try TransferDestinationNumber(from: decoder))
        case "sip":
            self = .sip(try TransferDestinationSip(from: decoder))
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
        case .number(let data):
            try container.encode("number", forKey: .type)
            try data.encode(to: encoder)
        case .sip(let data):
            try container.encode("sip", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
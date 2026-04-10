import Foundation

public enum RelayRequestCommandsItem: Codable, Hashable, Sendable {
    case messageAdd(RelayCommandNote)
    case say(RelayCommandSay)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "message.add":
            self = .messageAdd(try RelayCommandNote(from: decoder))
        case "say":
            self = .say(try RelayCommandSay(from: decoder))
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
        case .messageAdd(let data):
            try container.encode("message.add", forKey: .type)
            try data.encode(to: encoder)
        case .say(let data):
            try container.encode("say", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
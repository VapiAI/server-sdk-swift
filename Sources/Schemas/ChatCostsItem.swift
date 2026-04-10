import Foundation

public enum ChatCostsItem: Codable, Hashable, Sendable {
    case chat(ChatCost)
    case model(ModelCost)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "chat":
            self = .chat(try ChatCost(from: decoder))
        case "model":
            self = .model(try ModelCost(from: decoder))
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
        case .chat(let data):
            try container.encode("chat", forKey: .type)
            try data.encode(to: encoder)
        case .model(let data):
            try container.encode("model", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
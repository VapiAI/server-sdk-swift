import Foundation

public indirect enum CreateHandoffToolDtoDestinationsItem: Codable, Hashable, Sendable {
    case assistant(HandoffDestinationAssistant)
    case dynamic(HandoffDestinationDynamic)
    case squad(HandoffDestinationSquad)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "assistant":
            self = .assistant(try HandoffDestinationAssistant(from: decoder))
        case "dynamic":
            self = .dynamic(try HandoffDestinationDynamic(from: decoder))
        case "squad":
            self = .squad(try HandoffDestinationSquad(from: decoder))
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
        case .assistant(let data):
            try container.encode("assistant", forKey: .type)
            try data.encode(to: encoder)
        case .dynamic(let data):
            try container.encode("dynamic", forKey: .type)
            try data.encode(to: encoder)
        case .squad(let data):
            try container.encode("squad", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
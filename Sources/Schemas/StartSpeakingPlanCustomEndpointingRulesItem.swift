import Foundation

public enum StartSpeakingPlanCustomEndpointingRulesItem: Codable, Hashable, Sendable {
    case assistant(AssistantCustomEndpointingRule)
    case both(BothCustomEndpointingRule)
    case customer(CustomerCustomEndpointingRule)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "assistant":
            self = .assistant(try AssistantCustomEndpointingRule(from: decoder))
        case "both":
            self = .both(try BothCustomEndpointingRule(from: decoder))
        case "customer":
            self = .customer(try CustomerCustomEndpointingRule(from: decoder))
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
        case .both(let data):
            try container.encode("both", forKey: .type)
            try data.encode(to: encoder)
        case .customer(let data):
            try container.encode("customer", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
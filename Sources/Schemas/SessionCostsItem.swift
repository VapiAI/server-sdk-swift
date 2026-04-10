import Foundation

public enum SessionCostsItem: Codable, Hashable, Sendable {
    case analysis(AnalysisCost)
    case model(ModelCost)
    case session(SessionCost)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "analysis":
            self = .analysis(try AnalysisCost(from: decoder))
        case "model":
            self = .model(try ModelCost(from: decoder))
        case "session":
            self = .session(try SessionCost(from: decoder))
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
        case .analysis(let data):
            try container.encode("analysis", forKey: .type)
            try data.encode(to: encoder)
        case .model(let data):
            try container.encode("model", forKey: .type)
            try data.encode(to: encoder)
        case .session(let data):
            try container.encode("session", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
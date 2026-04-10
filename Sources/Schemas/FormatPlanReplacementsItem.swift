import Foundation

public enum FormatPlanReplacementsItem: Codable, Hashable, Sendable {
    case exact(ExactReplacement)
    case regex(RegexReplacement)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "exact":
            self = .exact(try ExactReplacement(from: decoder))
        case "regex":
            self = .regex(try RegexReplacement(from: decoder))
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
        case .exact(let data):
            try container.encode("exact", forKey: .type)
            try data.encode(to: encoder)
        case .regex(let data):
            try container.encode("regex", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
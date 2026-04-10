import Foundation

public indirect enum GroupConditionConditionsItem: Codable, Hashable, Sendable {
    /// This is the GroupCondition object but Swagger does not display nested schemas correctly.
    case group(GroupCondition)
    case liquid(LiquidCondition)
    case regex(RegexCondition)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "group":
            self = .group(try GroupCondition(from: decoder))
        case "liquid":
            self = .liquid(try LiquidCondition(from: decoder))
        case "regex":
            self = .regex(try RegexCondition(from: decoder))
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
        case .group(let data):
            try container.encode("group", forKey: .type)
            try data.encode(to: encoder)
        case .liquid(let data):
            try container.encode("liquid", forKey: .type)
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
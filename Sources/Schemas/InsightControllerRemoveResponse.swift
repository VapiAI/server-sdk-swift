import Foundation

public enum InsightControllerRemoveResponse: Codable, Hashable, Sendable {
    case bar(BarInsight)
    case line(LineInsight)
    case pie(PieInsight)
    case text(TextInsight)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "bar":
            self = .bar(try BarInsight(from: decoder))
        case "line":
            self = .line(try LineInsight(from: decoder))
        case "pie":
            self = .pie(try PieInsight(from: decoder))
        case "text":
            self = .text(try TextInsight(from: decoder))
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
        case .bar(let data):
            try container.encode("bar", forKey: .type)
            try data.encode(to: encoder)
        case .line(let data):
            try container.encode("line", forKey: .type)
            try data.encode(to: encoder)
        case .pie(let data):
            try container.encode("pie", forKey: .type)
            try data.encode(to: encoder)
        case .text(let data):
            try container.encode("text", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
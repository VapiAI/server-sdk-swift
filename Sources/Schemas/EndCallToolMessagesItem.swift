import Foundation

public enum EndCallToolMessagesItem: Codable, Hashable, Sendable {
    case requestComplete(ToolMessageComplete)
    case requestFailed(ToolMessageFailed)
    case requestResponseDelayed(ToolMessageDelayed)
    case requestStart(ToolMessageStart)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "request-complete":
            self = .requestComplete(try ToolMessageComplete(from: decoder))
        case "request-failed":
            self = .requestFailed(try ToolMessageFailed(from: decoder))
        case "request-response-delayed":
            self = .requestResponseDelayed(try ToolMessageDelayed(from: decoder))
        case "request-start":
            self = .requestStart(try ToolMessageStart(from: decoder))
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
        case .requestComplete(let data):
            try container.encode("request-complete", forKey: .type)
            try data.encode(to: encoder)
        case .requestFailed(let data):
            try container.encode("request-failed", forKey: .type)
            try data.encode(to: encoder)
        case .requestResponseDelayed(let data):
            try container.encode("request-response-delayed", forKey: .type)
            try data.encode(to: encoder)
        case .requestStart(let data):
            try container.encode("request-start", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
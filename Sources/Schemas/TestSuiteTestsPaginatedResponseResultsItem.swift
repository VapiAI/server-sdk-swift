import Foundation

public enum TestSuiteTestsPaginatedResponseResultsItem: Codable, Hashable, Sendable {
    case chat(TestSuiteTestChat)
    case voice(TestSuiteTestVoice)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "chat":
            self = .chat(try TestSuiteTestChat(from: decoder))
        case "voice":
            self = .voice(try TestSuiteTestVoice(from: decoder))
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
        case .voice(let data):
            try container.encode("voice", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
import Foundation

public enum EvalRunResultMessagesItem: Codable, Hashable, Sendable {
    case assistant(ChatEvalAssistantMessageMock)
    case system(ChatEvalSystemMessageMock)
    case tool(ChatEvalToolResponseMessageMock)
    case user(ChatEvalUserMessageMock)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .role)
        switch discriminant {
        case "assistant":
            self = .assistant(try ChatEvalAssistantMessageMock(from: decoder))
        case "system":
            self = .system(try ChatEvalSystemMessageMock(from: decoder))
        case "tool":
            self = .tool(try ChatEvalToolResponseMessageMock(from: decoder))
        case "user":
            self = .user(try ChatEvalUserMessageMock(from: decoder))
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
            try container.encode("assistant", forKey: .role)
            try data.encode(to: encoder)
        case .system(let data):
            try container.encode("system", forKey: .role)
            try data.encode(to: encoder)
        case .tool(let data):
            try container.encode("tool", forKey: .role)
            try data.encode(to: encoder)
        case .user(let data):
            try container.encode("user", forKey: .role)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
    }
}
import Foundation

public enum WorkflowNodesItem: Codable, Hashable, Sendable {
    case conversation(ConversationNode)
    case tool(ToolNode)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "conversation":
            self = .conversation(try ConversationNode(from: decoder))
        case "tool":
            self = .tool(try ToolNode(from: decoder))
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
        case .conversation(let data):
            try container.encode("conversation", forKey: .type)
            try data.encode(to: encoder)
        case .tool(let data):
            try container.encode("tool", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
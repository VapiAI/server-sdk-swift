import Foundation

public struct AiEdgeCondition: Codable, Hashable, Sendable {
    public let type: Ai
    /// This is the prompt for the AI edge condition. It should evaluate to a boolean.
    public let prompt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: Ai,
        prompt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.prompt = prompt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(Ai.self, forKey: .type)
        self.prompt = try container.decode(String.self, forKey: .prompt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.prompt, forKey: .prompt)
    }

    public enum Ai: String, Codable, Hashable, CaseIterable, Sendable {
        case ai
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case prompt
    }
}
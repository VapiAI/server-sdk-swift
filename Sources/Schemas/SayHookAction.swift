import Foundation

public struct SayHookAction: Codable, Hashable, Sendable {
    /// This is the prompt for the assistant to generate a response based on existing conversation.
    /// Can be a string or an array of chat messages.
    public let prompt: SayHookActionPrompt?
    /// This is the message to say
    public let exact: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        prompt: SayHookActionPrompt? = nil,
        exact: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.prompt = prompt
        self.exact = exact
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.prompt = try container.decodeIfPresent(SayHookActionPrompt.self, forKey: .prompt)
        self.exact = try container.decodeIfPresent([String: JSONValue].self, forKey: .exact)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)
        try container.encodeIfPresent(self.exact, forKey: .exact)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case prompt
        case exact
    }
}
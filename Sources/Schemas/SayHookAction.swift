import Foundation

/// A hook action that makes the assistant speak exact text or generate a response from a prompt.
public struct SayHookAction: Codable, Hashable, Sendable {
    /// This is the exact message to say. When a string array is provided, one is randomly selected.
    public let exact: SayHookActionExact?
    /// This is the prompt for the assistant to generate a response based on existing conversation.
    /// Can be a string or an array of chat messages.
    public let prompt: SayHookActionPrompt?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        exact: SayHookActionExact? = nil,
        prompt: SayHookActionPrompt? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.exact = exact
        self.prompt = prompt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.exact = try container.decodeIfPresent(SayHookActionExact.self, forKey: .exact)
        self.prompt = try container.decodeIfPresent(SayHookActionPrompt.self, forKey: .prompt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.exact, forKey: .exact)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case exact
        case prompt
    }
}
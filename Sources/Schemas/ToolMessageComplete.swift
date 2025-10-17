import Foundation

public struct ToolMessageComplete: Codable, Hashable, Sendable {
    /// This is an alternative to the `content` property. It allows to specify variants of the same content, one per language.
    /// 
    /// Usage:
    /// - If your assistants are multilingual, you can provide content for each language.
    /// - If you don't provide content for a language, the first item in the array will be automatically translated to the active language at that moment.
    /// 
    /// This will override the `content` property.
    public let contents: [TextContent]?
    /// This is optional and defaults to "assistant".
    /// 
    /// When role=assistant, `content` is said out loud.
    /// 
    /// When role=system, `content` is passed to the model in a system message. Example:
    ///     system: default one
    ///     assistant:
    ///     user:
    ///     assistant:
    ///     user:
    ///     assistant:
    ///     user:
    ///     assistant: tool called
    ///     tool: your server response
    ///     <--- system prompt as hint
    ///     ---> model generates response which is spoken
    /// This is useful when you want to provide a hint to the model about what to say next.
    public let role: ToolMessageCompleteRole?
    /// This is an optional boolean that if true, the call will end after the message is spoken. Default is false.
    /// 
    /// This is ignored if `role` is set to `system`.
    /// 
    /// @default false
    public let endCallAfterSpokenEnabled: Bool?
    /// This is the content that the assistant says when this message is triggered.
    public let content: String?
    /// This is an optional array of conditions that the tool call arguments must meet in order for this message to be triggered.
    public let conditions: [Condition]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        contents: [TextContent]? = nil,
        role: ToolMessageCompleteRole? = nil,
        endCallAfterSpokenEnabled: Bool? = nil,
        content: String? = nil,
        conditions: [Condition]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.contents = contents
        self.role = role
        self.endCallAfterSpokenEnabled = endCallAfterSpokenEnabled
        self.content = content
        self.conditions = conditions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contents = try container.decodeIfPresent([TextContent].self, forKey: .contents)
        self.role = try container.decodeIfPresent(ToolMessageCompleteRole.self, forKey: .role)
        self.endCallAfterSpokenEnabled = try container.decodeIfPresent(Bool.self, forKey: .endCallAfterSpokenEnabled)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
        self.conditions = try container.decodeIfPresent([Condition].self, forKey: .conditions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.contents, forKey: .contents)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encodeIfPresent(self.endCallAfterSpokenEnabled, forKey: .endCallAfterSpokenEnabled)
        try container.encodeIfPresent(self.content, forKey: .content)
        try container.encodeIfPresent(self.conditions, forKey: .conditions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case contents
        case role
        case endCallAfterSpokenEnabled
        case content
        case conditions
    }
}
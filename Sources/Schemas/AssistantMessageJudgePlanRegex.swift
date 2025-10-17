import Foundation

public struct AssistantMessageJudgePlanRegex: Codable, Hashable, Sendable {
    /// This is what that will be used to evaluate the model's message content.
    /// The content will be evaluated against the regex pattern provided in the Judge Plan content field.
    /// Evaluation is considered successful if the regex pattern matches any part of the assistant message content.
    public let content: String
    /// This is the tool calls that will be used to evaluate the model's message content.
    /// The tool name must be a valid tool that the assistant is allowed to call.
    /// The values to the arguments for the tool call should be a Regular Expression.
    /// Evaluation is considered successful if the regex pattern matches any part of each tool call argument.
    /// 
    /// For the Query tool, the arguments for the tool call are in the format - {knowledgeBaseNames: ['kb_name', 'kb_name_2']}
    /// 
    /// For the DTMF tool, the arguments for the tool call are in the format - {dtmf: "1234*"}
    /// 
    /// For the Handoff tool, the arguments for the tool call are in the format - {destination: "assistant_id"}
    /// 
    /// For the Transfer Call tool, the arguments for the tool call are in the format - {destination: "phone_number_or_assistant_id"}
    /// 
    /// For all other tools, they are called without arguments or with user-defined arguments
    public let toolCalls: [ChatEvalAssistantMessageMockToolCall]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        content: String,
        toolCalls: [ChatEvalAssistantMessageMockToolCall]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.content = content
        self.toolCalls = toolCalls
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
        self.toolCalls = try container.decodeIfPresent([ChatEvalAssistantMessageMockToolCall].self, forKey: .toolCalls)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.content, forKey: .content)
        try container.encodeIfPresent(self.toolCalls, forKey: .toolCalls)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case content
        case toolCalls
    }
}
import Foundation

public struct AssistantMessageEvaluationContinuePlan: Codable, Hashable, Sendable {
    /// This is whether the evaluation should exit if the assistant message evaluates to false.
    /// By default, it is false and the evaluation will continue.
    /// @default false
    public let exitOnFailureEnabled: Bool?
    /// This is the content that will be used in the conversation for this assistant turn moving forward if provided.
    /// It will override the content received from the model.
    public let contentOverride: String?
    /// This is the tool calls that will be used in the conversation for this assistant turn moving forward if provided.
    /// It will override the tool calls received from the model.
    public let toolCallsOverride: [ChatEvalAssistantMessageMockToolCall]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        exitOnFailureEnabled: Bool? = nil,
        contentOverride: String? = nil,
        toolCallsOverride: [ChatEvalAssistantMessageMockToolCall]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.exitOnFailureEnabled = exitOnFailureEnabled
        self.contentOverride = contentOverride
        self.toolCallsOverride = toolCallsOverride
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.exitOnFailureEnabled = try container.decodeIfPresent(Bool.self, forKey: .exitOnFailureEnabled)
        self.contentOverride = try container.decodeIfPresent(String.self, forKey: .contentOverride)
        self.toolCallsOverride = try container.decodeIfPresent([ChatEvalAssistantMessageMockToolCall].self, forKey: .toolCallsOverride)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.exitOnFailureEnabled, forKey: .exitOnFailureEnabled)
        try container.encodeIfPresent(self.contentOverride, forKey: .contentOverride)
        try container.encodeIfPresent(self.toolCallsOverride, forKey: .toolCallsOverride)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case exitOnFailureEnabled
        case contentOverride
        case toolCallsOverride
    }
}
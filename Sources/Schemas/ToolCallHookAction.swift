import Foundation

public struct ToolCallHookAction: Codable, Hashable, Sendable {
    /// This is the type of action - must be "tool"
    public let type: ToolCallHookActionType
    /// This is the tool to call. To use an existing tool, send `toolId` instead.
    public let tool: ToolCallHookActionTool?
    /// This is the tool to call. To use a transient tool, send `tool` instead.
    public let toolId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: ToolCallHookActionType,
        tool: ToolCallHookActionTool? = nil,
        toolId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.tool = tool
        self.toolId = toolId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ToolCallHookActionType.self, forKey: .type)
        self.tool = try container.decodeIfPresent(ToolCallHookActionTool.self, forKey: .tool)
        self.toolId = try container.decodeIfPresent(String.self, forKey: .toolId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.tool, forKey: .tool)
        try container.encodeIfPresent(self.toolId, forKey: .toolId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case tool
        case toolId
    }
}
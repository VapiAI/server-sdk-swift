import Foundation

public struct ToolNode: Codable, Hashable, Sendable {
    /// This is the tool to call. To use an existing tool, send `toolId` instead.
    public let tool: ToolNodeTool?
    /// This is the tool to call. To use a transient tool, send `tool` instead.
    public let toolId: String?
    public let name: String
    /// This is whether or not the node is the start of the workflow.
    public let isStart: Bool?
    /// This is for metadata you want to store on the task.
    public let metadata: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        tool: ToolNodeTool? = nil,
        toolId: String? = nil,
        name: String,
        isStart: Bool? = nil,
        metadata: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.tool = tool
        self.toolId = toolId
        self.name = name
        self.isStart = isStart
        self.metadata = metadata
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tool = try container.decodeIfPresent(ToolNodeTool.self, forKey: .tool)
        self.toolId = try container.decodeIfPresent(String.self, forKey: .toolId)
        self.name = try container.decode(String.self, forKey: .name)
        self.isStart = try container.decodeIfPresent(Bool.self, forKey: .isStart)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.tool, forKey: .tool)
        try container.encodeIfPresent(self.toolId, forKey: .toolId)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.isStart, forKey: .isStart)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case tool
        case toolId
        case name
        case isStart
        case metadata
    }
}
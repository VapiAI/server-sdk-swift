import Foundation

public struct SessionCreatedHook: Codable, Hashable, Sendable {
    /// This is the event that triggers this hook
    public let on: SessionCreatedHookOn
    /// This is the set of actions to perform when the hook triggers.
    public let `do`: [ToolCallHookAction]
    /// Optional name for this hook instance.
    /// If no name is provided, the hook will be auto generated as UUID.
    /// 
    /// @default UUID
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        on: SessionCreatedHookOn,
        do: [ToolCallHookAction],
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.on = on
        self.do = `do`
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.on = try container.decode(SessionCreatedHookOn.self, forKey: .on)
        self.do = try container.decode([ToolCallHookAction].self, forKey: .do)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.on, forKey: .on)
        try container.encode(self.do, forKey: .do)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case on
        case `do`
        case name
    }
}
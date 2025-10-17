import Foundation

public struct CallHookCallEnding: Codable, Hashable, Sendable {
    /// This is the event that triggers this hook
    public let on: CallEnding
    /// This is the set of actions to perform when the hook triggers
    public let `do`: [ToolCallHookAction]
    /// This is the set of filters that must match for the hook to trigger
    public let filters: [CallHookFilter]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        on: CallEnding,
        do: [ToolCallHookAction],
        filters: [CallHookFilter]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.on = on
        self.do = `do`
        self.filters = filters
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.on = try container.decode(CallEnding.self, forKey: .on)
        self.do = try container.decode([ToolCallHookAction].self, forKey: .do)
        self.filters = try container.decodeIfPresent([CallHookFilter].self, forKey: .filters)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.on, forKey: .on)
        try container.encode(self.do, forKey: .do)
        try container.encodeIfPresent(self.filters, forKey: .filters)
    }

    public enum CallEnding: String, Codable, Hashable, CaseIterable, Sendable {
        case callEnding = "call.ending"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case on
        case `do`
        case filters
    }
}
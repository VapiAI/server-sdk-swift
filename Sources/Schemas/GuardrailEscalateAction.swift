import Foundation

public struct GuardrailEscalateAction: Codable, Hashable, Sendable {
    public let type: GuardrailEscalateActionType
    /// Existing same-organization tool; attachment is checked at assignment. Tool edits/deletion can invalidate the action: activation must revalidate the current tool and arguments, and use failurePolicy on failure.
    public let toolId: String
    /// Parameter names follow the normalized tool schema (SMS uses body/to).
    public let arguments: [String: JSONValue]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: GuardrailEscalateActionType,
        toolId: String,
        arguments: [String: JSONValue],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.toolId = toolId
        self.arguments = arguments
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(GuardrailEscalateActionType.self, forKey: .type)
        self.toolId = try container.decode(String.self, forKey: .toolId)
        self.arguments = try container.decode([String: JSONValue].self, forKey: .arguments)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.toolId, forKey: .toolId)
        try container.encode(self.arguments, forKey: .arguments)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case toolId
        case arguments
    }
}
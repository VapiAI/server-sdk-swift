import Foundation

public struct GuardrailFixedResponseAction: Codable, Hashable, Sendable {
    public let type: GuardrailFixedResponseActionType
    /// Replacement speech; it must pass its own guardrail evaluation.
    public let text: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: GuardrailFixedResponseActionType,
        text: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.text = text
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(GuardrailFixedResponseActionType.self, forKey: .type)
        self.text = try container.decode(String.self, forKey: .text)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.text, forKey: .text)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case text
    }
}
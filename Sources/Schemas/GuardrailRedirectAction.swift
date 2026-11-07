import Foundation

public struct GuardrailRedirectAction: Codable, Hashable, Sendable {
    public let type: GuardrailRedirectActionType
    /// Steering instructions for generating a replacement candidate.
    public let instructions: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: GuardrailRedirectActionType,
        instructions: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.instructions = instructions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(GuardrailRedirectActionType.self, forKey: .type)
        self.instructions = try container.decode(String.self, forKey: .instructions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.instructions, forKey: .instructions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case instructions
    }
}
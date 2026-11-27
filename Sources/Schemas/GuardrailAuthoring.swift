import Foundation

public struct GuardrailAuthoring: Codable, Hashable, Sendable {
    public let mode: GuardrailAuthoringMode
    public let behavior: String
    /// Natural-language condition evaluated using the candidate and call history.
    public let condition: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        mode: GuardrailAuthoringMode,
        behavior: String,
        condition: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.mode = mode
        self.behavior = behavior
        self.condition = condition
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mode = try container.decode(GuardrailAuthoringMode.self, forKey: .mode)
        self.behavior = try container.decode(String.self, forKey: .behavior)
        self.condition = try container.decodeIfPresent(String.self, forKey: .condition)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.mode, forKey: .mode)
        try container.encode(self.behavior, forKey: .behavior)
        try container.encodeIfPresent(self.condition, forKey: .condition)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case mode
        case behavior
        case condition
    }
}
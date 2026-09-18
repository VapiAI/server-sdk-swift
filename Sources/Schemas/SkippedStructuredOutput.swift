import Foundation

public struct SkippedStructuredOutput: Codable, Hashable, Sendable {
    /// This is the name of the structured output that was skipped.
    public let name: String
    /// This is the first condition that was not met. Conditions use AND semantics, so
    /// evaluation stops as soon as one condition does not pass.
    public let unmetCondition: SkippedStructuredOutputUnmetCondition
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        unmetCondition: SkippedStructuredOutputUnmetCondition,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.unmetCondition = unmetCondition
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.unmetCondition = try container.decode(SkippedStructuredOutputUnmetCondition.self, forKey: .unmetCondition)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.unmetCondition, forKey: .unmetCondition)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case unmetCondition
    }
}
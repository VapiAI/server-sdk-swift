import Foundation

public struct StructuredOutputControllerRunResponseZero: Codable, Hashable, Sendable {
    /// These are the structured outputs whose conditions gated them, keyed by
    /// structured output id. Absent when nothing was skipped. An entry here means
    /// no extraction ran and no cost was incurred for that output.
    public let skipped: [String: SkippedStructuredOutput]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        skipped: [String: SkippedStructuredOutput]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.skipped = skipped
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.skipped = try container.decodeIfPresent([String: SkippedStructuredOutput].self, forKey: .skipped)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.skipped, forKey: .skipped)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case skipped
    }
}
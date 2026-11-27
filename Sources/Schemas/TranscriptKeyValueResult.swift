import Foundation

public struct TranscriptKeyValueResult: Codable, Hashable, Sendable {
    /// This is the key value's position in the answer key.
    public let index: Double
    /// This is the key value as the answer key wrote it. Absent for organizations
    /// with HIPAA, PCI or zero data retention enabled.
    public let value: String?
    /// This is how the value came through.
    /// - exact: letter for letter, or as an accepted variant
    /// - near: a close spelling, at most about one wrong letter in five
    /// - missed: not found
    public let verdict: TranscriptKeyValueResultVerdict
    /// This is whether this key value had to come through exactly for the
    /// simulation to pass. Kept for every organization, since it carries no answer-key text.
    public let required: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        index: Double,
        value: String? = nil,
        verdict: TranscriptKeyValueResultVerdict,
        required: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.index = index
        self.value = value
        self.verdict = verdict
        self.required = required
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.index = try container.decode(Double.self, forKey: .index)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
        self.verdict = try container.decode(TranscriptKeyValueResultVerdict.self, forKey: .verdict)
        self.required = try container.decode(Bool.self, forKey: .required)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.index, forKey: .index)
        try container.encodeIfPresent(self.value, forKey: .value)
        try container.encode(self.verdict, forKey: .verdict)
        try container.encode(self.required, forKey: .required)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case index
        case value
        case verdict
        case required
    }
}
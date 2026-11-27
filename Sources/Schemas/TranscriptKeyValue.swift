import Foundation

public struct TranscriptKeyValue: Codable, Hashable, Sendable {
    /// This is the value as the answer key writes it. It matches the same words in
    /// the same order, ignoring case and punctuation, or the value spelled out letter
    /// by letter ("Maria" matches "M A R I A"). Split into different words, it
    /// scores near ("HubSpot" heard as "hub spot"), so list such forms in
    /// acceptedVariants when the value is required.
    public let value: String
    /// These are other spellings that count as the same value, such as "Rayner"
    /// for "Raynor".
    public let acceptedVariants: [String]?
    /// This is whether the simulation fails unless this value comes through
    /// exactly. Defaults to false: the verdict is reported but does not decide
    /// pass or fail.
    public let required: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        value: String,
        acceptedVariants: [String]? = nil,
        required: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.value = value
        self.acceptedVariants = acceptedVariants
        self.required = required
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try container.decode(String.self, forKey: .value)
        self.acceptedVariants = try container.decodeIfPresent([String].self, forKey: .acceptedVariants)
        self.required = try container.decodeIfPresent(Bool.self, forKey: .required)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.value, forKey: .value)
        try container.encodeIfPresent(self.acceptedVariants, forKey: .acceptedVariants)
        try container.encodeIfPresent(self.required, forKey: .required)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case value
        case acceptedVariants
        case required
    }
}
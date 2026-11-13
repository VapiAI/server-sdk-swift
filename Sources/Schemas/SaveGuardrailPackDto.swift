import Foundation

public struct SaveGuardrailPackDto: Codable, Hashable, Sendable {
    public let name: String?
    /// Projected from membership rows; a supplied array replaces membership.
    public let ruleIds: [String]?
    /// The complete last-read snapshot prevents silently replacing another editor’s changes.
    public let expected: GuardrailPackSnapshot
    /// Exact deduplicated impact acknowledged by the user; rechecked while the pack is locked.
    public let confirmedAssistantIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        ruleIds: [String]? = nil,
        expected: GuardrailPackSnapshot,
        confirmedAssistantIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.ruleIds = ruleIds
        self.expected = expected
        self.confirmedAssistantIds = confirmedAssistantIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.ruleIds = try container.decodeIfPresent([String].self, forKey: .ruleIds)
        self.expected = try container.decode(GuardrailPackSnapshot.self, forKey: .expected)
        self.confirmedAssistantIds = try container.decodeIfPresent([String].self, forKey: .confirmedAssistantIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.ruleIds, forKey: .ruleIds)
        try container.encode(self.expected, forKey: .expected)
        try container.encodeIfPresent(self.confirmedAssistantIds, forKey: .confirmedAssistantIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case ruleIds
        case expected
        case confirmedAssistantIds
    }
}
import Foundation

public struct SaveGuardrailRuleDto: Codable, Hashable, Sendable {
    public let name: String?
    /// Structured editor input. Supplied PATCH authoring replaces the complete object; advanced text writes clear it to null.
    public let authoring: Nullable<GuardrailAuthoring>?
    /// Advanced text input. Do not supply it together with structured authoring.
    public let instructions: String?
    /// Evaluation sensitivity; numeric cutoffs are internal and provisional.
    public let sensitivity: SaveGuardrailRuleDtoSensitivity?
    /// Supplied PATCH actions replace the complete variant.
    public let action: SaveGuardrailRuleDtoAction?
    /// Last-read configuration; the complete snapshot prevents lost edits.
    public let expected: GuardrailRuleSnapshot
    /// Current deduplicated assistant impact acknowledged before a shared save.
    public let confirmedAssistantIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        authoring: Nullable<GuardrailAuthoring>? = nil,
        instructions: String? = nil,
        sensitivity: SaveGuardrailRuleDtoSensitivity? = nil,
        action: SaveGuardrailRuleDtoAction? = nil,
        expected: GuardrailRuleSnapshot,
        confirmedAssistantIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.authoring = authoring
        self.instructions = instructions
        self.sensitivity = sensitivity
        self.action = action
        self.expected = expected
        self.confirmedAssistantIds = confirmedAssistantIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.authoring = try container.decodeNullableIfPresent(GuardrailAuthoring.self, forKey: .authoring)
        self.instructions = try container.decodeIfPresent(String.self, forKey: .instructions)
        self.sensitivity = try container.decodeIfPresent(SaveGuardrailRuleDtoSensitivity.self, forKey: .sensitivity)
        self.action = try container.decodeIfPresent(SaveGuardrailRuleDtoAction.self, forKey: .action)
        self.expected = try container.decode(GuardrailRuleSnapshot.self, forKey: .expected)
        self.confirmedAssistantIds = try container.decodeIfPresent([String].self, forKey: .confirmedAssistantIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.authoring, forKey: .authoring)
        try container.encodeIfPresent(self.instructions, forKey: .instructions)
        try container.encodeIfPresent(self.sensitivity, forKey: .sensitivity)
        try container.encodeIfPresent(self.action, forKey: .action)
        try container.encode(self.expected, forKey: .expected)
        try container.encodeIfPresent(self.confirmedAssistantIds, forKey: .confirmedAssistantIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case authoring
        case instructions
        case sensitivity
        case action
        case expected
        case confirmedAssistantIds
    }
}
import Foundation

public struct GuardrailRuleImpact: Codable, Hashable, Sendable {
    /// Distinct assistants affected across direct, pack, draft, and version selections.
    public let assistantIds: [String]
    /// Packs currently containing the rule.
    public let packIds: [String]
    /// Names for the same distinct assistant identities.
    public let assistants: [GuardrailRuleUsage]
    /// Names for the containing pack identities.
    public let packs: [GuardrailRuleUsage]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantIds: [String],
        packIds: [String],
        assistants: [GuardrailRuleUsage],
        packs: [GuardrailRuleUsage],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantIds = assistantIds
        self.packIds = packIds
        self.assistants = assistants
        self.packs = packs
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantIds = try container.decode([String].self, forKey: .assistantIds)
        self.packIds = try container.decode([String].self, forKey: .packIds)
        self.assistants = try container.decode([GuardrailRuleUsage].self, forKey: .assistants)
        self.packs = try container.decode([GuardrailRuleUsage].self, forKey: .packs)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assistantIds, forKey: .assistantIds)
        try container.encode(self.packIds, forKey: .packIds)
        try container.encode(self.assistants, forKey: .assistants)
        try container.encode(self.packs, forKey: .packs)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantIds
        case packIds
        case assistants
        case packs
    }
}
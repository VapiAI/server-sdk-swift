import Foundation

public struct GuardrailRule: Codable, Hashable, Sendable {
    public let id: String
    public let orgId: String
    public let createdAt: Date
    public let updatedAt: Date
    public let name: String
    /// Structured editor input. Supplied PATCH authoring replaces the complete object; advanced text writes clear it to null.
    public let authoring: Nullable<GuardrailAuthoring>?
    /// Evaluated instructions, generated from authoring or supplied in advanced mode.
    public let instructions: String?
    /// Evaluation sensitivity; numeric cutoffs are internal and provisional.
    public let sensitivity: GuardrailRuleSensitivity
    /// Supplied PATCH actions replace the complete variant.
    public let action: GuardrailRuleAction
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String,
        authoring: Nullable<GuardrailAuthoring>? = nil,
        instructions: String? = nil,
        sensitivity: GuardrailRuleSensitivity,
        action: GuardrailRuleAction,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.authoring = authoring
        self.instructions = instructions
        self.sensitivity = sensitivity
        self.action = action
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.authoring = try container.decodeNullableIfPresent(GuardrailAuthoring.self, forKey: .authoring)
        self.instructions = try container.decodeIfPresent(String.self, forKey: .instructions)
        self.sensitivity = try container.decode(GuardrailRuleSensitivity.self, forKey: .sensitivity)
        self.action = try container.decode(GuardrailRuleAction.self, forKey: .action)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.authoring, forKey: .authoring)
        try container.encodeIfPresent(self.instructions, forKey: .instructions)
        try container.encode(self.sensitivity, forKey: .sensitivity)
        try container.encode(self.action, forKey: .action)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case authoring
        case instructions
        case sensitivity
        case action
    }
}
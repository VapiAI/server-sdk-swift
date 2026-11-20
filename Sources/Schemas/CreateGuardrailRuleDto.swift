import Foundation

public struct CreateGuardrailRuleDto: Codable, Hashable, Sendable {
    public let name: String
    /// Structured editor input. Supplied PATCH authoring replaces the complete object; advanced text writes clear it to null.
    public let authoring: Nullable<GuardrailAuthoring>?
    /// Advanced text input. Do not supply it together with structured authoring.
    public let instructions: String?
    /// Evaluation sensitivity; numeric cutoffs are internal and provisional.
    public let sensitivity: CreateGuardrailRuleDtoSensitivity
    /// Supplied PATCH actions replace the complete variant.
    public let action: CreateGuardrailRuleDtoAction
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        authoring: Nullable<GuardrailAuthoring>? = nil,
        instructions: String? = nil,
        sensitivity: CreateGuardrailRuleDtoSensitivity,
        action: CreateGuardrailRuleDtoAction,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.authoring = authoring
        self.instructions = instructions
        self.sensitivity = sensitivity
        self.action = action
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.authoring = try container.decodeNullableIfPresent(GuardrailAuthoring.self, forKey: .authoring)
        self.instructions = try container.decodeIfPresent(String.self, forKey: .instructions)
        self.sensitivity = try container.decode(CreateGuardrailRuleDtoSensitivity.self, forKey: .sensitivity)
        self.action = try container.decode(CreateGuardrailRuleDtoAction.self, forKey: .action)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.authoring, forKey: .authoring)
        try container.encodeIfPresent(self.instructions, forKey: .instructions)
        try container.encode(self.sensitivity, forKey: .sensitivity)
        try container.encode(self.action, forKey: .action)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case authoring
        case instructions
        case sensitivity
        case action
    }
}
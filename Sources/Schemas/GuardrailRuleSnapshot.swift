import Foundation

public struct GuardrailRuleSnapshot: Codable, Hashable, Sendable {
    /// Millisecond timestamp from the last-read resource.
    public let updatedAt: Date
    public let name: String
    /// Structured editor input. Supplied PATCH authoring replaces the complete object; advanced text writes clear it to null.
    public let authoring: Nullable<GuardrailAuthoring>?
    /// Evaluated instructions, generated from authoring or supplied in advanced mode.
    public let instructions: String
    /// Evaluation sensitivity; numeric cutoffs are internal and provisional.
    public let sensitivity: GuardrailRuleSnapshotSensitivity
    /// Supplied PATCH actions replace the complete variant.
    public let action: GuardrailRuleSnapshotAction
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        updatedAt: Date,
        name: String,
        authoring: Nullable<GuardrailAuthoring>? = nil,
        instructions: String,
        sensitivity: GuardrailRuleSnapshotSensitivity,
        action: GuardrailRuleSnapshotAction,
        additionalProperties: [String: JSONValue] = .init()
    ) {
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
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.authoring = try container.decodeNullableIfPresent(GuardrailAuthoring.self, forKey: .authoring)
        self.instructions = try container.decode(String.self, forKey: .instructions)
        self.sensitivity = try container.decode(GuardrailRuleSnapshotSensitivity.self, forKey: .sensitivity)
        self.action = try container.decode(GuardrailRuleSnapshotAction.self, forKey: .action)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.authoring, forKey: .authoring)
        try container.encode(self.instructions, forKey: .instructions)
        try container.encode(self.sensitivity, forKey: .sensitivity)
        try container.encode(self.action, forKey: .action)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case updatedAt
        case name
        case authoring
        case instructions
        case sensitivity
        case action
    }
}
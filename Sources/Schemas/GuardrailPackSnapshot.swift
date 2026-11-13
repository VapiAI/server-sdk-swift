import Foundation

public struct GuardrailPackSnapshot: Codable, Hashable, Sendable {
    public let updatedAt: Date
    public let name: String
    /// Projected from membership rows; a supplied array replaces membership.
    public let ruleIds: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        updatedAt: Date,
        name: String,
        ruleIds: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.updatedAt = updatedAt
        self.name = name
        self.ruleIds = ruleIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.ruleIds = try container.decode([String].self, forKey: .ruleIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.ruleIds, forKey: .ruleIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case updatedAt
        case name
        case ruleIds
    }
}
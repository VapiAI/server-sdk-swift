import Foundation

public struct GroupCondition: Codable, Hashable, Sendable {
    /// This is the logical operator for combining conditions in this group
    public let `operator`: GroupConditionOperator
    /// This is the list of nested conditions to evaluate.
    /// Supports recursive nesting of groups for complex logic.
    public let conditions: [GroupConditionConditionsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        operator: GroupConditionOperator,
        conditions: [GroupConditionConditionsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.operator = `operator`
        self.conditions = conditions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.operator = try container.decode(GroupConditionOperator.self, forKey: .operator)
        self.conditions = try container.decode([GroupConditionConditionsItem].self, forKey: .conditions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.operator, forKey: .operator)
        try container.encode(self.conditions, forKey: .conditions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case `operator`
        case conditions
    }
}
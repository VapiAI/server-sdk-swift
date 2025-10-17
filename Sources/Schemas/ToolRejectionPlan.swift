import Foundation

public struct ToolRejectionPlan: Codable, Hashable, Sendable {
    /// This is the list of conditions that must be evaluated.
    /// 
    /// Usage:
    /// - If all conditions match (AND logic), the tool call is rejected.
    /// - For OR logic at the top level, use a single 'group' condition with operator: 'OR'.
    /// 
    /// @default [] - Empty array means tool always executes
    public let conditions: [ToolRejectionPlanConditionsItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        conditions: [ToolRejectionPlanConditionsItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.conditions = conditions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.conditions = try container.decodeIfPresent([ToolRejectionPlanConditionsItem].self, forKey: .conditions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.conditions, forKey: .conditions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case conditions
    }
}
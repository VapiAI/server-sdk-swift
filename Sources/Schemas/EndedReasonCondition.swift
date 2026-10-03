import Foundation

public struct EndedReasonCondition: Codable, Hashable, Sendable {
    /// This is the membership operator applied against `values`.
    /// 
    /// - 'oneOf': the structured output runs only if the call's ended reason is in `values`.
    /// - 'notOneOf': the structured output runs only if the call's ended reason is NOT in `values`.
    public let `operator`: EndedReasonConditionOperator
    /// These are the ended reasons compared against the call's ended reason.
    /// 
    /// Any string is accepted so configurations never break when new ended
    /// reasons are introduced. Must contain at least one value.
    public let values: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        operator: EndedReasonConditionOperator,
        values: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.operator = `operator`
        self.values = values
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.operator = try container.decode(EndedReasonConditionOperator.self, forKey: .operator)
        self.values = try container.decode([String].self, forKey: .values)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.operator, forKey: .operator)
        try container.encode(self.values, forKey: .values)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case `operator`
        case values
    }
}
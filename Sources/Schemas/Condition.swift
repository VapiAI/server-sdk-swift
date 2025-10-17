import Foundation

public struct Condition: Codable, Hashable, Sendable {
    /// This is the operator you want to use to compare the parameter and value.
    public let `operator`: ConditionOperator
    /// This is the name of the parameter that you want to check.
    public let param: String
    /// This is the value you want to compare against the parameter.
    public let value: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        operator: ConditionOperator,
        param: String,
        value: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.operator = `operator`
        self.param = param
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.operator = try container.decode(ConditionOperator.self, forKey: .operator)
        self.param = try container.decode(String.self, forKey: .param)
        self.value = try container.decode(String.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.operator, forKey: .operator)
        try container.encode(self.param, forKey: .param)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case `operator`
        case param
        case value
    }
}
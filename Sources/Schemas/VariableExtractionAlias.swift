import Foundation

public struct VariableExtractionAlias: Codable, Hashable, Sendable {
    /// This is the key of the variable.
    /// 
    /// This variable will be accessible during the call as `{{key}}` and stored in `call.artifact.variableValues` after the call.
    /// 
    /// Rules:
    /// - Must start with a letter (a-z, A-Z).
    /// - Subsequent characters can be letters, numbers, or underscores.
    /// - Minimum length of 1 and maximum length of 40.
    public let key: String
    /// This is the value of the variable.
    /// 
    /// This can reference existing variables, use filters, and perform transformations.
    /// 
    /// Examples: "{{name}}", "{{customer.email}}", "Hello {{name | upcase}}"
    public let value: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        key: String,
        value: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.key = key
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decode(String.self, forKey: .key)
        self.value = try container.decode(String.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case key
        case value
    }
}
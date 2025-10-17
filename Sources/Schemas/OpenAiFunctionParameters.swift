import Foundation

public struct OpenAiFunctionParameters: Codable, Hashable, Sendable {
    /// This must be set to 'object'. It instructs the model to return a JSON object containing the function call properties.
    public let type: Object
    /// This provides a description of the properties required by the function.
    /// JSON Schema can be used to specify expectations for each property.
    /// Refer to [this doc](https://ajv.js.org/json-schema.html#json-data-type) for a comprehensive guide on JSON Schema.
    public let properties: [String: JsonSchema]
    /// This specifies the properties that are required by the function.
    public let required: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: Object,
        properties: [String: JsonSchema],
        required: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.properties = properties
        self.required = required
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(Object.self, forKey: .type)
        self.properties = try container.decode([String: JsonSchema].self, forKey: .properties)
        self.required = try container.decodeIfPresent([String].self, forKey: .required)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.properties, forKey: .properties)
        try container.encodeIfPresent(self.required, forKey: .required)
    }

    public enum Object: String, Codable, Hashable, CaseIterable, Sendable {
        case object
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case properties
        case required
    }
}
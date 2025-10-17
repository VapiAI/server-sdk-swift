import Foundation

public struct JsonSchema: Codable, Hashable, Sendable {
    /// This is the type of output you'd like.
    /// 
    /// `string`, `number`, `integer`, `boolean` are the primitive types and should be obvious.
    /// 
    /// `array` and `object` are more interesting and quite powerful. They allow you to define nested structures.
    /// 
    /// For `array`, you can define the schema of the items in the array using the `items` property.
    /// 
    /// For `object`, you can define the properties of the object using the `properties` property.
    public let type: JsonSchemaType
    /// This is required if the type is "array". This is the schema of the items in the array.
    /// 
    /// This is of type JsonSchema. However, Swagger doesn't support circular references.
    public let items: [String: JSONValue]?
    /// This is required if the type is "object". This specifies the properties of the object.
    /// 
    /// This is a map of string to JsonSchema. However, Swagger doesn't support circular references.
    public let properties: [String: JSONValue]?
    /// This is the description to help the model understand what it needs to output.
    public let description: String?
    /// This is the pattern of the string. This is a regex that will be used to validate the data in question. To use a common format, use the `format` property instead.
    /// 
    /// OpenAI documentation: https://platform.openai.com/docs/guides/structured-outputs#supported-properties
    public let pattern: String?
    /// This is the format of the string. To pass a regex, use the `pattern` property instead.
    /// 
    /// OpenAI documentation: https://platform.openai.com/docs/guides/structured-outputs?api-mode=chat&type-restrictions=string-restrictions
    public let format: JsonSchemaFormat?
    /// This is a list of properties that are required.
    /// 
    /// This only makes sense if the type is "object".
    public let required: [String]?
    /// This array specifies the allowed values that can be used to restrict the output of the model.
    public let `enum`: [String]?
    /// This is the title of the schema.
    public let title: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: JsonSchemaType,
        items: [String: JSONValue]? = nil,
        properties: [String: JSONValue]? = nil,
        description: String? = nil,
        pattern: String? = nil,
        format: JsonSchemaFormat? = nil,
        required: [String]? = nil,
        enum: [String]? = nil,
        title: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.items = items
        self.properties = properties
        self.description = description
        self.pattern = pattern
        self.format = format
        self.required = required
        self.enum = `enum`
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(JsonSchemaType.self, forKey: .type)
        self.items = try container.decodeIfPresent([String: JSONValue].self, forKey: .items)
        self.properties = try container.decodeIfPresent([String: JSONValue].self, forKey: .properties)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.pattern = try container.decodeIfPresent(String.self, forKey: .pattern)
        self.format = try container.decodeIfPresent(JsonSchemaFormat.self, forKey: .format)
        self.required = try container.decodeIfPresent([String].self, forKey: .required)
        self.enum = try container.decodeIfPresent([String].self, forKey: .enum)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.items, forKey: .items)
        try container.encodeIfPresent(self.properties, forKey: .properties)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.pattern, forKey: .pattern)
        try container.encodeIfPresent(self.format, forKey: .format)
        try container.encodeIfPresent(self.required, forKey: .required)
        try container.encodeIfPresent(self.enum, forKey: .enum)
        try container.encodeIfPresent(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case items
        case properties
        case description
        case pattern
        case format
        case required
        case `enum`
        case title
    }
}
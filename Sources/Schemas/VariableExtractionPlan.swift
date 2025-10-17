import Foundation

public struct VariableExtractionPlan: Codable, Hashable, Sendable {
    /// This is the schema to extract.
    /// 
    /// Examples:
    /// 1. To extract object properties, you can use the following schema:
    /// ```json
    /// {
    ///   "type": "object",
    ///   "properties": {
    ///     "name": {
    ///       "type": "string"
    ///     },
    ///     "age": {
    ///       "type": "number"
    ///     }
    ///   }
    /// }
    /// ```
    /// 
    /// These will be extracted as `{{ name }}` and `{{ age }}` respectively. To emphasize, object properties are extracted as direct global variables.
    /// 
    /// 2. To extract nested properties, you can use the following schema:
    /// ```json
    /// {
    ///   "type": "object",
    ///   "properties": {
    ///     "name": {
    ///       "type": "object",
    ///       "properties": {
    ///         "first": {
    ///           "type": "string"
    ///         },
    ///         "last": {
    ///           "type": "string"
    ///         }
    ///       }
    ///     }
    ///   }
    /// }
    /// ```
    /// 
    /// These will be extracted as `{{ name }}`. And, `{{ name.first }}` and `{{ name.last }}` will be accessible.
    /// 
    /// 3. To extract array items, you can use the following schema:
    /// ```json
    /// {
    ///   "type": "array",
    ///   "title": "zipCodes",
    ///   "items": {
    ///     "type": "string"
    ///   }
    /// }
    /// ```
    /// 
    /// This will be extracted as `{{ zipCodes }}`. To access the array items, you can use `{{ zipCodes[0] }}` and `{{ zipCodes[1] }}`.
    /// 
    /// 4. To extract array of objects, you can use the following schema:
    /// 
    /// ```json
    /// {
    ///   "type": "array",
    ///   "name": "people",
    ///   "items": {
    ///     "type": "object",
    ///     "properties": {
    ///       "name": {
    ///         "type": "string"
    ///       },
    ///       "age": {
    ///         "type": "number"
    ///       },
    ///       "zipCodes": {
    ///         "type": "array",
    ///         "items": {
    ///           "type": "string"
    ///         }
    ///       }
    ///     }
    ///   }
    /// }
    /// ```
    /// 
    /// This will be extracted as `{{ people }}`. To access the array items, you can use `{{ people[n].name }}`, `{{ people[n].age }}`, `{{ people[n].zipCodes }}`, `{{ people[n].zipCodes[0] }}` and `{{ people[n].zipCodes[1] }}`.
    public let schema: JsonSchema?
    /// These are additional variables to create.
    /// 
    /// These will be accessible during the call as `{{key}}` and stored in `call.artifact.variableValues` after the call.
    /// 
    /// Example:
    /// ```json
    /// {
    ///   "aliases": [
    ///     {
    ///       "key": "customerName",
    ///       "value": "{{name}}"
    ///     },
    ///     {
    ///       "key": "fullName",
    ///       "value": "{{firstName}} {{lastName}}"
    ///     },
    ///     {
    ///       "key": "greeting",
    ///       "value": "Hello {{name}}, welcome to {{company}}!"
    ///     },
    ///     {
    ///       "key": "customerCity",
    ///       "value": "{{addresses[0].city}}"
    ///     },
    ///     {
    ///       "key": "something",
    ///       "value": "{{any liquid}}"
    ///     }
    ///   ]
    /// }
    /// ```
    /// 
    /// This will create variables `customerName`, `fullName`, `greeting`, `customerCity`, and `something`. To access these variables, you can reference them as `{{customerName}}`, `{{fullName}}`, `{{greeting}}`, `{{customerCity}}`, and `{{something}}`.
    public let aliases: [VariableExtractionAlias]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        schema: JsonSchema? = nil,
        aliases: [VariableExtractionAlias]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.schema = schema
        self.aliases = aliases
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.schema = try container.decodeIfPresent(JsonSchema.self, forKey: .schema)
        self.aliases = try container.decodeIfPresent([VariableExtractionAlias].self, forKey: .aliases)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.schema, forKey: .schema)
        try container.encodeIfPresent(self.aliases, forKey: .aliases)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case schema
        case aliases
    }
}
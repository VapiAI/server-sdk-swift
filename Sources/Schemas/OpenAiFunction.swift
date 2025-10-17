import Foundation

public struct OpenAiFunction: Codable, Hashable, Sendable {
    /// This is a boolean that controls whether to enable strict schema adherence when generating the function call. If set to true, the model will follow the exact schema defined in the parameters field. Only a subset of JSON Schema is supported when strict is true. Learn more about Structured Outputs in the [OpenAI guide](https://openai.com/index/introducing-structured-outputs-in-the-api/).
    /// 
    /// @default false
    public let strict: Bool?
    /// This is the the name of the function to be called.
    /// 
    /// Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
    public let name: String
    /// This is the description of what the function does, used by the AI to choose when and how to call the function.
    public let description: String?
    /// These are the parameters the functions accepts, described as a JSON Schema object.
    /// 
    /// See the [OpenAI guide](https://platform.openai.com/docs/guides/function-calling) for examples, and the [JSON Schema reference](https://json-schema.org/understanding-json-schema) for documentation about the format.
    /// 
    /// Omitting parameters defines a function with an empty parameter list.
    public let parameters: OpenAiFunctionParameters?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        strict: Bool? = nil,
        name: String,
        description: String? = nil,
        parameters: OpenAiFunctionParameters? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.strict = strict
        self.name = name
        self.description = description
        self.parameters = parameters
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.strict = try container.decodeIfPresent(Bool.self, forKey: .strict)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.parameters = try container.decodeIfPresent(OpenAiFunctionParameters.self, forKey: .parameters)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.strict, forKey: .strict)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.parameters, forKey: .parameters)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case strict
        case name
        case description
        case parameters
    }
}
import Foundation

public struct StructuredDataPlan: Codable, Hashable, Sendable {
    /// These are the messages used to generate the structured data.
    /// 
    /// @default: ```
    /// [
    ///   {
    ///     "role": "system",
    ///     "content": "You are an expert data extractor. You will be given a transcript of a call. Extract structured data per the JSON Schema. DO NOT return anything except the structured data.\n\nJson Schema:\\n{{schema}}\n\nOnly respond with the JSON."
    ///   },
    ///   {
    ///     "role": "user",
    ///     "content": "Here is the transcript:\n\n{{transcript}}\n\n. Here is the ended reason of the call:\n\n{{endedReason}}\n\n"
    ///   }
    /// ]```
    /// 
    /// You can customize by providing any messages you want.
    /// 
    /// Here are the template variables available:
    /// - {{transcript}}: the transcript of the call from `call.artifact.transcript`- {{systemPrompt}}: the system prompt of the call from `assistant.model.messages[type=system].content`- {{messages}}: the messages of the call from `assistant.model.messages`- {{schema}}: the schema of the structured data from `structuredDataPlan.schema`- {{endedReason}}: the ended reason of the call from `call.endedReason`
    public let messages: [[String: JSONValue]]?
    /// This determines whether structured data is generated and stored in `call.analysis.structuredData`. Defaults to false.
    /// 
    /// Usage:
    /// - If you want to extract structured data, set this to true and provide a `schema`.
    /// 
    /// @default false
    public let enabled: Bool?
    /// This is the schema of the structured data. The output is stored in `call.analysis.structuredData`.
    /// 
    /// Complete guide on JSON Schema can be found [here](https://ajv.js.org/json-schema.html#json-data-type).
    public let schema: JsonSchema?
    /// This is how long the request is tried before giving up. When request times out, `call.analysis.structuredData` will be empty.
    /// 
    /// Usage:
    /// - To guarantee the structured data is generated, set this value high. Note, this will delay the end of call report in cases where model is slow to respond.
    /// 
    /// @default 5 seconds
    public let timeoutSeconds: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messages: [[String: JSONValue]]? = nil,
        enabled: Bool? = nil,
        schema: JsonSchema? = nil,
        timeoutSeconds: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.enabled = enabled
        self.schema = schema
        self.timeoutSeconds = timeoutSeconds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .messages)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.schema = try container.decodeIfPresent(JsonSchema.self, forKey: .schema)
        self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.schema, forKey: .schema)
        try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case enabled
        case schema
        case timeoutSeconds
    }
}
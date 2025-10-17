import Foundation

public struct CreateApiRequestToolDto: Codable, Hashable, Sendable {
    /// These are the messages that will be spoken to the user as the tool is running.
    /// 
    /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
    public let messages: [CreateApiRequestToolDtoMessagesItem]?
    public let method: CreateApiRequestToolDtoMethod
    /// This is the timeout in seconds for the request. Defaults to 20 seconds.
    /// 
    /// @default 20
    public let timeoutSeconds: Double?
    /// The credential ID for API request authentication
    public let credentialId: String?
    /// This is the name of the tool. This will be passed to the model.
    /// 
    /// Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 40.
    public let name: String?
    /// This is the description of the tool. This will be passed to the model.
    public let description: String?
    /// This is where the request will be sent.
    public let url: String
    /// This is the body of the request.
    public let body: JsonSchema?
    /// These are the headers to send with the request.
    public let headers: JsonSchema?
    /// This is the backoff plan if the request fails. Defaults to undefined (the request will not be retried).
    /// 
    /// @default undefined (the request will not be retried)
    public let backoffPlan: BackoffPlan?
    /// This is the plan to extract variables from the tool's response. These will be accessible during the call and stored in `call.artifact.variableValues` after the call.
    /// 
    /// Usage:
    /// 1. Use `aliases` to extract variables from the tool's response body. (Most common case)
    /// 
    /// ```json
    /// {
    ///   "aliases": [
    ///     {
    ///       "key": "customerName",
    ///       "value": "{{customer.name}}"
    ///     },
    ///     {
    ///       "key": "customerAge",
    ///       "value": "{{customer.age}}"
    ///     }
    ///   ]
    /// }
    /// ```
    /// 
    /// The tool response body is made available to the liquid template.
    /// 
    /// 2. Use `aliases` to extract variables from the tool's response body if the response is an array.
    /// 
    /// ```json
    /// {
    ///   "aliases": [
    ///     {
    ///       "key": "customerName",
    ///       "value": "{{$[0].name}}"
    ///     },
    ///     {
    ///       "key": "customerAge",
    ///       "value": "{{$[0].age}}"
    ///     }
    ///   ]
    /// }
    /// ```
    /// 
    /// $ is a shorthand for the tool's response body. `$[0]` is the first item in the array. `$[n]` is the nth item in the array. Note, $ is available regardless of the response body type (both object and array).
    /// 
    /// 3. Use `aliases` to extract variables from the tool's response headers.
    /// 
    /// ```json
    /// {
    ///   "aliases": [
    ///     {
    ///       "key": "customerName",
    ///       "value": "{{tool.response.headers.customer-name}}"
    ///     },
    ///     {
    ///       "key": "customerAge",
    ///       "value": "{{tool.response.headers.customer-age}}"
    ///     }
    ///   ]
    /// }
    /// ```
    /// 
    /// `tool.response` is made available to the liquid template. Particularly, both `tool.response.headers` and `tool.response.body` are available. Note, `tool.response` is available regardless of the response body type (both object and array).
    /// 
    /// 4. Use `schema` to extract a large portion of the tool's response body.
    /// 
    /// 4.1. If you hit example.com and it returns `{"name": "John", "age": 30}`, then you can specify the schema as:
    /// 
    /// ```json
    /// {
    ///   "schema": {
    ///     "type": "object",
    ///     "properties": {
    ///       "name": {
    ///         "type": "string"
    ///       },
    ///       "age": {
    ///         "type": "number"
    ///       }
    ///     }
    ///   }
    /// }
    /// ```
    /// These will be extracted as `{{ name }}` and `{{ age }}` respectively. To emphasize, object properties are extracted as direct global variables.
    /// 
    /// 4.2. If you hit example.com and it returns `{"name": {"first": "John", "last": "Doe"}}`, then you can specify the schema as:
    /// 
    /// ```json
    /// {
    ///   "schema": {
    ///     "type": "object",
    ///     "properties": {
    ///       "name": {
    ///         "type": "object",
    ///         "properties": {
    ///           "first": {
    ///             "type": "string"
    ///           },
    ///           "last": {
    ///             "type": "string"
    ///           }
    ///         }
    ///       }
    ///     }
    ///   }
    /// }
    /// ```
    /// 
    /// These will be extracted as `{{ name }}`. And, `{{ name.first }}` and `{{ name.last }}` will be accessible.
    /// 
    /// 4.3. If you hit example.com and it returns `["94123", "94124"]`, then you can specify the schema as:
    /// 
    /// ```json
    /// {
    ///   "schema": {
    ///     "type": "array",
    ///     "title": "zipCodes",
    ///     "items": {
    ///       "type": "string"
    ///     }
    ///   }
    /// }
    /// ```
    /// 
    /// This will be extracted as `{{ zipCodes }}`. To access the array items, you can use `{{ zipCodes[0] }}` and `{{ zipCodes[1] }}`.
    /// 
    /// 4.4. If you hit example.com and it returns `[{"name": "John", "age": 30, "zipCodes": ["94123", "94124"]}, {"name": "Jane", "age": 25, "zipCodes": ["94125", "94126"]}]`, then you can specify the schema as:
    /// 
    /// ```json
    /// {
    ///   "schema": {
    ///     "type": "array",
    ///     "title": "people",
    ///     "items": {
    ///       "type": "object",
    ///       "properties": {
    ///         "name": {
    ///           "type": "string"
    ///         },
    ///         "age": {
    ///           "type": "number"
    ///         },
    ///         "zipCodes": {
    ///           "type": "array",
    ///           "items": {
    ///             "type": "string"
    ///           }
    ///         }
    ///       }
    ///     }
    ///   }
    /// }
    /// ```
    /// 
    /// This will be extracted as `{{ people }}`. To access the array items, you can use `{{ people[n].name }}`, `{{ people[n].age }}`, `{{ people[n].zipCodes }}`, `{{ people[n].zipCodes[0] }}` and `{{ people[n].zipCodes[1] }}`.
    /// 
    /// Note: Both `aliases` and `schema` can be used together.
    public let variableExtractionPlan: VariableExtractionPlan?
    /// This is the plan to reject a tool call based on the conversation state.
    /// 
    /// // Example 1: Reject endCall if user didn't say goodbye
    /// ```json
    /// {
    ///   conditions: [{
    ///     type: 'regex',
    ///     regex: '(?i)\\b(bye|goodbye|farewell|see you later|take care)\\b',
    ///     target: { position: -1, role: 'user' },
    ///     negate: true  // Reject if pattern does NOT match
    ///   }]
    /// }
    /// ```
    /// 
    /// // Example 2: Reject transfer if user is actually asking a question
    /// ```json
    /// {
    ///   conditions: [{
    ///     type: 'regex',
    ///     regex: '\\?',
    ///     target: { position: -1, role: 'user' }
    ///   }]
    /// }
    /// ```
    /// 
    /// // Example 3: Reject transfer if user didn't mention transfer recently
    /// ```json
    /// {
    ///   conditions: [{
    ///     type: 'liquid',
    ///     liquid: `{% assign recentMessages = messages | last: 5 %}
    /// {% assign userMessages = recentMessages | where: 'role', 'user' %}
    /// {% assign mentioned = false %}
    /// {% for msg in userMessages %}
    ///   {% if msg.content contains 'transfer' or msg.content contains 'connect' or msg.content contains 'speak to' %}
    ///     {% assign mentioned = true %}
    ///     {% break %}
    ///   {% endif %}
    /// {% endfor %}
    /// {% if mentioned %}
    ///   false
    /// {% else %}
    ///   true
    /// {% endif %}`
    ///   }]
    /// }
    /// ```
    /// 
    /// // Example 4: Reject endCall if the bot is looping and trying to exit
    /// ```json
    /// {
    ///   conditions: [{
    ///     type: 'liquid',
    ///     liquid: `{% assign recentMessages = messages | last: 6 %}
    /// {% assign userMessages = recentMessages | where: 'role', 'user' | reverse %}
    /// {% if userMessages.size < 3 %}
    ///   false
    /// {% else %}
    ///   {% assign msg1 = userMessages[0].content | downcase %}
    ///   {% assign msg2 = userMessages[1].content | downcase %}
    ///   {% assign msg3 = userMessages[2].content | downcase %}
    ///   {% comment %} Check for repetitive messages {% endcomment %}
    ///   {% if msg1 == msg2 or msg1 == msg3 or msg2 == msg3 %}
    ///     true
    ///   {% comment %} Check for common loop phrases {% endcomment %}
    ///   {% elsif msg1 contains 'cool thanks' or msg2 contains 'cool thanks' or msg3 contains 'cool thanks' %}
    ///     true
    ///   {% elsif msg1 contains 'okay thanks' or msg2 contains 'okay thanks' or msg3 contains 'okay thanks' %}
    ///     true
    ///   {% elsif msg1 contains 'got it' or msg2 contains 'got it' or msg3 contains 'got it' %}
    ///     true
    ///   {% else %}
    ///     false
    ///   {% endif %}
    /// {% endif %}`
    ///   }]
    /// }
    /// ```
    public let rejectionPlan: ToolRejectionPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messages: [CreateApiRequestToolDtoMessagesItem]? = nil,
        method: CreateApiRequestToolDtoMethod,
        timeoutSeconds: Double? = nil,
        credentialId: String? = nil,
        name: String? = nil,
        description: String? = nil,
        url: String,
        body: JsonSchema? = nil,
        headers: JsonSchema? = nil,
        backoffPlan: BackoffPlan? = nil,
        variableExtractionPlan: VariableExtractionPlan? = nil,
        rejectionPlan: ToolRejectionPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.method = method
        self.timeoutSeconds = timeoutSeconds
        self.credentialId = credentialId
        self.name = name
        self.description = description
        self.url = url
        self.body = body
        self.headers = headers
        self.backoffPlan = backoffPlan
        self.variableExtractionPlan = variableExtractionPlan
        self.rejectionPlan = rejectionPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decodeIfPresent([CreateApiRequestToolDtoMessagesItem].self, forKey: .messages)
        self.method = try container.decode(CreateApiRequestToolDtoMethod.self, forKey: .method)
        self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
        self.credentialId = try container.decodeIfPresent(String.self, forKey: .credentialId)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.url = try container.decode(String.self, forKey: .url)
        self.body = try container.decodeIfPresent(JsonSchema.self, forKey: .body)
        self.headers = try container.decodeIfPresent(JsonSchema.self, forKey: .headers)
        self.backoffPlan = try container.decodeIfPresent(BackoffPlan.self, forKey: .backoffPlan)
        self.variableExtractionPlan = try container.decodeIfPresent(VariableExtractionPlan.self, forKey: .variableExtractionPlan)
        self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encode(self.method, forKey: .method)
        try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
        try container.encodeIfPresent(self.credentialId, forKey: .credentialId)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.url, forKey: .url)
        try container.encodeIfPresent(self.body, forKey: .body)
        try container.encodeIfPresent(self.headers, forKey: .headers)
        try container.encodeIfPresent(self.backoffPlan, forKey: .backoffPlan)
        try container.encodeIfPresent(self.variableExtractionPlan, forKey: .variableExtractionPlan)
        try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case method
        case timeoutSeconds
        case credentialId
        case name
        case description
        case url
        case body
        case headers
        case backoffPlan
        case variableExtractionPlan
        case rejectionPlan
    }
}
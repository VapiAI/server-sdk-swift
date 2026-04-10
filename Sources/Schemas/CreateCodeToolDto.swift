import Foundation

public struct CreateCodeToolDto: Codable, Hashable, Sendable {
    /// These are the messages that will be spoken to the user as the tool is running.
    /// 
    /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
    public let messages: [CreateCodeToolDtoMessagesItem]?
    /// This determines if the tool is async.
    /// 
    ///   If async, the assistant will move forward without waiting for your server to respond. This is useful if you just want to trigger something on your server.
    /// 
    ///   If sync, the assistant will wait for your server to respond. This is useful if want assistant to respond with the result from your server.
    /// 
    ///   Defaults to synchronous (`false`).
    public let async: Bool?
    /// 
    ///   This is the server where a `tool-calls` webhook will be sent.
    /// 
    ///   Notes:
    ///   - Webhook is sent to this server when a tool call is made.
    ///   - Webhook contains the call, assistant, and phone number objects.
    ///   - Webhook contains the variables set on the assistant.
    ///   - Webhook is sent to the first available URL in this order: {{tool.server.url}}, {{assistant.server.url}}, {{phoneNumber.server.url}}, {{org.server.url}}.
    ///   - Webhook expects a response with tool call result.
    public let server: Server?
    /// TypeScript code to execute when the tool is called
    public let code: String
    /// Environment variables available in code via `env` object
    public let environmentVariables: [CodeToolEnvironmentVariable]?
    /// This is the timeout in seconds for the code execution. Defaults to 10 seconds.
    /// Maximum is 30 seconds to prevent abuse.
    /// 
    /// @default 10
    public let timeoutSeconds: Double?
    /// Credential ID containing the Val Town API key
    public let credentialId: String?
    /// Plan to extract variables from the tool response
    public let variableExtractionPlan: VariableExtractionPlan?
    /// This is the function definition of the tool.
    /// 
    /// For the Code tool, this defines the name, description, and parameters that the model
    /// will use to understand when and how to call this tool.
    public let function: OpenAiFunction?
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
        messages: [CreateCodeToolDtoMessagesItem]? = nil,
        async: Bool? = nil,
        server: Server? = nil,
        code: String,
        environmentVariables: [CodeToolEnvironmentVariable]? = nil,
        timeoutSeconds: Double? = nil,
        credentialId: String? = nil,
        variableExtractionPlan: VariableExtractionPlan? = nil,
        function: OpenAiFunction? = nil,
        rejectionPlan: ToolRejectionPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.async = async
        self.server = server
        self.code = code
        self.environmentVariables = environmentVariables
        self.timeoutSeconds = timeoutSeconds
        self.credentialId = credentialId
        self.variableExtractionPlan = variableExtractionPlan
        self.function = function
        self.rejectionPlan = rejectionPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decodeIfPresent([CreateCodeToolDtoMessagesItem].self, forKey: .messages)
        self.async = try container.decodeIfPresent(Bool.self, forKey: .async)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.code = try container.decode(String.self, forKey: .code)
        self.environmentVariables = try container.decodeIfPresent([CodeToolEnvironmentVariable].self, forKey: .environmentVariables)
        self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
        self.credentialId = try container.decodeIfPresent(String.self, forKey: .credentialId)
        self.variableExtractionPlan = try container.decodeIfPresent(VariableExtractionPlan.self, forKey: .variableExtractionPlan)
        self.function = try container.decodeIfPresent(OpenAiFunction.self, forKey: .function)
        self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.async, forKey: .async)
        try container.encodeIfPresent(self.server, forKey: .server)
        try container.encode(self.code, forKey: .code)
        try container.encodeIfPresent(self.environmentVariables, forKey: .environmentVariables)
        try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
        try container.encodeIfPresent(self.credentialId, forKey: .credentialId)
        try container.encodeIfPresent(self.variableExtractionPlan, forKey: .variableExtractionPlan)
        try container.encodeIfPresent(self.function, forKey: .function)
        try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case async
        case server
        case code
        case environmentVariables
        case timeoutSeconds
        case credentialId
        case variableExtractionPlan
        case function
        case rejectionPlan
    }
}
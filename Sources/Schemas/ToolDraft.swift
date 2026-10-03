import Foundation

public struct ToolDraft: Codable, Hashable, Sendable {
    /// Messages spoken while the tool is running. Multiple request-start messages are variants. For request-response-delayed, same timing means variants and different timings mean staged updates.
    public let messages: [ToolDraftMessagesItem]?
    /// This is the type of the tool.
    public let type: ToolDraftType?
    /// Key used as `draftId` in URLs.
    public let id: String
    /// This is the unique identifier for the org that owns this draft.
    public let orgId: String
    /// This is the unique identifier for the tool this draft was forked from.
    /// Intentionally NOT a FK — `tool_draft` mirrors `tool_version` / `version_pin`'s
    /// no-FK / app-cleanup philosophy, so there is no `ON DELETE CASCADE`. Drafts
    /// must be cleaned up explicitly (`toolDraftDelete({ orgId, toolId })`) on a
    /// parent tool hard-delete; nothing reaps them automatically.
    public let toolId: String
    /// The published version this draft was forked from. Server defaults to
    /// `tool.latestVersion` on POST if omitted. Immutable for the draft's lifetime.
    public let baseVersion: String
    /// Email when JWT, null when API or external JWT. Set on POST, never rewritten on PATCH.
    public let createdBy: Nullable<String>?
    /// This is the ISO 8601 date-time string of when the draft was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the draft was last updated.
    public let updatedAt: Date
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
    /// This is the function definition of the tool.
    public let function: OpenAiFunction?
    /// Provider-specific metadata. Polymorphic across tool variants with no shared
    /// discriminator, so it is validated as a plain object (mirrors how
    /// `ToolCallResult.metadata` is typed).
    public let metadata: [String: JSONValue]?
    /// This is the unique identifier for the template this tool was created from.
    public let templateId: String?
    public let server: Server?
    public let async: Bool?
    /// These are the destinations that the call can be transferred to.
    public let destinations: [[String: JSONValue]]?
    /// This is the name of the tool. This will be passed to the model.
    public let name: String?
    /// This is the sub type of the tool (e.g. for computer, bash and text-editor tools).
    public let subType: String?
    /// The display width in pixels (computer tool).
    public let displayWidthPx: Double?
    /// The display height in pixels (computer tool).
    public let displayHeightPx: Double?
    /// Optional display number (computer tool).
    public let displayNumber: Double?
    /// The knowledge bases to query (query tool).
    public let knowledgeBases: [KnowledgeBase]?
    /// This is where the request will be sent (api-request tool).
    public let url: String?
    /// This is the HTTP method for the request (api-request tool).
    public let method: ToolDraftMethod?
    /// These are the headers to send with the request (api-request / sip-request tool).
    public let headers: JsonSchema?
    /// This is the body of the request. Either a JSON schema (api-request) or a
    /// literal string / schema (sip-request).
    public let body: [String: JSONValue]?
    /// This is the backoff plan if the request fails.
    public let backoffPlan: BackoffPlan?
    /// This is the timeout in seconds for the request.
    public let timeoutSeconds: Double?
    /// This is the description of the tool. This will be passed to the model.
    public let description: String?
    /// This is the plan to extract variables from the tool's response.
    public let variableExtractionPlan: VariableExtractionPlan?
    /// This is the credential ID that will be used for authorization.
    public let credentialId: String?
    public let extendedDelayWhenPrecededByTextEnabled: Bool?
    public let beepDetectionEnabled: Bool?
    /// This is the TypeScript code that will be executed when the tool is called (code tool).
    public let code: String?
    /// These are the environment variables available in the code via the `env` object (code tool).
    public let environmentVariables: [CodeToolEnvironmentVariable]?
    /// These are the static parameters to merge into the tool's request body.
    public let parameters: [ToolParameter]?
    /// This is the paths to encrypt in the request body.
    public let encryptedPaths: [String]?
    /// This enables sending DTMF tones via SIP INFO messages instead of RFC 2833.
    public let sipInfoDtmfEnabled: Bool?
    /// This is the SIP method to send (sip-request tool).
    public let verb: ToolDraftVerb?
    /// This is the default local tool result message used when no runtime override is returned (handoff tool).
    public let defaultResult: String?
    /// Per-tool message overrides for individual tools loaded from the MCP server (mcp tool).
    public let toolMessages: [McpToolMessages]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messages: [ToolDraftMessagesItem]? = nil,
        type: ToolDraftType? = nil,
        id: String,
        orgId: String,
        toolId: String,
        baseVersion: String,
        createdBy: Nullable<String>? = nil,
        createdAt: Date,
        updatedAt: Date,
        rejectionPlan: ToolRejectionPlan? = nil,
        function: OpenAiFunction? = nil,
        metadata: [String: JSONValue]? = nil,
        templateId: String? = nil,
        server: Server? = nil,
        async: Bool? = nil,
        destinations: [[String: JSONValue]]? = nil,
        name: String? = nil,
        subType: String? = nil,
        displayWidthPx: Double? = nil,
        displayHeightPx: Double? = nil,
        displayNumber: Double? = nil,
        knowledgeBases: [KnowledgeBase]? = nil,
        url: String? = nil,
        method: ToolDraftMethod? = nil,
        headers: JsonSchema? = nil,
        body: [String: JSONValue]? = nil,
        backoffPlan: BackoffPlan? = nil,
        timeoutSeconds: Double? = nil,
        description: String? = nil,
        variableExtractionPlan: VariableExtractionPlan? = nil,
        credentialId: String? = nil,
        extendedDelayWhenPrecededByTextEnabled: Bool? = nil,
        beepDetectionEnabled: Bool? = nil,
        code: String? = nil,
        environmentVariables: [CodeToolEnvironmentVariable]? = nil,
        parameters: [ToolParameter]? = nil,
        encryptedPaths: [String]? = nil,
        sipInfoDtmfEnabled: Bool? = nil,
        verb: ToolDraftVerb? = nil,
        defaultResult: String? = nil,
        toolMessages: [McpToolMessages]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.type = type
        self.id = id
        self.orgId = orgId
        self.toolId = toolId
        self.baseVersion = baseVersion
        self.createdBy = createdBy
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.rejectionPlan = rejectionPlan
        self.function = function
        self.metadata = metadata
        self.templateId = templateId
        self.server = server
        self.async = async
        self.destinations = destinations
        self.name = name
        self.subType = subType
        self.displayWidthPx = displayWidthPx
        self.displayHeightPx = displayHeightPx
        self.displayNumber = displayNumber
        self.knowledgeBases = knowledgeBases
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
        self.backoffPlan = backoffPlan
        self.timeoutSeconds = timeoutSeconds
        self.description = description
        self.variableExtractionPlan = variableExtractionPlan
        self.credentialId = credentialId
        self.extendedDelayWhenPrecededByTextEnabled = extendedDelayWhenPrecededByTextEnabled
        self.beepDetectionEnabled = beepDetectionEnabled
        self.code = code
        self.environmentVariables = environmentVariables
        self.parameters = parameters
        self.encryptedPaths = encryptedPaths
        self.sipInfoDtmfEnabled = sipInfoDtmfEnabled
        self.verb = verb
        self.defaultResult = defaultResult
        self.toolMessages = toolMessages
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decodeIfPresent([ToolDraftMessagesItem].self, forKey: .messages)
        self.type = try container.decodeIfPresent(ToolDraftType.self, forKey: .type)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.toolId = try container.decode(String.self, forKey: .toolId)
        self.baseVersion = try container.decode(String.self, forKey: .baseVersion)
        self.createdBy = try container.decodeNullableIfPresent(String.self, forKey: .createdBy)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
        self.function = try container.decodeIfPresent(OpenAiFunction.self, forKey: .function)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.templateId = try container.decodeIfPresent(String.self, forKey: .templateId)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.async = try container.decodeIfPresent(Bool.self, forKey: .async)
        self.destinations = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .destinations)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.subType = try container.decodeIfPresent(String.self, forKey: .subType)
        self.displayWidthPx = try container.decodeIfPresent(Double.self, forKey: .displayWidthPx)
        self.displayHeightPx = try container.decodeIfPresent(Double.self, forKey: .displayHeightPx)
        self.displayNumber = try container.decodeIfPresent(Double.self, forKey: .displayNumber)
        self.knowledgeBases = try container.decodeIfPresent([KnowledgeBase].self, forKey: .knowledgeBases)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.method = try container.decodeIfPresent(ToolDraftMethod.self, forKey: .method)
        self.headers = try container.decodeIfPresent(JsonSchema.self, forKey: .headers)
        self.body = try container.decodeIfPresent([String: JSONValue].self, forKey: .body)
        self.backoffPlan = try container.decodeIfPresent(BackoffPlan.self, forKey: .backoffPlan)
        self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.variableExtractionPlan = try container.decodeIfPresent(VariableExtractionPlan.self, forKey: .variableExtractionPlan)
        self.credentialId = try container.decodeIfPresent(String.self, forKey: .credentialId)
        self.extendedDelayWhenPrecededByTextEnabled = try container.decodeIfPresent(Bool.self, forKey: .extendedDelayWhenPrecededByTextEnabled)
        self.beepDetectionEnabled = try container.decodeIfPresent(Bool.self, forKey: .beepDetectionEnabled)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.environmentVariables = try container.decodeIfPresent([CodeToolEnvironmentVariable].self, forKey: .environmentVariables)
        self.parameters = try container.decodeIfPresent([ToolParameter].self, forKey: .parameters)
        self.encryptedPaths = try container.decodeIfPresent([String].self, forKey: .encryptedPaths)
        self.sipInfoDtmfEnabled = try container.decodeIfPresent(Bool.self, forKey: .sipInfoDtmfEnabled)
        self.verb = try container.decodeIfPresent(ToolDraftVerb.self, forKey: .verb)
        self.defaultResult = try container.decodeIfPresent(String.self, forKey: .defaultResult)
        self.toolMessages = try container.decodeIfPresent([McpToolMessages].self, forKey: .toolMessages)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.toolId, forKey: .toolId)
        try container.encode(self.baseVersion, forKey: .baseVersion)
        try container.encodeNullableIfPresent(self.createdBy, forKey: .createdBy)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        try container.encodeIfPresent(self.function, forKey: .function)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.templateId, forKey: .templateId)
        try container.encodeIfPresent(self.server, forKey: .server)
        try container.encodeIfPresent(self.async, forKey: .async)
        try container.encodeIfPresent(self.destinations, forKey: .destinations)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.subType, forKey: .subType)
        try container.encodeIfPresent(self.displayWidthPx, forKey: .displayWidthPx)
        try container.encodeIfPresent(self.displayHeightPx, forKey: .displayHeightPx)
        try container.encodeIfPresent(self.displayNumber, forKey: .displayNumber)
        try container.encodeIfPresent(self.knowledgeBases, forKey: .knowledgeBases)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encodeIfPresent(self.headers, forKey: .headers)
        try container.encodeIfPresent(self.body, forKey: .body)
        try container.encodeIfPresent(self.backoffPlan, forKey: .backoffPlan)
        try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.variableExtractionPlan, forKey: .variableExtractionPlan)
        try container.encodeIfPresent(self.credentialId, forKey: .credentialId)
        try container.encodeIfPresent(self.extendedDelayWhenPrecededByTextEnabled, forKey: .extendedDelayWhenPrecededByTextEnabled)
        try container.encodeIfPresent(self.beepDetectionEnabled, forKey: .beepDetectionEnabled)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.environmentVariables, forKey: .environmentVariables)
        try container.encodeIfPresent(self.parameters, forKey: .parameters)
        try container.encodeIfPresent(self.encryptedPaths, forKey: .encryptedPaths)
        try container.encodeIfPresent(self.sipInfoDtmfEnabled, forKey: .sipInfoDtmfEnabled)
        try container.encodeIfPresent(self.verb, forKey: .verb)
        try container.encodeIfPresent(self.defaultResult, forKey: .defaultResult)
        try container.encodeIfPresent(self.toolMessages, forKey: .toolMessages)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case type
        case id
        case orgId
        case toolId
        case baseVersion
        case createdBy
        case createdAt
        case updatedAt
        case rejectionPlan
        case function
        case metadata
        case templateId
        case server
        case async
        case destinations
        case name
        case subType
        case displayWidthPx
        case displayHeightPx
        case displayNumber
        case knowledgeBases
        case url
        case method
        case headers
        case body
        case backoffPlan
        case timeoutSeconds
        case description
        case variableExtractionPlan
        case credentialId
        case extendedDelayWhenPrecededByTextEnabled
        case beepDetectionEnabled
        case code
        case environmentVariables
        case parameters
        case encryptedPaths
        case sipInfoDtmfEnabled
        case verb
        case defaultResult
        case toolMessages
    }
}
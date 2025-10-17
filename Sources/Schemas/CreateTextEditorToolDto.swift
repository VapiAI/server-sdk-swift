import Foundation

public struct CreateTextEditorToolDto: Codable, Hashable, Sendable {
    /// These are the messages that will be spoken to the user as the tool is running.
    /// 
    /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
    public let messages: [CreateTextEditorToolDtoMessagesItem]?
    /// The sub type of tool.
    public let subType: TextEditor20241022
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
    /// The name of the tool, fixed to 'str_replace_editor'
    public let name: StrReplaceEditor
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
        messages: [CreateTextEditorToolDtoMessagesItem]? = nil,
        subType: TextEditor20241022,
        server: Server? = nil,
        name: StrReplaceEditor,
        rejectionPlan: ToolRejectionPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.subType = subType
        self.server = server
        self.name = name
        self.rejectionPlan = rejectionPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decodeIfPresent([CreateTextEditorToolDtoMessagesItem].self, forKey: .messages)
        self.subType = try container.decode(TextEditor20241022.self, forKey: .subType)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.name = try container.decode(StrReplaceEditor.self, forKey: .name)
        self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encode(self.subType, forKey: .subType)
        try container.encodeIfPresent(self.server, forKey: .server)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
    }

    public enum TextEditor20241022: String, Codable, Hashable, CaseIterable, Sendable {
        case textEditor20241022 = "text_editor_20241022"
    }

    public enum StrReplaceEditor: String, Codable, Hashable, CaseIterable, Sendable {
        case strReplaceEditor = "str_replace_editor"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case subType
        case server
        case name
        case rejectionPlan
    }
}
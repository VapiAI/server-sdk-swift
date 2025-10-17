import Foundation

public enum ClientMessageToolCallsToolWithToolCallListItem: Codable, Hashable, Sendable {
    case function(Function)
    case ghl(Ghl)
    case make(Make)
    case bash(Bash)
    case computer(Computer)
    case textEditor(TextEditor)
    case googleCalendarEventCreate(GoogleCalendarEventCreate)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "function":
            self = .function(try Function(from: decoder))
        case "ghl":
            self = .ghl(try Ghl(from: decoder))
        case "make":
            self = .make(try Make(from: decoder))
        case "bash":
            self = .bash(try Bash(from: decoder))
        case "computer":
            self = .computer(try Computer(from: decoder))
        case "textEditor":
            self = .textEditor(try TextEditor(from: decoder))
        case "google.calendar.event.create":
            self = .googleCalendarEventCreate(try GoogleCalendarEventCreate(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        switch self {
        case .function(let data):
            try data.encode(to: encoder)
        case .ghl(let data):
            try data.encode(to: encoder)
        case .make(let data):
            try data.encode(to: encoder)
        case .bash(let data):
            try data.encode(to: encoder)
        case .computer(let data):
            try data.encode(to: encoder)
        case .textEditor(let data):
            try data.encode(to: encoder)
        case .googleCalendarEventCreate(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Function: Codable, Hashable, Sendable {
        public let type: String = "function"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [FunctionToolWithToolCallMessagesItem]?
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
        public let toolCall: ToolCall
        /// This is the function definition of the tool.
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
            messages: [FunctionToolWithToolCallMessagesItem]? = nil,
            async: Bool? = nil,
            server: Server? = nil,
            toolCall: ToolCall,
            function: OpenAiFunction? = nil,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.async = async
            self.server = server
            self.toolCall = toolCall
            self.function = function
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([FunctionToolWithToolCallMessagesItem].self, forKey: .messages)
            self.async = try container.decodeIfPresent(Bool.self, forKey: .async)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.toolCall = try container.decode(ToolCall.self, forKey: .toolCall)
            self.function = try container.decodeIfPresent(OpenAiFunction.self, forKey: .function)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.async, forKey: .async)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encode(self.toolCall, forKey: .toolCall)
            try container.encodeIfPresent(self.function, forKey: .function)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case async
            case server
            case toolCall
            case function
            case rejectionPlan
        }
    }

    public struct Ghl: Codable, Hashable, Sendable {
        public let type: String = "ghl"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [GhlToolWithToolCallMessagesItem]?
        public let toolCall: ToolCall
        public let metadata: GhlToolMetadata
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
            messages: [GhlToolWithToolCallMessagesItem]? = nil,
            toolCall: ToolCall,
            metadata: GhlToolMetadata,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.toolCall = toolCall
            self.metadata = metadata
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([GhlToolWithToolCallMessagesItem].self, forKey: .messages)
            self.toolCall = try container.decode(ToolCall.self, forKey: .toolCall)
            self.metadata = try container.decode(GhlToolMetadata.self, forKey: .metadata)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.toolCall, forKey: .toolCall)
            try container.encode(self.metadata, forKey: .metadata)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case toolCall
            case metadata
            case rejectionPlan
        }
    }

    public struct Make: Codable, Hashable, Sendable {
        public let type: String = "make"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [MakeToolWithToolCallMessagesItem]?
        public let toolCall: ToolCall
        public let metadata: MakeToolMetadata
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
            messages: [MakeToolWithToolCallMessagesItem]? = nil,
            toolCall: ToolCall,
            metadata: MakeToolMetadata,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.toolCall = toolCall
            self.metadata = metadata
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([MakeToolWithToolCallMessagesItem].self, forKey: .messages)
            self.toolCall = try container.decode(ToolCall.self, forKey: .toolCall)
            self.metadata = try container.decode(MakeToolMetadata.self, forKey: .metadata)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.toolCall, forKey: .toolCall)
            try container.encode(self.metadata, forKey: .metadata)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case toolCall
            case metadata
            case rejectionPlan
        }
    }

    public struct Bash: Codable, Hashable, Sendable {
        public let type: String = "bash"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [BashToolWithToolCallMessagesItem]?
        /// The sub type of tool.
        public let subType: Bash20241022
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
        public let toolCall: ToolCall
        /// The name of the tool, fixed to 'bash'
        public let name: Bash
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
            messages: [BashToolWithToolCallMessagesItem]? = nil,
            subType: Bash20241022,
            server: Server? = nil,
            toolCall: ToolCall,
            name: Bash,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.subType = subType
            self.server = server
            self.toolCall = toolCall
            self.name = name
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([BashToolWithToolCallMessagesItem].self, forKey: .messages)
            self.subType = try container.decode(Bash20241022.self, forKey: .subType)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.toolCall = try container.decode(ToolCall.self, forKey: .toolCall)
            self.name = try container.decode(Bash.self, forKey: .name)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.subType, forKey: .subType)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encode(self.toolCall, forKey: .toolCall)
            try container.encode(self.name, forKey: .name)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        public enum Bash20241022: String, Codable, Hashable, CaseIterable, Sendable {
            case bash20241022 = "bash_20241022"
        }

        public enum Bash: String, Codable, Hashable, CaseIterable, Sendable {
            case bash
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case subType
            case server
            case toolCall
            case name
            case rejectionPlan
        }
    }

    public struct Computer: Codable, Hashable, Sendable {
        public let type: String = "computer"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [ComputerToolWithToolCallMessagesItem]?
        /// The sub type of tool.
        public let subType: Computer20241022
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
        public let toolCall: ToolCall
        /// The name of the tool, fixed to 'computer'
        public let name: Computer
        /// The display width in pixels
        public let displayWidthPx: Double
        /// The display height in pixels
        public let displayHeightPx: Double
        /// Optional display number
        public let displayNumber: Double?
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
            messages: [ComputerToolWithToolCallMessagesItem]? = nil,
            subType: Computer20241022,
            server: Server? = nil,
            toolCall: ToolCall,
            name: Computer,
            displayWidthPx: Double,
            displayHeightPx: Double,
            displayNumber: Double? = nil,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.subType = subType
            self.server = server
            self.toolCall = toolCall
            self.name = name
            self.displayWidthPx = displayWidthPx
            self.displayHeightPx = displayHeightPx
            self.displayNumber = displayNumber
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([ComputerToolWithToolCallMessagesItem].self, forKey: .messages)
            self.subType = try container.decode(Computer20241022.self, forKey: .subType)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.toolCall = try container.decode(ToolCall.self, forKey: .toolCall)
            self.name = try container.decode(Computer.self, forKey: .name)
            self.displayWidthPx = try container.decode(Double.self, forKey: .displayWidthPx)
            self.displayHeightPx = try container.decode(Double.self, forKey: .displayHeightPx)
            self.displayNumber = try container.decodeIfPresent(Double.self, forKey: .displayNumber)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.subType, forKey: .subType)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encode(self.toolCall, forKey: .toolCall)
            try container.encode(self.name, forKey: .name)
            try container.encode(self.displayWidthPx, forKey: .displayWidthPx)
            try container.encode(self.displayHeightPx, forKey: .displayHeightPx)
            try container.encodeIfPresent(self.displayNumber, forKey: .displayNumber)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        public enum Computer20241022: String, Codable, Hashable, CaseIterable, Sendable {
            case computer20241022 = "computer_20241022"
        }

        public enum Computer: String, Codable, Hashable, CaseIterable, Sendable {
            case computer
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case subType
            case server
            case toolCall
            case name
            case displayWidthPx
            case displayHeightPx
            case displayNumber
            case rejectionPlan
        }
    }

    public struct TextEditor: Codable, Hashable, Sendable {
        public let type: String = "textEditor"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [TextEditorToolWithToolCallMessagesItem]?
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
        public let toolCall: ToolCall
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
            messages: [TextEditorToolWithToolCallMessagesItem]? = nil,
            subType: TextEditor20241022,
            server: Server? = nil,
            toolCall: ToolCall,
            name: StrReplaceEditor,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.subType = subType
            self.server = server
            self.toolCall = toolCall
            self.name = name
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([TextEditorToolWithToolCallMessagesItem].self, forKey: .messages)
            self.subType = try container.decode(TextEditor20241022.self, forKey: .subType)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.toolCall = try container.decode(ToolCall.self, forKey: .toolCall)
            self.name = try container.decode(StrReplaceEditor.self, forKey: .name)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.subType, forKey: .subType)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encode(self.toolCall, forKey: .toolCall)
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
            case type
            case messages
            case subType
            case server
            case toolCall
            case name
            case rejectionPlan
        }
    }

    public struct GoogleCalendarEventCreate: Codable, Hashable, Sendable {
        public let type: String = "google.calendar.event.create"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [GoogleCalendarCreateEventToolWithToolCallMessagesItem]?
        public let toolCall: ToolCall
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
            messages: [GoogleCalendarCreateEventToolWithToolCallMessagesItem]? = nil,
            toolCall: ToolCall,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.toolCall = toolCall
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([GoogleCalendarCreateEventToolWithToolCallMessagesItem].self, forKey: .messages)
            self.toolCall = try container.decode(ToolCall.self, forKey: .toolCall)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.toolCall, forKey: .toolCall)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case toolCall
            case rejectionPlan
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
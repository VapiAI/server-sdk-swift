import Foundation

public enum ToolsGetResponse: Codable, Hashable, Sendable {
    case apiRequest(ApiRequest)
    case dtmf(Dtmf)
    case endCall(EndCall)
    case function(Function)
    case transferCall(TransferCall)
    case handoff(Handoff)
    case bash(Bash)
    case computer(Computer)
    case textEditor(TextEditor)
    case query(Query)
    case googleCalendarEventCreate(GoogleCalendarEventCreate)
    case googleSheetsRowAppend(GoogleSheetsRowAppend)
    case googleCalendarAvailabilityCheck(GoogleCalendarAvailabilityCheck)
    case slackMessageSend(SlackMessageSend)
    case sms(Sms)
    case mcp(Mcp)
    case gohighlevelCalendarAvailabilityCheck(GohighlevelCalendarAvailabilityCheck)
    case gohighlevelCalendarEventCreate(GohighlevelCalendarEventCreate)
    case gohighlevelContactCreate(GohighlevelContactCreate)
    case gohighlevelContactGet(GohighlevelContactGet)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "apiRequest":
            self = .apiRequest(try ApiRequest(from: decoder))
        case "dtmf":
            self = .dtmf(try Dtmf(from: decoder))
        case "endCall":
            self = .endCall(try EndCall(from: decoder))
        case "function":
            self = .function(try Function(from: decoder))
        case "transferCall":
            self = .transferCall(try TransferCall(from: decoder))
        case "handoff":
            self = .handoff(try Handoff(from: decoder))
        case "bash":
            self = .bash(try Bash(from: decoder))
        case "computer":
            self = .computer(try Computer(from: decoder))
        case "textEditor":
            self = .textEditor(try TextEditor(from: decoder))
        case "query":
            self = .query(try Query(from: decoder))
        case "google.calendar.event.create":
            self = .googleCalendarEventCreate(try GoogleCalendarEventCreate(from: decoder))
        case "google.sheets.row.append":
            self = .googleSheetsRowAppend(try GoogleSheetsRowAppend(from: decoder))
        case "google.calendar.availability.check":
            self = .googleCalendarAvailabilityCheck(try GoogleCalendarAvailabilityCheck(from: decoder))
        case "slack.message.send":
            self = .slackMessageSend(try SlackMessageSend(from: decoder))
        case "sms":
            self = .sms(try Sms(from: decoder))
        case "mcp":
            self = .mcp(try Mcp(from: decoder))
        case "gohighlevel.calendar.availability.check":
            self = .gohighlevelCalendarAvailabilityCheck(try GohighlevelCalendarAvailabilityCheck(from: decoder))
        case "gohighlevel.calendar.event.create":
            self = .gohighlevelCalendarEventCreate(try GohighlevelCalendarEventCreate(from: decoder))
        case "gohighlevel.contact.create":
            self = .gohighlevelContactCreate(try GohighlevelContactCreate(from: decoder))
        case "gohighlevel.contact.get":
            self = .gohighlevelContactGet(try GohighlevelContactGet(from: decoder))
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
        case .apiRequest(let data):
            try data.encode(to: encoder)
        case .dtmf(let data):
            try data.encode(to: encoder)
        case .endCall(let data):
            try data.encode(to: encoder)
        case .function(let data):
            try data.encode(to: encoder)
        case .transferCall(let data):
            try data.encode(to: encoder)
        case .handoff(let data):
            try data.encode(to: encoder)
        case .bash(let data):
            try data.encode(to: encoder)
        case .computer(let data):
            try data.encode(to: encoder)
        case .textEditor(let data):
            try data.encode(to: encoder)
        case .query(let data):
            try data.encode(to: encoder)
        case .googleCalendarEventCreate(let data):
            try data.encode(to: encoder)
        case .googleSheetsRowAppend(let data):
            try data.encode(to: encoder)
        case .googleCalendarAvailabilityCheck(let data):
            try data.encode(to: encoder)
        case .slackMessageSend(let data):
            try data.encode(to: encoder)
        case .sms(let data):
            try data.encode(to: encoder)
        case .mcp(let data):
            try data.encode(to: encoder)
        case .gohighlevelCalendarAvailabilityCheck(let data):
            try data.encode(to: encoder)
        case .gohighlevelCalendarEventCreate(let data):
            try data.encode(to: encoder)
        case .gohighlevelContactCreate(let data):
            try data.encode(to: encoder)
        case .gohighlevelContactGet(let data):
            try data.encode(to: encoder)
        }
    }

    public struct ApiRequest: Codable, Hashable, Sendable {
        public let type: String = "apiRequest"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [ApiRequestToolMessagesItem]?
        public let method: ApiRequestToolMethod
        /// This is the timeout in seconds for the request. Defaults to 20 seconds.
        /// 
        /// @default 20
        public let timeoutSeconds: Double?
        /// The credential ID for API request authentication
        public let credentialId: String?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [ApiRequestToolMessagesItem]? = nil,
            method: ApiRequestToolMethod,
            timeoutSeconds: Double? = nil,
            credentialId: String? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            name: String? = nil,
            description: String? = nil,
            url: String,
            body: JsonSchema? = nil,
            headers: JsonSchema? = nil,
            backoffPlan: BackoffPlan? = nil,
            variableExtractionPlan: VariableExtractionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.method = method
            self.timeoutSeconds = timeoutSeconds
            self.credentialId = credentialId
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.name = name
            self.description = description
            self.url = url
            self.body = body
            self.headers = headers
            self.backoffPlan = backoffPlan
            self.variableExtractionPlan = variableExtractionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([ApiRequestToolMessagesItem].self, forKey: .messages)
            self.method = try container.decode(ApiRequestToolMethod.self, forKey: .method)
            self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
            self.credentialId = try container.decodeIfPresent(String.self, forKey: .credentialId)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.url = try container.decode(String.self, forKey: .url)
            self.body = try container.decodeIfPresent(JsonSchema.self, forKey: .body)
            self.headers = try container.decodeIfPresent(JsonSchema.self, forKey: .headers)
            self.backoffPlan = try container.decodeIfPresent(BackoffPlan.self, forKey: .backoffPlan)
            self.variableExtractionPlan = try container.decodeIfPresent(VariableExtractionPlan.self, forKey: .variableExtractionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.method, forKey: .method)
            try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
            try container.encodeIfPresent(self.credentialId, forKey: .credentialId)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.description, forKey: .description)
            try container.encode(self.url, forKey: .url)
            try container.encodeIfPresent(self.body, forKey: .body)
            try container.encodeIfPresent(self.headers, forKey: .headers)
            try container.encodeIfPresent(self.backoffPlan, forKey: .backoffPlan)
            try container.encodeIfPresent(self.variableExtractionPlan, forKey: .variableExtractionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case method
            case timeoutSeconds
            case credentialId
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
            case name
            case description
            case url
            case body
            case headers
            case backoffPlan
            case variableExtractionPlan
        }
    }

    public struct Dtmf: Codable, Hashable, Sendable {
        public let type: String = "dtmf"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [DtmfToolMessagesItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [DtmfToolMessagesItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([DtmfToolMessagesItem].self, forKey: .messages)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    public struct EndCall: Codable, Hashable, Sendable {
        public let type: String = "endCall"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [EndCallToolMessagesItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [EndCallToolMessagesItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([EndCallToolMessagesItem].self, forKey: .messages)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    public struct Function: Codable, Hashable, Sendable {
        public let type: String = "function"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [FunctionToolMessagesItem]?
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
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [FunctionToolMessagesItem]? = nil,
            async: Bool? = nil,
            server: Server? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            function: OpenAiFunction? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.async = async
            self.server = server
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.function = function
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([FunctionToolMessagesItem].self, forKey: .messages)
            self.async = try container.decodeIfPresent(Bool.self, forKey: .async)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.function = try container.decodeIfPresent(OpenAiFunction.self, forKey: .function)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.async, forKey: .async)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
            try container.encodeIfPresent(self.function, forKey: .function)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case async
            case server
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
            case function
        }
    }

    public struct TransferCall: Codable, Hashable, Sendable {
        public let type: String = "transferCall"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [TransferCallToolMessagesItem]?
        /// These are the destinations that the call can be transferred to. If no destinations are provided, server.url will be used to get the transfer destination once the tool is called.
        public let destinations: [TransferCallToolDestinationsItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [TransferCallToolMessagesItem]? = nil,
            destinations: [TransferCallToolDestinationsItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.destinations = destinations
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([TransferCallToolMessagesItem].self, forKey: .messages)
            self.destinations = try container.decodeIfPresent([TransferCallToolDestinationsItem].self, forKey: .destinations)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.destinations, forKey: .destinations)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case destinations
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    public struct Handoff: Codable, Hashable, Sendable {
        public let type: String = "handoff"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [HandoffToolMessagesItem]?
        /// These are the destinations that the call can be handed off to.
        /// 
        /// Usage:
        /// 1. Single destination
        /// 
        /// Use `assistantId` to handoff the call to a saved assistant, or `assistantName` to handoff the call to an assistant in the same squad.
        /// 
        /// ```json
        /// {
        ///   "tools": [
        ///     {
        ///       "type": "handoff",
        ///       "destinations": [
        ///         {
        ///           "type": "assistant",
        ///           "assistantId": "assistant-123", // or "assistantName": "Assistant123"
        ///           "description": "customer wants to be handed off to assistant-123",
        ///           "contextEngineeringPlan": {
        ///             "type": "all"
        ///           }
        ///         }
        ///       ],
        ///     }
        ///   ]
        /// }
        /// ```
        /// 
        /// 2. Multiple destinations
        /// 
        /// 2.1. Multiple Tools, Each With One Destination (OpenAI recommended)
        /// 
        /// ```json
        /// {
        ///   "tools": [
        ///     {
        ///       "type": "handoff",
        ///       "destinations": [
        ///         {
        ///           "type": "assistant",
        ///           "assistantId": "assistant-123",
        ///           "description": "customer wants to be handed off to assistant-123",
        ///           "contextEngineeringPlan": {
        ///             "type": "all"
        ///           }
        ///         },
        ///       ],
        ///     },
        ///     {
        ///       "type": "handoff",
        ///       "destinations": [
        ///         {
        ///           "type": "assistant",
        ///           "assistantId": "assistant-456",
        ///           "description": "customer wants to be handed off to assistant-456",
        ///           "contextEngineeringPlan": {
        ///             "type": "all"
        ///           }
        ///         }
        ///       ],
        ///     }
        ///   ]
        /// }
        /// ```
        /// 
        /// 2.2. One Tool, Multiple Destinations (Anthropic recommended)
        /// 
        /// ```json
        /// {
        ///   "tools": [
        ///     {
        ///       "type": "handoff",
        ///       "destinations": [
        ///         {
        ///           "type": "assistant",
        ///           "assistantId": "assistant-123",
        ///           "description": "customer wants to be handed off to assistant-123",
        ///           "contextEngineeringPlan": {
        ///             "type": "all"
        ///           }
        ///         },
        ///         {
        ///           "type": "assistant",
        ///           "assistantId": "assistant-456",
        ///           "description": "customer wants to be handed off to assistant-456",
        ///           "contextEngineeringPlan": {
        ///             "type": "all"
        ///           }
        ///         }
        ///       ],
        ///     }
        ///   ]
        /// }
        /// ```
        /// 
        /// 3. Dynamic destination
        /// 
        /// 3.1 To determine the destination dynamically, supply a `dynamic` handoff destination type and a `server` object.
        ///     VAPI will send a handoff-destination-request webhook to the `server.url`.
        ///     The response from the server will be used as the destination (if valid).
        /// 
        /// ```json
        /// {
        ///   "tools": [
        ///     {
        ///       "type": "handoff",
        ///       "destinations": [
        ///         {
        ///           "type": "dynamic",
        ///           "server": {
        ///             "url": "https://example.com"
        ///           }
        ///         }
        ///       ],
        ///     }
        ///   ]
        /// }
        /// ```
        /// 
        /// 3.2. To pass custom parameters to the server, you can use the `function` object.
        /// 
        /// ```json
        /// {
        ///   "tools": [
        ///     {
        ///       "type": "handoff",
        ///       "destinations": [
        ///         {
        ///           "type": "dynamic",
        ///           "server": {
        ///             "url": "https://example.com"
        ///           },
        ///         }
        ///       ],
        ///       "function": {
        ///         "name": "handoff",
        ///         "description": "Call this function when the customer is ready to be handed off to the next assistant",
        ///         "parameters": {
        ///           "type": "object",
        ///           "properties": {
        ///             "destination": {
        ///               "type": "string",
        ///               "description": "Use dynamic when customer is ready to be handed off to the next assistant",
        ///               "enum": ["dynamic"]
        ///             },
        ///             "customerAreaCode": {
        ///               "type": "number",
        ///               "description": "Area code of the customer"
        ///             },
        ///             "customerIntent": {
        ///               "type": "string",
        ///               "enum": ["new-customer", "existing-customer"],
        ///               "description": "Use new-customer when customer is a new customer, existing-customer when customer is an existing customer"
        ///             },
        ///             "customerSentiment": {
        ///               "type": "string",
        ///               "enum": ["positive", "negative", "neutral"],
        ///               "description": "Use positive when customer is happy, negative when customer is unhappy, neutral when customer is neutral"
        ///             }
        ///           }
        ///         }
        ///       }
        ///     }
        ///   ]
        /// }
        /// ```
        /// 
        /// The properties `customerAreaCode`, `customerIntent`, and `customerSentiment` will be passed to the server in the webhook request body.
        public let destinations: [HandoffToolDestinationsItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// This is the optional function definition that will be passed to the LLM.
        /// If this is not defined, we will construct this based on the other properties.
        /// 
        /// For example, given the following tools definition:
        /// ```json
        /// {
        ///   "tools": [
        ///     {
        ///       "type": "handoff",
        ///       "destinations": [
        ///         {
        ///           "type": "assistant",
        ///           "assistantId": "assistant-123",
        ///           "description": "customer wants to be handed off to assistant-123",
        ///           "contextEngineeringPlan": {
        ///             "type": "all"
        ///           }
        ///         },
        ///         {
        ///           "type": "assistant",
        ///           "assistantId": "assistant-456",
        ///           "description": "customer wants to be handed off to assistant-456",
        ///           "contextEngineeringPlan": {
        ///             "type": "all"
        ///           }
        ///         }
        ///       ],
        ///     }
        ///   ]
        /// }
        /// ```
        /// 
        /// We will construct the following function definition:
        /// ```json
        /// {
        ///   "function": {
        ///     "name": "handoff_to_assistant-123",
        ///     "description": "
        ///          Use this function to handoff the call to the next assistant.
        ///          Only use it when instructions explicitly ask you to use the handoff_to_assistant function.
        ///          DO NOT call this function unless you are instructed to do so.
        ///          Here are the destinations you can handoff the call to:
        ///          1. assistant-123. When: customer wants to be handed off to assistant-123
        ///          2. assistant-456. When: customer wants to be handed off to assistant-456
        ///     ",
        ///     "parameters": {
        ///       "type": "object",
        ///       "properties": {
        ///         "destination": {
        ///           "type": "string",
        ///           "description": "Options: assistant-123 (customer wants to be handed off to assistant-123), assistant-456 (customer wants to be handed off to assistant-456)",
        ///           "enum": ["assistant-123", "assistant-456"]
        ///         },
        ///       },
        ///       "required": ["destination"]
        ///     }
        ///   }
        /// }
        /// ```
        /// 
        /// To override this function, please provide an OpenAI function definition and refer to it in the system prompt.
        /// You may override parts of the function definition (i.e. you may only want to change the function name for your prompt).
        /// If you choose to override the function parameters, it must include `destination` as a required parameter, and it must evaluate to either an assistantId, assistantName, or a the string literal `dynamic`.
        /// 
        /// To pass custom parameters to the server in a dynamic handoff, you can use the function parameters, with `dynamic` as the destination.
        /// ```json
        /// {
        ///   "function": {
        ///     "name": "dynamic_handoff",
        ///     "description": "
        ///          Call this function when the customer is ready to be handed off to the next assistant
        ///     ",
        ///     "parameters": {
        ///       "type": "object",
        ///       "properties": {
        ///         "destination": {
        ///           "type": "string",
        ///           "enum": ["dynamic"]
        ///         },
        ///         "customerAreaCode": {
        ///           "type": "number",
        ///           "description": "Area code of the customer"
        ///         },
        ///         "customerIntent": {
        ///           "type": "string",
        ///           "enum": ["new-customer", "existing-customer"],
        ///           "description": "Use new-customer when customer is a new customer, existing-customer when customer is an existing customer"
        ///         },
        ///         "customerSentiment": {
        ///           "type": "string",
        ///           "enum": ["positive", "negative", "neutral"],
        ///           "description": "Use positive when customer is happy, negative when customer is unhappy, neutral when customer is neutral"
        ///         }
        ///       },
        ///       "required": ["destination", "customerAreaCode", "customerIntent", "customerSentiment"]
        ///     }
        ///   }
        /// }
        /// ```
        public let function: OpenAiFunction?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [HandoffToolMessagesItem]? = nil,
            destinations: [HandoffToolDestinationsItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            function: OpenAiFunction? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.destinations = destinations
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.function = function
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([HandoffToolMessagesItem].self, forKey: .messages)
            self.destinations = try container.decodeIfPresent([HandoffToolDestinationsItem].self, forKey: .destinations)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.function = try container.decodeIfPresent(OpenAiFunction.self, forKey: .function)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.destinations, forKey: .destinations)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
            try container.encodeIfPresent(self.function, forKey: .function)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case destinations
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
            case function
        }
    }

    public struct Bash: Codable, Hashable, Sendable {
        public let type: String = "bash"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [BashToolMessagesItem]?
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
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// The name of the tool, fixed to 'bash'
        public let name: Bash
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [BashToolMessagesItem]? = nil,
            subType: Bash20241022,
            server: Server? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            name: Bash,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.subType = subType
            self.server = server
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([BashToolMessagesItem].self, forKey: .messages)
            self.subType = try container.decode(Bash20241022.self, forKey: .subType)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.name = try container.decode(Bash.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.subType, forKey: .subType)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
            try container.encode(self.name, forKey: .name)
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
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
            case name
        }
    }

    public struct Computer: Codable, Hashable, Sendable {
        public let type: String = "computer"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [ComputerToolMessagesItem]?
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
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// The name of the tool, fixed to 'computer'
        public let name: Computer
        /// The display width in pixels
        public let displayWidthPx: Double
        /// The display height in pixels
        public let displayHeightPx: Double
        /// Optional display number
        public let displayNumber: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [ComputerToolMessagesItem]? = nil,
            subType: Computer20241022,
            server: Server? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            name: Computer,
            displayWidthPx: Double,
            displayHeightPx: Double,
            displayNumber: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.subType = subType
            self.server = server
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.name = name
            self.displayWidthPx = displayWidthPx
            self.displayHeightPx = displayHeightPx
            self.displayNumber = displayNumber
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([ComputerToolMessagesItem].self, forKey: .messages)
            self.subType = try container.decode(Computer20241022.self, forKey: .subType)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.name = try container.decode(Computer.self, forKey: .name)
            self.displayWidthPx = try container.decode(Double.self, forKey: .displayWidthPx)
            self.displayHeightPx = try container.decode(Double.self, forKey: .displayHeightPx)
            self.displayNumber = try container.decodeIfPresent(Double.self, forKey: .displayNumber)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.subType, forKey: .subType)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
            try container.encode(self.name, forKey: .name)
            try container.encode(self.displayWidthPx, forKey: .displayWidthPx)
            try container.encode(self.displayHeightPx, forKey: .displayHeightPx)
            try container.encodeIfPresent(self.displayNumber, forKey: .displayNumber)
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
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
            case name
            case displayWidthPx
            case displayHeightPx
            case displayNumber
        }
    }

    public struct TextEditor: Codable, Hashable, Sendable {
        public let type: String = "textEditor"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [TextEditorToolMessagesItem]?
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
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// The name of the tool, fixed to 'str_replace_editor'
        public let name: StrReplaceEditor
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [TextEditorToolMessagesItem]? = nil,
            subType: TextEditor20241022,
            server: Server? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            name: StrReplaceEditor,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.subType = subType
            self.server = server
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([TextEditorToolMessagesItem].self, forKey: .messages)
            self.subType = try container.decode(TextEditor20241022.self, forKey: .subType)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.name = try container.decode(StrReplaceEditor.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.subType, forKey: .subType)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
            try container.encode(self.name, forKey: .name)
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
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
            case name
        }
    }

    public struct Query: Codable, Hashable, Sendable {
        public let type: String = "query"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [QueryToolMessagesItem]?
        /// The knowledge bases to query
        public let knowledgeBases: [KnowledgeBase]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [QueryToolMessagesItem]? = nil,
            knowledgeBases: [KnowledgeBase]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.knowledgeBases = knowledgeBases
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([QueryToolMessagesItem].self, forKey: .messages)
            self.knowledgeBases = try container.decodeIfPresent([KnowledgeBase].self, forKey: .knowledgeBases)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.knowledgeBases, forKey: .knowledgeBases)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case knowledgeBases
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    public struct GoogleCalendarEventCreate: Codable, Hashable, Sendable {
        public let type: String = "google.calendar.event.create"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [GoogleCalendarCreateEventToolMessagesItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [GoogleCalendarCreateEventToolMessagesItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([GoogleCalendarCreateEventToolMessagesItem].self, forKey: .messages)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    public struct GoogleSheetsRowAppend: Codable, Hashable, Sendable {
        public let type: String = "google.sheets.row.append"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [GoogleSheetsRowAppendToolMessagesItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [GoogleSheetsRowAppendToolMessagesItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([GoogleSheetsRowAppendToolMessagesItem].self, forKey: .messages)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    public struct GoogleCalendarAvailabilityCheck: Codable, Hashable, Sendable {
        public let type: String = "google.calendar.availability.check"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [GoogleCalendarCheckAvailabilityToolMessagesItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [GoogleCalendarCheckAvailabilityToolMessagesItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([GoogleCalendarCheckAvailabilityToolMessagesItem].self, forKey: .messages)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    public struct SlackMessageSend: Codable, Hashable, Sendable {
        public let type: String = "slack.message.send"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [SlackSendMessageToolMessagesItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [SlackSendMessageToolMessagesItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([SlackSendMessageToolMessagesItem].self, forKey: .messages)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    public struct Sms: Codable, Hashable, Sendable {
        public let type: String = "sms"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [SmsToolMessagesItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [SmsToolMessagesItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([SmsToolMessagesItem].self, forKey: .messages)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    public struct Mcp: Codable, Hashable, Sendable {
        public let type: String = "mcp"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [McpToolMessagesItem]?
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
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        public let metadata: McpToolMetadata?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [McpToolMessagesItem]? = nil,
            server: Server? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            metadata: McpToolMetadata? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.server = server
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.metadata = metadata
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([McpToolMessagesItem].self, forKey: .messages)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.metadata = try container.decodeIfPresent(McpToolMetadata.self, forKey: .metadata)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case server
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
            case metadata
        }
    }

    public struct GohighlevelCalendarAvailabilityCheck: Codable, Hashable, Sendable {
        public let type: String = "gohighlevel.calendar.availability.check"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [GoHighLevelCalendarAvailabilityToolMessagesItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [GoHighLevelCalendarAvailabilityToolMessagesItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([GoHighLevelCalendarAvailabilityToolMessagesItem].self, forKey: .messages)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    public struct GohighlevelCalendarEventCreate: Codable, Hashable, Sendable {
        public let type: String = "gohighlevel.calendar.event.create"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [GoHighLevelCalendarEventCreateToolMessagesItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [GoHighLevelCalendarEventCreateToolMessagesItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([GoHighLevelCalendarEventCreateToolMessagesItem].self, forKey: .messages)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    public struct GohighlevelContactCreate: Codable, Hashable, Sendable {
        public let type: String = "gohighlevel.contact.create"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [GoHighLevelContactCreateToolMessagesItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [GoHighLevelContactCreateToolMessagesItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([GoHighLevelContactCreateToolMessagesItem].self, forKey: .messages)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    public struct GohighlevelContactGet: Codable, Hashable, Sendable {
        public let type: String = "gohighlevel.contact.get"
        /// These are the messages that will be spoken to the user as the tool is running.
        /// 
        /// For some tools, this is auto-filled based on special fields like `tool.destinations`. For others like the function tool, these can be custom configured.
        public let messages: [GoHighLevelContactGetToolMessagesItem]?
        /// This is the unique identifier for the tool.
        public let id: String
        /// This is the unique identifier for the organization that this tool belongs to.
        public let orgId: String
        /// This is the ISO 8601 date-time string of when the tool was created.
        public let createdAt: Date
        /// This is the ISO 8601 date-time string of when the tool was last updated.
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
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            messages: [GoHighLevelContactGetToolMessagesItem]? = nil,
            id: String,
            orgId: String,
            createdAt: Date,
            updatedAt: Date,
            rejectionPlan: ToolRejectionPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.messages = messages
            self.id = id
            self.orgId = orgId
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.rejectionPlan = rejectionPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.messages = try container.decodeIfPresent([GoHighLevelContactGetToolMessagesItem].self, forKey: .messages)
            self.id = try container.decode(String.self, forKey: .id)
            self.orgId = try container.decode(String.self, forKey: .orgId)
            self.createdAt = try container.decode(Date.self, forKey: .createdAt)
            self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
            self.rejectionPlan = try container.decodeIfPresent(ToolRejectionPlan.self, forKey: .rejectionPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.messages, forKey: .messages)
            try container.encode(self.id, forKey: .id)
            try container.encode(self.orgId, forKey: .orgId)
            try container.encode(self.createdAt, forKey: .createdAt)
            try container.encode(self.updatedAt, forKey: .updatedAt)
            try container.encodeIfPresent(self.rejectionPlan, forKey: .rejectionPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case messages
            case id
            case orgId
            case createdAt
            case updatedAt
            case rejectionPlan
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
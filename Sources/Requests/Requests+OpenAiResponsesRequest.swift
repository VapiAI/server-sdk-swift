import Foundation

extension Requests {
    public struct OpenAiResponsesRequest: Codable, Hashable, Sendable {
        /// This is the assistant that will be used for the chat. To use an existing assistant, use `assistantId` instead.
        public let assistantId: String?
        /// This is the assistant that will be used for the chat. To use an existing assistant, use `assistantId` instead.
        public let assistant: CreateAssistantDto?
        /// These are the variable values that will be used to replace template variables in the assistant messages.
        /// Only variable substitution is supported in chat contexts - other assistant properties cannot be overridden.
        public let assistantOverrides: AssistantOverrides?
        /// This is the squad that will be used for the chat. To use a transient squad, use `squad` instead.
        public let squadId: String?
        /// This is the squad that will be used for the chat. To use an existing squad, use `squadId` instead.
        public let squad: CreateSquadDto?
        /// This is the name of the chat. This is just for your own reference.
        public let name: String?
        /// This is the ID of the session that will be used for the chat.
        /// Mutually exclusive with previousChatId.
        public let sessionId: String?
        /// This is the input text for the chat.
        /// Can be a string or an array of chat messages.
        /// This field is REQUIRED for chat creation.
        public let input: OpenAiResponsesRequestInput
        /// Whether to stream the response or not.
        public let stream: Bool?
        /// This is the ID of the chat that will be used as context for the new chat.
        /// The messages from the previous chat will be used as context.
        /// Mutually exclusive with sessionId.
        public let previousChatId: String?
        /// This is used to send the chat through a transport like SMS.
        /// If transport.phoneNumberId and transport.customer are provided, creates a new session.
        /// If sessionId is provided without transport fields, uses existing session data.
        /// Cannot specify both sessionId and transport fields (phoneNumberId/customer) together.
        public let transport: TwilioSmsChatTransport?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            assistantId: String? = nil,
            assistant: CreateAssistantDto? = nil,
            assistantOverrides: AssistantOverrides? = nil,
            squadId: String? = nil,
            squad: CreateSquadDto? = nil,
            name: String? = nil,
            sessionId: String? = nil,
            input: OpenAiResponsesRequestInput,
            stream: Bool? = nil,
            previousChatId: String? = nil,
            transport: TwilioSmsChatTransport? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.assistantId = assistantId
            self.assistant = assistant
            self.assistantOverrides = assistantOverrides
            self.squadId = squadId
            self.squad = squad
            self.name = name
            self.sessionId = sessionId
            self.input = input
            self.stream = stream
            self.previousChatId = previousChatId
            self.transport = transport
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
            self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
            self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
            self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
            self.squad = try container.decodeIfPresent(CreateSquadDto.self, forKey: .squad)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId)
            self.input = try container.decode(OpenAiResponsesRequestInput.self, forKey: .input)
            self.stream = try container.decodeIfPresent(Bool.self, forKey: .stream)
            self.previousChatId = try container.decodeIfPresent(String.self, forKey: .previousChatId)
            self.transport = try container.decodeIfPresent(TwilioSmsChatTransport.self, forKey: .transport)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
            try container.encodeIfPresent(self.assistant, forKey: .assistant)
            try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
            try container.encodeIfPresent(self.squadId, forKey: .squadId)
            try container.encodeIfPresent(self.squad, forKey: .squad)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.sessionId, forKey: .sessionId)
            try container.encode(self.input, forKey: .input)
            try container.encodeIfPresent(self.stream, forKey: .stream)
            try container.encodeIfPresent(self.previousChatId, forKey: .previousChatId)
            try container.encodeIfPresent(self.transport, forKey: .transport)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case assistantId
            case assistant
            case assistantOverrides
            case squadId
            case squad
            case name
            case sessionId
            case input
            case stream
            case previousChatId
            case transport
        }
    }
}
import Foundation

public struct ServerMessageStatusUpdate: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ServerMessageStatusUpdatePhoneNumber?
    /// This is the type of the message. "status-update" is sent whenever the `call.status` changes.
    public let type: StatusUpdate
    /// This is the status of the call.
    public let status: ServerMessageStatusUpdateStatus
    /// This is the reason the call ended. This is only sent if the status is "ended".
    public let endedReason: ServerMessageStatusUpdateEndedReason?
    /// These are the conversation messages of the call. This is only sent if the status is "forwarding".
    public let messages: [ServerMessageStatusUpdateMessagesItem]?
    /// These are the conversation messages of the call. This is only sent if the status is "forwarding".
    public let messagesOpenAiFormatted: [OpenAiMessage]?
    /// This is the destination the call is being transferred to. This is only sent if the status is "forwarding".
    public let destination: ServerMessageStatusUpdateDestination?
    /// This is the timestamp of the message.
    public let timestamp: Double?
    /// This is a live version of the `call.artifact`.
    /// 
    /// This matches what is stored on `call.artifact` after the call.
    public let artifact: Artifact?
    /// This is the assistant that the message is associated with.
    public let assistant: CreateAssistantDto?
    /// This is the customer that the message is associated with.
    public let customer: CreateCustomerDto?
    /// This is the call that the message is associated with.
    public let call: Call?
    /// This is the chat object.
    public let chat: Chat?
    /// This is the transcript of the call. This is only sent if the status is "forwarding".
    public let transcript: String?
    /// This is the summary of the call. This is only sent if the status is "forwarding".
    public let summary: String?
    /// This is the inbound phone call debugging artifacts. This is only sent if the status is "ended" and there was an error accepting the inbound phone call.
    /// 
    /// This will include any errors related to the "assistant-request" if one was made.
    public let inboundPhoneCallDebuggingArtifacts: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumber: ServerMessageStatusUpdatePhoneNumber? = nil,
        type: StatusUpdate,
        status: ServerMessageStatusUpdateStatus,
        endedReason: ServerMessageStatusUpdateEndedReason? = nil,
        messages: [ServerMessageStatusUpdateMessagesItem]? = nil,
        messagesOpenAiFormatted: [OpenAiMessage]? = nil,
        destination: ServerMessageStatusUpdateDestination? = nil,
        timestamp: Double? = nil,
        artifact: Artifact? = nil,
        assistant: CreateAssistantDto? = nil,
        customer: CreateCustomerDto? = nil,
        call: Call? = nil,
        chat: Chat? = nil,
        transcript: String? = nil,
        summary: String? = nil,
        inboundPhoneCallDebuggingArtifacts: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.type = type
        self.status = status
        self.endedReason = endedReason
        self.messages = messages
        self.messagesOpenAiFormatted = messagesOpenAiFormatted
        self.destination = destination
        self.timestamp = timestamp
        self.artifact = artifact
        self.assistant = assistant
        self.customer = customer
        self.call = call
        self.chat = chat
        self.transcript = transcript
        self.summary = summary
        self.inboundPhoneCallDebuggingArtifacts = inboundPhoneCallDebuggingArtifacts
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumber = try container.decodeIfPresent(ServerMessageStatusUpdatePhoneNumber.self, forKey: .phoneNumber)
        self.type = try container.decode(StatusUpdate.self, forKey: .type)
        self.status = try container.decode(ServerMessageStatusUpdateStatus.self, forKey: .status)
        self.endedReason = try container.decodeIfPresent(ServerMessageStatusUpdateEndedReason.self, forKey: .endedReason)
        self.messages = try container.decodeIfPresent([ServerMessageStatusUpdateMessagesItem].self, forKey: .messages)
        self.messagesOpenAiFormatted = try container.decodeIfPresent([OpenAiMessage].self, forKey: .messagesOpenAiFormatted)
        self.destination = try container.decodeIfPresent(ServerMessageStatusUpdateDestination.self, forKey: .destination)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.artifact = try container.decodeIfPresent(Artifact.self, forKey: .artifact)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.call = try container.decodeIfPresent(Call.self, forKey: .call)
        self.chat = try container.decodeIfPresent(Chat.self, forKey: .chat)
        self.transcript = try container.decodeIfPresent(String.self, forKey: .transcript)
        self.summary = try container.decodeIfPresent(String.self, forKey: .summary)
        self.inboundPhoneCallDebuggingArtifacts = try container.decodeIfPresent([String: JSONValue].self, forKey: .inboundPhoneCallDebuggingArtifacts)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.endedReason, forKey: .endedReason)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.messagesOpenAiFormatted, forKey: .messagesOpenAiFormatted)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.artifact, forKey: .artifact)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.chat, forKey: .chat)
        try container.encodeIfPresent(self.transcript, forKey: .transcript)
        try container.encodeIfPresent(self.summary, forKey: .summary)
        try container.encodeIfPresent(self.inboundPhoneCallDebuggingArtifacts, forKey: .inboundPhoneCallDebuggingArtifacts)
    }

    public enum StatusUpdate: String, Codable, Hashable, CaseIterable, Sendable {
        case statusUpdate = "status-update"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumber
        case type
        case status
        case endedReason
        case messages
        case messagesOpenAiFormatted = "messagesOpenAIFormatted"
        case destination
        case timestamp
        case artifact
        case assistant
        case customer
        case call
        case chat
        case transcript
        case summary
        case inboundPhoneCallDebuggingArtifacts
    }
}
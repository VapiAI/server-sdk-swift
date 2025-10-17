import Foundation

public struct ServerMessageTranscript: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ServerMessageTranscriptPhoneNumber?
    /// This is the type of the message. "transcript" is sent as transcriber outputs partial or final transcript.
    public let type: ServerMessageTranscriptType
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
    /// This is the role for which the transcript is for.
    public let role: ServerMessageTranscriptRole
    /// This is the type of the transcript.
    public let transcriptType: ServerMessageTranscriptTranscriptType
    /// This is the transcript content.
    public let transcript: String
    /// Indicates if the transcript was filtered for security reasons.
    public let isFiltered: Bool?
    /// List of detected security threats if the transcript was filtered.
    public let detectedThreats: [String]?
    /// The original transcript before filtering (only included if content was filtered).
    public let originalTranscript: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumber: ServerMessageTranscriptPhoneNumber? = nil,
        type: ServerMessageTranscriptType,
        timestamp: Double? = nil,
        artifact: Artifact? = nil,
        assistant: CreateAssistantDto? = nil,
        customer: CreateCustomerDto? = nil,
        call: Call? = nil,
        chat: Chat? = nil,
        role: ServerMessageTranscriptRole,
        transcriptType: ServerMessageTranscriptTranscriptType,
        transcript: String,
        isFiltered: Bool? = nil,
        detectedThreats: [String]? = nil,
        originalTranscript: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.type = type
        self.timestamp = timestamp
        self.artifact = artifact
        self.assistant = assistant
        self.customer = customer
        self.call = call
        self.chat = chat
        self.role = role
        self.transcriptType = transcriptType
        self.transcript = transcript
        self.isFiltered = isFiltered
        self.detectedThreats = detectedThreats
        self.originalTranscript = originalTranscript
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumber = try container.decodeIfPresent(ServerMessageTranscriptPhoneNumber.self, forKey: .phoneNumber)
        self.type = try container.decode(ServerMessageTranscriptType.self, forKey: .type)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.artifact = try container.decodeIfPresent(Artifact.self, forKey: .artifact)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.call = try container.decodeIfPresent(Call.self, forKey: .call)
        self.chat = try container.decodeIfPresent(Chat.self, forKey: .chat)
        self.role = try container.decode(ServerMessageTranscriptRole.self, forKey: .role)
        self.transcriptType = try container.decode(ServerMessageTranscriptTranscriptType.self, forKey: .transcriptType)
        self.transcript = try container.decode(String.self, forKey: .transcript)
        self.isFiltered = try container.decodeIfPresent(Bool.self, forKey: .isFiltered)
        self.detectedThreats = try container.decodeIfPresent([String].self, forKey: .detectedThreats)
        self.originalTranscript = try container.decodeIfPresent(String.self, forKey: .originalTranscript)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.artifact, forKey: .artifact)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.chat, forKey: .chat)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.transcriptType, forKey: .transcriptType)
        try container.encode(self.transcript, forKey: .transcript)
        try container.encodeIfPresent(self.isFiltered, forKey: .isFiltered)
        try container.encodeIfPresent(self.detectedThreats, forKey: .detectedThreats)
        try container.encodeIfPresent(self.originalTranscript, forKey: .originalTranscript)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumber
        case type
        case timestamp
        case artifact
        case assistant
        case customer
        case call
        case chat
        case role
        case transcriptType
        case transcript
        case isFiltered
        case detectedThreats
        case originalTranscript
    }
}
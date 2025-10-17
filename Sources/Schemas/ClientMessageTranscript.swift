import Foundation

public struct ClientMessageTranscript: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ClientMessageTranscriptPhoneNumber?
    /// This is the type of the message. "transcript" is sent as transcriber outputs partial or final transcript.
    public let type: ClientMessageTranscriptType
    /// This is the timestamp of the message.
    public let timestamp: Double?
    /// This is the call that the message is associated with.
    public let call: Call?
    /// This is the customer that the message is associated with.
    public let customer: CreateCustomerDto?
    /// This is the assistant that the message is associated with.
    public let assistant: CreateAssistantDto?
    /// This is the role for which the transcript is for.
    public let role: ClientMessageTranscriptRole
    /// This is the type of the transcript.
    public let transcriptType: ClientMessageTranscriptTranscriptType
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
        phoneNumber: ClientMessageTranscriptPhoneNumber? = nil,
        type: ClientMessageTranscriptType,
        timestamp: Double? = nil,
        call: Call? = nil,
        customer: CreateCustomerDto? = nil,
        assistant: CreateAssistantDto? = nil,
        role: ClientMessageTranscriptRole,
        transcriptType: ClientMessageTranscriptTranscriptType,
        transcript: String,
        isFiltered: Bool? = nil,
        detectedThreats: [String]? = nil,
        originalTranscript: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.type = type
        self.timestamp = timestamp
        self.call = call
        self.customer = customer
        self.assistant = assistant
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
        self.phoneNumber = try container.decodeIfPresent(ClientMessageTranscriptPhoneNumber.self, forKey: .phoneNumber)
        self.type = try container.decode(ClientMessageTranscriptType.self, forKey: .type)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.call = try container.decodeIfPresent(Call.self, forKey: .call)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.role = try container.decode(ClientMessageTranscriptRole.self, forKey: .role)
        self.transcriptType = try container.decode(ClientMessageTranscriptTranscriptType.self, forKey: .transcriptType)
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
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
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
        case call
        case customer
        case assistant
        case role
        case transcriptType
        case transcript
        case isFiltered
        case detectedThreats
        case originalTranscript
    }
}
import Foundation

public struct Session: Codable, Hashable, Sendable {
    /// This is the unique identifier for the session.
    public let id: String
    /// This is the unique identifier for the organization that owns this session.
    public let orgId: String
    /// This is the ISO 8601 timestamp indicating when the session was created.
    public let createdAt: Date
    /// This is the ISO 8601 timestamp indicating when the session was last updated.
    public let updatedAt: Date
    /// This is a user-defined name for the session. Maximum length is 40 characters.
    public let name: String?
    /// This is the current status of the session. Can be either 'active' or 'completed'.
    public let status: SessionStatus?
    /// Session expiration time in seconds. Defaults to 24 hours (86400 seconds) if not set.
    public let expirationSeconds: Double?
    /// This is the ID of the assistant associated with this session. Use this when referencing an existing assistant.
    public let assistantId: String?
    /// This is the assistant configuration for this session. Use this when creating a new assistant configuration.
    /// If assistantId is provided, this will be ignored.
    public let assistant: CreateAssistantDto?
    /// This is the squad ID associated with this session. Use this when referencing an existing squad.
    public let squadId: String?
    /// This is the squad configuration for this session. Use this when creating a new squad configuration.
    /// If squadId is provided, this will be ignored.
    public let squad: CreateSquadDto?
    /// This is an array of chat messages in the session.
    public let messages: [SessionMessagesItem]?
    /// This is the customer information associated with this session.
    public let customer: CreateCustomerDto?
    /// This is the ID of the phone number associated with this session.
    public let phoneNumberId: String?
    /// This is the phone number configuration for this session.
    public let phoneNumber: ImportTwilioPhoneNumberDto?
    /// These are the artifacts that were extracted from the session messages.
    /// They are only available after the session has completed.
    /// The artifact plan from the assistant or active assistant of squad is used to generate the artifact.
    /// Currently the only supported fields of assistant artifact plan are:
    /// - structuredOutputIds
    public let artifact: Artifact?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        name: String? = nil,
        status: SessionStatus? = nil,
        expirationSeconds: Double? = nil,
        assistantId: String? = nil,
        assistant: CreateAssistantDto? = nil,
        squadId: String? = nil,
        squad: CreateSquadDto? = nil,
        messages: [SessionMessagesItem]? = nil,
        customer: CreateCustomerDto? = nil,
        phoneNumberId: String? = nil,
        phoneNumber: ImportTwilioPhoneNumberDto? = nil,
        artifact: Artifact? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.status = status
        self.expirationSeconds = expirationSeconds
        self.assistantId = assistantId
        self.assistant = assistant
        self.squadId = squadId
        self.squad = squad
        self.messages = messages
        self.customer = customer
        self.phoneNumberId = phoneNumberId
        self.phoneNumber = phoneNumber
        self.artifact = artifact
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.status = try container.decodeIfPresent(SessionStatus.self, forKey: .status)
        self.expirationSeconds = try container.decodeIfPresent(Double.self, forKey: .expirationSeconds)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.squad = try container.decodeIfPresent(CreateSquadDto.self, forKey: .squad)
        self.messages = try container.decodeIfPresent([SessionMessagesItem].self, forKey: .messages)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.phoneNumberId = try container.decodeIfPresent(String.self, forKey: .phoneNumberId)
        self.phoneNumber = try container.decodeIfPresent(ImportTwilioPhoneNumberDto.self, forKey: .phoneNumber)
        self.artifact = try container.decodeIfPresent(Artifact.self, forKey: .artifact)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.expirationSeconds, forKey: .expirationSeconds)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.squad, forKey: .squad)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.phoneNumberId, forKey: .phoneNumberId)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encodeIfPresent(self.artifact, forKey: .artifact)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case orgId
        case createdAt
        case updatedAt
        case name
        case status
        case expirationSeconds
        case assistantId
        case assistant
        case squadId
        case squad
        case messages
        case customer
        case phoneNumberId
        case phoneNumber
        case artifact
    }
}
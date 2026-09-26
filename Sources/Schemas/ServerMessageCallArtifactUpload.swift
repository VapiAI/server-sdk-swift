import Foundation

public struct ServerMessageCallArtifactUpload: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ServerMessageCallArtifactUploadPhoneNumber?
    /// This is the version label (e.g. `v3`) of the assistant the call was
    /// configured with. `null` for inline assistants, squad/workflow calls,
    /// pre-resolution assistant-request messages, and orgs not on
    /// assistant versioning.
    public let assistantVersion: Nullable<String>?
    /// This is the type of the message. "call.artifact.upload" is sent after a call
    /// to report whether each artifact was stored in your own configured storage.
    public let type: ServerMessageCallArtifactUploadType
    /// One entry per artifact whose write targeted your own configured storage,
    /// each reporting whether that artifact was stored successfully. Artifacts that
    /// were not destined for your own storage (Vapi default storage, or no storage
    /// credential configured) are omitted, and this message is sent only when at
    /// least one artifact targeted your own storage.
    public let artifacts: [CallArtifactUploadItem]
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
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumber: ServerMessageCallArtifactUploadPhoneNumber? = nil,
        assistantVersion: Nullable<String>? = nil,
        type: ServerMessageCallArtifactUploadType,
        artifacts: [CallArtifactUploadItem],
        timestamp: Double? = nil,
        artifact: Artifact? = nil,
        assistant: CreateAssistantDto? = nil,
        customer: CreateCustomerDto? = nil,
        call: Call? = nil,
        chat: Chat? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.assistantVersion = assistantVersion
        self.type = type
        self.artifacts = artifacts
        self.timestamp = timestamp
        self.artifact = artifact
        self.assistant = assistant
        self.customer = customer
        self.call = call
        self.chat = chat
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumber = try container.decodeIfPresent(ServerMessageCallArtifactUploadPhoneNumber.self, forKey: .phoneNumber)
        self.assistantVersion = try container.decodeNullableIfPresent(String.self, forKey: .assistantVersion)
        self.type = try container.decode(ServerMessageCallArtifactUploadType.self, forKey: .type)
        self.artifacts = try container.decode([CallArtifactUploadItem].self, forKey: .artifacts)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.artifact = try container.decodeIfPresent(Artifact.self, forKey: .artifact)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.call = try container.decodeIfPresent(Call.self, forKey: .call)
        self.chat = try container.decodeIfPresent(Chat.self, forKey: .chat)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encodeNullableIfPresent(self.assistantVersion, forKey: .assistantVersion)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.artifacts, forKey: .artifacts)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.artifact, forKey: .artifact)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.chat, forKey: .chat)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumber
        case assistantVersion
        case type
        case artifacts
        case timestamp
        case artifact
        case assistant
        case customer
        case call
        case chat
    }
}
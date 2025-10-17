import Foundation

public struct VapiPhoneNumber: Codable, Hashable, Sendable {
    /// This is the fallback destination an inbound call will be transferred to if:
    /// 1. `assistantId` is not set
    /// 2. `squadId` is not set
    /// 3. and, `assistant-request` message to the `serverUrl` fails
    /// 
    /// If this is not set and above conditions are met, the inbound call is hung up with an error message.
    public let fallbackDestination: VapiPhoneNumberFallbackDestination?
    /// This is the hooks that will be used for incoming calls to this phone number.
    public let hooks: [VapiPhoneNumberHooksItem]?
    /// This is the unique identifier for the phone number.
    public let id: String
    /// This is the unique identifier for the org that this phone number belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the phone number was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the phone number was last updated.
    public let updatedAt: Date
    /// This is the status of the phone number.
    public let status: VapiPhoneNumberStatus?
    /// These are the digits of the phone number you purchased from Vapi.
    public let number: String?
    /// This is the name of the phone number. This is just for your own reference.
    public let name: String?
    /// This is the assistant that will be used for incoming calls to this phone number.
    /// 
    /// If neither `assistantId`, `squadId` nor `workflowId` is set, `assistant-request` will be sent to your Server URL. Check `ServerMessage` and `ServerMessageResponse` for the shape of the message and response that is expected.
    public let assistantId: String?
    /// This is the workflow that will be used for incoming calls to this phone number.
    /// 
    /// If neither `assistantId`, `squadId`, nor `workflowId` is set, `assistant-request` will be sent to your Server URL. Check `ServerMessage` and `ServerMessageResponse` for the shape of the message and response that is expected.
    public let workflowId: String?
    /// This is the squad that will be used for incoming calls to this phone number.
    /// 
    /// If neither `assistantId`, `squadId`, nor `workflowId` is set, `assistant-request` will be sent to your Server URL. Check `ServerMessage` and `ServerMessageResponse` for the shape of the message and response that is expected.
    public let squadId: String?
    /// This is where Vapi will send webhooks. You can find all webhooks available along with their shape in ServerMessage schema.
    /// 
    /// The order of precedence is:
    /// 
    /// 1. assistant.server
    /// 2. phoneNumber.server
    /// 3. org.server
    public let server: Server?
    /// This is the area code of the phone number to purchase.
    public let numberDesiredAreaCode: String?
    /// This is the SIP URI of the phone number. You can SIP INVITE this. The assistant attached to this number will answer.
    /// 
    /// This is case-insensitive.
    public let sipUri: String?
    /// This enables authentication for incoming SIP INVITE requests to the `sipUri`.
    /// 
    /// If not set, any username/password to the 401 challenge of the SIP INVITE will be accepted.
    public let authentication: SipAuthentication?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fallbackDestination: VapiPhoneNumberFallbackDestination? = nil,
        hooks: [VapiPhoneNumberHooksItem]? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        status: VapiPhoneNumberStatus? = nil,
        number: String? = nil,
        name: String? = nil,
        assistantId: String? = nil,
        workflowId: String? = nil,
        squadId: String? = nil,
        server: Server? = nil,
        numberDesiredAreaCode: String? = nil,
        sipUri: String? = nil,
        authentication: SipAuthentication? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fallbackDestination = fallbackDestination
        self.hooks = hooks
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.status = status
        self.number = number
        self.name = name
        self.assistantId = assistantId
        self.workflowId = workflowId
        self.squadId = squadId
        self.server = server
        self.numberDesiredAreaCode = numberDesiredAreaCode
        self.sipUri = sipUri
        self.authentication = authentication
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fallbackDestination = try container.decodeIfPresent(VapiPhoneNumberFallbackDestination.self, forKey: .fallbackDestination)
        self.hooks = try container.decodeIfPresent([VapiPhoneNumberHooksItem].self, forKey: .hooks)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.status = try container.decodeIfPresent(VapiPhoneNumberStatus.self, forKey: .status)
        self.number = try container.decodeIfPresent(String.self, forKey: .number)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.numberDesiredAreaCode = try container.decodeIfPresent(String.self, forKey: .numberDesiredAreaCode)
        self.sipUri = try container.decodeIfPresent(String.self, forKey: .sipUri)
        self.authentication = try container.decodeIfPresent(SipAuthentication.self, forKey: .authentication)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fallbackDestination, forKey: .fallbackDestination)
        try container.encodeIfPresent(self.hooks, forKey: .hooks)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.number, forKey: .number)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.server, forKey: .server)
        try container.encodeIfPresent(self.numberDesiredAreaCode, forKey: .numberDesiredAreaCode)
        try container.encodeIfPresent(self.sipUri, forKey: .sipUri)
        try container.encodeIfPresent(self.authentication, forKey: .authentication)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fallbackDestination
        case hooks
        case id
        case orgId
        case createdAt
        case updatedAt
        case status
        case number
        case name
        case assistantId
        case workflowId
        case squadId
        case server
        case numberDesiredAreaCode
        case sipUri
        case authentication
    }
}
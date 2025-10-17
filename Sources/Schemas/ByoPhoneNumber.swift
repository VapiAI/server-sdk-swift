import Foundation

public struct ByoPhoneNumber: Codable, Hashable, Sendable {
    /// This is the fallback destination an inbound call will be transferred to if:
    /// 1. `assistantId` is not set
    /// 2. `squadId` is not set
    /// 3. and, `assistant-request` message to the `serverUrl` fails
    /// 
    /// If this is not set and above conditions are met, the inbound call is hung up with an error message.
    public let fallbackDestination: ByoPhoneNumberFallbackDestination?
    /// This is the hooks that will be used for incoming calls to this phone number.
    public let hooks: [ByoPhoneNumberHooksItem]?
    /// This is the flag to toggle the E164 check for the `number` field. This is an advanced property which should be used if you know your use case requires it.
    /// 
    /// Use cases:
    /// - `false`: To allow non-E164 numbers like `+001234567890`, `1234`, or `abc`. This is useful for dialing out to non-E164 numbers on your SIP trunks.
    /// - `true` (default): To allow only E164 numbers like `+14155551234`. This is standard for PSTN calls.
    /// 
    /// If `false`, the `number` is still required to only contain alphanumeric characters (regex: `/^\+?[a-zA-Z0-9]+$/`).
    /// 
    /// @default true (E164 check is enabled)
    public let numberE164CheckEnabled: Bool?
    /// This is the unique identifier for the phone number.
    public let id: String
    /// This is the unique identifier for the org that this phone number belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the phone number was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the phone number was last updated.
    public let updatedAt: Date
    /// This is the status of the phone number.
    public let status: ByoPhoneNumberStatus?
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
    /// This is the number of the customer.
    public let number: String?
    /// This is the credential of your own SIP trunk or Carrier (type `byo-sip-trunk`) which can be used to make calls to this phone number.
    /// 
    /// You can add the SIP trunk or Carrier credential in the Provider Credentials page on the Dashboard to get the credentialId.
    public let credentialId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fallbackDestination: ByoPhoneNumberFallbackDestination? = nil,
        hooks: [ByoPhoneNumberHooksItem]? = nil,
        numberE164CheckEnabled: Bool? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        status: ByoPhoneNumberStatus? = nil,
        name: String? = nil,
        assistantId: String? = nil,
        workflowId: String? = nil,
        squadId: String? = nil,
        server: Server? = nil,
        number: String? = nil,
        credentialId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fallbackDestination = fallbackDestination
        self.hooks = hooks
        self.numberE164CheckEnabled = numberE164CheckEnabled
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.status = status
        self.name = name
        self.assistantId = assistantId
        self.workflowId = workflowId
        self.squadId = squadId
        self.server = server
        self.number = number
        self.credentialId = credentialId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fallbackDestination = try container.decodeIfPresent(ByoPhoneNumberFallbackDestination.self, forKey: .fallbackDestination)
        self.hooks = try container.decodeIfPresent([ByoPhoneNumberHooksItem].self, forKey: .hooks)
        self.numberE164CheckEnabled = try container.decodeIfPresent(Bool.self, forKey: .numberE164CheckEnabled)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.status = try container.decodeIfPresent(ByoPhoneNumberStatus.self, forKey: .status)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.number = try container.decodeIfPresent(String.self, forKey: .number)
        self.credentialId = try container.decode(String.self, forKey: .credentialId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fallbackDestination, forKey: .fallbackDestination)
        try container.encodeIfPresent(self.hooks, forKey: .hooks)
        try container.encodeIfPresent(self.numberE164CheckEnabled, forKey: .numberE164CheckEnabled)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.server, forKey: .server)
        try container.encodeIfPresent(self.number, forKey: .number)
        try container.encode(self.credentialId, forKey: .credentialId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fallbackDestination
        case hooks
        case numberE164CheckEnabled
        case id
        case orgId
        case createdAt
        case updatedAt
        case status
        case name
        case assistantId
        case workflowId
        case squadId
        case server
        case number
        case credentialId
    }
}
import Foundation

public struct CreateVapiPhoneNumberDto: Codable, Hashable, Sendable {
    /// This is the fallback destination an inbound call will be transferred to if:
    /// 1. `assistantId` is not set
    /// 2. `squadId` is not set
    /// 3. and, `assistant-request` message to the `serverUrl` fails
    /// 
    /// If this is not set and above conditions are met, the inbound call is hung up with an error message.
    public let fallbackDestination: CreateVapiPhoneNumberDtoFallbackDestination?
    /// This is the hooks that will be used for incoming calls to this phone number.
    public let hooks: [CreateVapiPhoneNumberDtoHooksItem]?
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
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fallbackDestination: CreateVapiPhoneNumberDtoFallbackDestination? = nil,
        hooks: [CreateVapiPhoneNumberDtoHooksItem]? = nil,
        numberDesiredAreaCode: String? = nil,
        sipUri: String? = nil,
        authentication: SipAuthentication? = nil,
        name: String? = nil,
        assistantId: String? = nil,
        workflowId: String? = nil,
        squadId: String? = nil,
        server: Server? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fallbackDestination = fallbackDestination
        self.hooks = hooks
        self.numberDesiredAreaCode = numberDesiredAreaCode
        self.sipUri = sipUri
        self.authentication = authentication
        self.name = name
        self.assistantId = assistantId
        self.workflowId = workflowId
        self.squadId = squadId
        self.server = server
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fallbackDestination = try container.decodeIfPresent(CreateVapiPhoneNumberDtoFallbackDestination.self, forKey: .fallbackDestination)
        self.hooks = try container.decodeIfPresent([CreateVapiPhoneNumberDtoHooksItem].self, forKey: .hooks)
        self.numberDesiredAreaCode = try container.decodeIfPresent(String.self, forKey: .numberDesiredAreaCode)
        self.sipUri = try container.decodeIfPresent(String.self, forKey: .sipUri)
        self.authentication = try container.decodeIfPresent(SipAuthentication.self, forKey: .authentication)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fallbackDestination, forKey: .fallbackDestination)
        try container.encodeIfPresent(self.hooks, forKey: .hooks)
        try container.encodeIfPresent(self.numberDesiredAreaCode, forKey: .numberDesiredAreaCode)
        try container.encodeIfPresent(self.sipUri, forKey: .sipUri)
        try container.encodeIfPresent(self.authentication, forKey: .authentication)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.server, forKey: .server)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fallbackDestination
        case hooks
        case numberDesiredAreaCode
        case sipUri
        case authentication
        case name
        case assistantId
        case workflowId
        case squadId
        case server
    }
}
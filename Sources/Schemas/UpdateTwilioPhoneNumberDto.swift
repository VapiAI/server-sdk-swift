import Foundation

public struct UpdateTwilioPhoneNumberDto: Codable, Hashable, Sendable {
    /// This is the fallback destination an inbound call will be transferred to if:
    /// 1. `assistantId` is not set
    /// 2. `squadId` is not set
    /// 3. and, `assistant-request` message to the `serverUrl` fails
    /// 
    /// If this is not set and above conditions are met, the inbound call is hung up with an error message.
    public let fallbackDestination: UpdateTwilioPhoneNumberDtoFallbackDestination?
    /// This is the hooks that will be used for incoming calls to this phone number.
    public let hooks: [UpdateTwilioPhoneNumberDtoHooksItem]?
    /// Controls whether Vapi sets the messaging webhook URL on the Twilio number during import.
    /// 
    /// If set to `false`, Vapi will not update the Twilio messaging URL, leaving it as is.
    /// If `true` or omitted (default), Vapi will configure both the voice and messaging URLs.
    /// 
    /// @default true
    public let smsEnabled: Bool?
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
    /// These are the digits of the phone number you own on your Twilio.
    public let number: String?
    /// This is the Twilio Account SID for the phone number.
    public let twilioAccountSid: String?
    /// This is the Twilio Auth Token for the phone number.
    public let twilioAuthToken: String?
    /// This is the Twilio API Key for the phone number.
    public let twilioApiKey: String?
    /// This is the Twilio API Secret for the phone number.
    public let twilioApiSecret: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fallbackDestination: UpdateTwilioPhoneNumberDtoFallbackDestination? = nil,
        hooks: [UpdateTwilioPhoneNumberDtoHooksItem]? = nil,
        smsEnabled: Bool? = nil,
        name: String? = nil,
        assistantId: String? = nil,
        workflowId: String? = nil,
        squadId: String? = nil,
        server: Server? = nil,
        number: String? = nil,
        twilioAccountSid: String? = nil,
        twilioAuthToken: String? = nil,
        twilioApiKey: String? = nil,
        twilioApiSecret: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fallbackDestination = fallbackDestination
        self.hooks = hooks
        self.smsEnabled = smsEnabled
        self.name = name
        self.assistantId = assistantId
        self.workflowId = workflowId
        self.squadId = squadId
        self.server = server
        self.number = number
        self.twilioAccountSid = twilioAccountSid
        self.twilioAuthToken = twilioAuthToken
        self.twilioApiKey = twilioApiKey
        self.twilioApiSecret = twilioApiSecret
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fallbackDestination = try container.decodeIfPresent(UpdateTwilioPhoneNumberDtoFallbackDestination.self, forKey: .fallbackDestination)
        self.hooks = try container.decodeIfPresent([UpdateTwilioPhoneNumberDtoHooksItem].self, forKey: .hooks)
        self.smsEnabled = try container.decodeIfPresent(Bool.self, forKey: .smsEnabled)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.number = try container.decodeIfPresent(String.self, forKey: .number)
        self.twilioAccountSid = try container.decodeIfPresent(String.self, forKey: .twilioAccountSid)
        self.twilioAuthToken = try container.decodeIfPresent(String.self, forKey: .twilioAuthToken)
        self.twilioApiKey = try container.decodeIfPresent(String.self, forKey: .twilioApiKey)
        self.twilioApiSecret = try container.decodeIfPresent(String.self, forKey: .twilioApiSecret)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fallbackDestination, forKey: .fallbackDestination)
        try container.encodeIfPresent(self.hooks, forKey: .hooks)
        try container.encodeIfPresent(self.smsEnabled, forKey: .smsEnabled)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encodeIfPresent(self.squadId, forKey: .squadId)
        try container.encodeIfPresent(self.server, forKey: .server)
        try container.encodeIfPresent(self.number, forKey: .number)
        try container.encodeIfPresent(self.twilioAccountSid, forKey: .twilioAccountSid)
        try container.encodeIfPresent(self.twilioAuthToken, forKey: .twilioAuthToken)
        try container.encodeIfPresent(self.twilioApiKey, forKey: .twilioApiKey)
        try container.encodeIfPresent(self.twilioApiSecret, forKey: .twilioApiSecret)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fallbackDestination
        case hooks
        case smsEnabled
        case name
        case assistantId
        case workflowId
        case squadId
        case server
        case number
        case twilioAccountSid
        case twilioAuthToken
        case twilioApiKey
        case twilioApiSecret
    }
}
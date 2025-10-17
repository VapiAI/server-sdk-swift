import Foundation

public struct ImportTwilioPhoneNumberDto: Codable, Hashable, Sendable {
    /// This is the fallback destination an inbound call will be transferred to if:
    /// 1. `assistantId` is not set
    /// 2. `squadId` is not set
    /// 3. and, `assistant-request` message to the `serverUrl` fails
    /// 
    /// If this is not set and above conditions are met, the inbound call is hung up with an error message.
    public let fallbackDestination: ImportTwilioPhoneNumberDtoFallbackDestination?
    /// This is the hooks that will be used for incoming calls to this phone number.
    public let hooks: [ImportTwilioPhoneNumberDtoHooksItem]?
    /// Controls whether Vapi sets the messaging webhook URL on the Twilio number during import.
    /// 
    /// If set to `false`, Vapi will not update the Twilio messaging URL, leaving it as is.
    /// If `true` or omitted (default), Vapi will configure both the voice and messaging URLs.
    /// 
    /// @default true
    public let smsEnabled: Bool?
    /// These are the digits of the phone number you own on your Twilio.
    public let twilioPhoneNumber: String
    /// This is your Twilio Account SID that will be used to handle this phone number.
    public let twilioAccountSid: String
    /// This is the Twilio Auth Token that will be used to handle this phone number.
    public let twilioAuthToken: String?
    /// This is the Twilio API Key that will be used to handle this phone number. If AuthToken is provided, this will be ignored.
    public let twilioApiKey: String?
    /// This is the Twilio API Secret that will be used to handle this phone number. If AuthToken is provided, this will be ignored.
    public let twilioApiSecret: String?
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
        fallbackDestination: ImportTwilioPhoneNumberDtoFallbackDestination? = nil,
        hooks: [ImportTwilioPhoneNumberDtoHooksItem]? = nil,
        smsEnabled: Bool? = nil,
        twilioPhoneNumber: String,
        twilioAccountSid: String,
        twilioAuthToken: String? = nil,
        twilioApiKey: String? = nil,
        twilioApiSecret: String? = nil,
        name: String? = nil,
        assistantId: String? = nil,
        workflowId: String? = nil,
        squadId: String? = nil,
        server: Server? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fallbackDestination = fallbackDestination
        self.hooks = hooks
        self.smsEnabled = smsEnabled
        self.twilioPhoneNumber = twilioPhoneNumber
        self.twilioAccountSid = twilioAccountSid
        self.twilioAuthToken = twilioAuthToken
        self.twilioApiKey = twilioApiKey
        self.twilioApiSecret = twilioApiSecret
        self.name = name
        self.assistantId = assistantId
        self.workflowId = workflowId
        self.squadId = squadId
        self.server = server
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fallbackDestination = try container.decodeIfPresent(ImportTwilioPhoneNumberDtoFallbackDestination.self, forKey: .fallbackDestination)
        self.hooks = try container.decodeIfPresent([ImportTwilioPhoneNumberDtoHooksItem].self, forKey: .hooks)
        self.smsEnabled = try container.decodeIfPresent(Bool.self, forKey: .smsEnabled)
        self.twilioPhoneNumber = try container.decode(String.self, forKey: .twilioPhoneNumber)
        self.twilioAccountSid = try container.decode(String.self, forKey: .twilioAccountSid)
        self.twilioAuthToken = try container.decodeIfPresent(String.self, forKey: .twilioAuthToken)
        self.twilioApiKey = try container.decodeIfPresent(String.self, forKey: .twilioApiKey)
        self.twilioApiSecret = try container.decodeIfPresent(String.self, forKey: .twilioApiSecret)
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
        try container.encodeIfPresent(self.smsEnabled, forKey: .smsEnabled)
        try container.encode(self.twilioPhoneNumber, forKey: .twilioPhoneNumber)
        try container.encode(self.twilioAccountSid, forKey: .twilioAccountSid)
        try container.encodeIfPresent(self.twilioAuthToken, forKey: .twilioAuthToken)
        try container.encodeIfPresent(self.twilioApiKey, forKey: .twilioApiKey)
        try container.encodeIfPresent(self.twilioApiSecret, forKey: .twilioApiSecret)
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
        case smsEnabled
        case twilioPhoneNumber
        case twilioAccountSid
        case twilioAuthToken
        case twilioApiKey
        case twilioApiSecret
        case name
        case assistantId
        case workflowId
        case squadId
        case server
    }
}
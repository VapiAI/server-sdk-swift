import Foundation

public enum PhoneNumbersUpdateRequest: Codable, Hashable, Sendable {
    case byoPhoneNumber(ByoPhoneNumber)
    case twilio(Twilio)
    case vonage(Vonage)
    case vapi(Vapi)
    case telnyx(Telnyx)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "byo-phone-number":
            self = .byoPhoneNumber(try ByoPhoneNumber(from: decoder))
        case "twilio":
            self = .twilio(try Twilio(from: decoder))
        case "vonage":
            self = .vonage(try Vonage(from: decoder))
        case "vapi":
            self = .vapi(try Vapi(from: decoder))
        case "telnyx":
            self = .telnyx(try Telnyx(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        switch self {
        case .byoPhoneNumber(let data):
            try data.encode(to: encoder)
        case .twilio(let data):
            try data.encode(to: encoder)
        case .vonage(let data):
            try data.encode(to: encoder)
        case .vapi(let data):
            try data.encode(to: encoder)
        case .telnyx(let data):
            try data.encode(to: encoder)
        }
    }

    public struct ByoPhoneNumber: Codable, Hashable, Sendable {
        public let provider: String = "byo-phone-number"
        /// This is the fallback destination an inbound call will be transferred to if:
        /// 1. `assistantId` is not set
        /// 2. `squadId` is not set
        /// 3. and, `assistant-request` message to the `serverUrl` fails
        /// 
        /// If this is not set and above conditions are met, the inbound call is hung up with an error message.
        public let fallbackDestination: UpdateByoPhoneNumberDtoFallbackDestination?
        /// This is the hooks that will be used for incoming calls to this phone number.
        public let hooks: [UpdateByoPhoneNumberDtoHooksItem]?
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
        public let credentialId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            fallbackDestination: UpdateByoPhoneNumberDtoFallbackDestination? = nil,
            hooks: [UpdateByoPhoneNumberDtoHooksItem]? = nil,
            numberE164CheckEnabled: Bool? = nil,
            name: String? = nil,
            assistantId: String? = nil,
            workflowId: String? = nil,
            squadId: String? = nil,
            server: Server? = nil,
            number: String? = nil,
            credentialId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.fallbackDestination = fallbackDestination
            self.hooks = hooks
            self.numberE164CheckEnabled = numberE164CheckEnabled
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
            self.fallbackDestination = try container.decodeIfPresent(UpdateByoPhoneNumberDtoFallbackDestination.self, forKey: .fallbackDestination)
            self.hooks = try container.decodeIfPresent([UpdateByoPhoneNumberDtoHooksItem].self, forKey: .hooks)
            self.numberE164CheckEnabled = try container.decodeIfPresent(Bool.self, forKey: .numberE164CheckEnabled)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
            self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
            self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.number = try container.decodeIfPresent(String.self, forKey: .number)
            self.credentialId = try container.decodeIfPresent(String.self, forKey: .credentialId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.fallbackDestination, forKey: .fallbackDestination)
            try container.encodeIfPresent(self.hooks, forKey: .hooks)
            try container.encodeIfPresent(self.numberE164CheckEnabled, forKey: .numberE164CheckEnabled)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
            try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
            try container.encodeIfPresent(self.squadId, forKey: .squadId)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encodeIfPresent(self.number, forKey: .number)
            try container.encodeIfPresent(self.credentialId, forKey: .credentialId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case fallbackDestination
            case hooks
            case numberE164CheckEnabled
            case name
            case assistantId
            case workflowId
            case squadId
            case server
            case number
            case credentialId
        }
    }

    public struct Twilio: Codable, Hashable, Sendable {
        public let provider: String = "twilio"
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
            try container.encode(self.provider, forKey: .provider)
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
            case provider
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

    public struct Vonage: Codable, Hashable, Sendable {
        public let provider: String = "vonage"
        /// This is the fallback destination an inbound call will be transferred to if:
        /// 1. `assistantId` is not set
        /// 2. `squadId` is not set
        /// 3. and, `assistant-request` message to the `serverUrl` fails
        /// 
        /// If this is not set and above conditions are met, the inbound call is hung up with an error message.
        public let fallbackDestination: UpdateVonagePhoneNumberDtoFallbackDestination?
        /// This is the hooks that will be used for incoming calls to this phone number.
        public let hooks: [UpdateVonagePhoneNumberDtoHooksItem]?
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
        /// These are the digits of the phone number you own on your Vonage.
        public let number: String?
        /// This is the credential you added in dashboard.vapi.ai/keys. This is used to configure the number to send inbound calls to Vapi, make outbound calls and do live call updates like transfers and hangups.
        public let credentialId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            fallbackDestination: UpdateVonagePhoneNumberDtoFallbackDestination? = nil,
            hooks: [UpdateVonagePhoneNumberDtoHooksItem]? = nil,
            name: String? = nil,
            assistantId: String? = nil,
            workflowId: String? = nil,
            squadId: String? = nil,
            server: Server? = nil,
            number: String? = nil,
            credentialId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.fallbackDestination = fallbackDestination
            self.hooks = hooks
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
            self.fallbackDestination = try container.decodeIfPresent(UpdateVonagePhoneNumberDtoFallbackDestination.self, forKey: .fallbackDestination)
            self.hooks = try container.decodeIfPresent([UpdateVonagePhoneNumberDtoHooksItem].self, forKey: .hooks)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
            self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
            self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.number = try container.decodeIfPresent(String.self, forKey: .number)
            self.credentialId = try container.decodeIfPresent(String.self, forKey: .credentialId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.fallbackDestination, forKey: .fallbackDestination)
            try container.encodeIfPresent(self.hooks, forKey: .hooks)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
            try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
            try container.encodeIfPresent(self.squadId, forKey: .squadId)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encodeIfPresent(self.number, forKey: .number)
            try container.encodeIfPresent(self.credentialId, forKey: .credentialId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case fallbackDestination
            case hooks
            case name
            case assistantId
            case workflowId
            case squadId
            case server
            case number
            case credentialId
        }
    }

    public struct Vapi: Codable, Hashable, Sendable {
        public let provider: String = "vapi"
        /// This is the fallback destination an inbound call will be transferred to if:
        /// 1. `assistantId` is not set
        /// 2. `squadId` is not set
        /// 3. and, `assistant-request` message to the `serverUrl` fails
        /// 
        /// If this is not set and above conditions are met, the inbound call is hung up with an error message.
        public let fallbackDestination: UpdateVapiPhoneNumberDtoFallbackDestination?
        /// This is the hooks that will be used for incoming calls to this phone number.
        public let hooks: [UpdateVapiPhoneNumberDtoHooksItem]?
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
            fallbackDestination: UpdateVapiPhoneNumberDtoFallbackDestination? = nil,
            hooks: [UpdateVapiPhoneNumberDtoHooksItem]? = nil,
            name: String? = nil,
            assistantId: String? = nil,
            workflowId: String? = nil,
            squadId: String? = nil,
            server: Server? = nil,
            sipUri: String? = nil,
            authentication: SipAuthentication? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.fallbackDestination = fallbackDestination
            self.hooks = hooks
            self.name = name
            self.assistantId = assistantId
            self.workflowId = workflowId
            self.squadId = squadId
            self.server = server
            self.sipUri = sipUri
            self.authentication = authentication
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.fallbackDestination = try container.decodeIfPresent(UpdateVapiPhoneNumberDtoFallbackDestination.self, forKey: .fallbackDestination)
            self.hooks = try container.decodeIfPresent([UpdateVapiPhoneNumberDtoHooksItem].self, forKey: .hooks)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
            self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
            self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.sipUri = try container.decodeIfPresent(String.self, forKey: .sipUri)
            self.authentication = try container.decodeIfPresent(SipAuthentication.self, forKey: .authentication)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.fallbackDestination, forKey: .fallbackDestination)
            try container.encodeIfPresent(self.hooks, forKey: .hooks)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
            try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
            try container.encodeIfPresent(self.squadId, forKey: .squadId)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encodeIfPresent(self.sipUri, forKey: .sipUri)
            try container.encodeIfPresent(self.authentication, forKey: .authentication)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case fallbackDestination
            case hooks
            case name
            case assistantId
            case workflowId
            case squadId
            case server
            case sipUri
            case authentication
        }
    }

    public struct Telnyx: Codable, Hashable, Sendable {
        public let provider: String = "telnyx"
        /// This is the fallback destination an inbound call will be transferred to if:
        /// 1. `assistantId` is not set
        /// 2. `squadId` is not set
        /// 3. and, `assistant-request` message to the `serverUrl` fails
        /// 
        /// If this is not set and above conditions are met, the inbound call is hung up with an error message.
        public let fallbackDestination: UpdateTelnyxPhoneNumberDtoFallbackDestination?
        /// This is the hooks that will be used for incoming calls to this phone number.
        public let hooks: [UpdateTelnyxPhoneNumberDtoHooksItem]?
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
        /// These are the digits of the phone number you own on your Telnyx.
        public let number: String?
        /// This is the credential you added in dashboard.vapi.ai/keys. This is used to configure the number to send inbound calls to Vapi, make outbound calls and do live call updates like transfers and hangups.
        public let credentialId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            fallbackDestination: UpdateTelnyxPhoneNumberDtoFallbackDestination? = nil,
            hooks: [UpdateTelnyxPhoneNumberDtoHooksItem]? = nil,
            name: String? = nil,
            assistantId: String? = nil,
            workflowId: String? = nil,
            squadId: String? = nil,
            server: Server? = nil,
            number: String? = nil,
            credentialId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.fallbackDestination = fallbackDestination
            self.hooks = hooks
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
            self.fallbackDestination = try container.decodeIfPresent(UpdateTelnyxPhoneNumberDtoFallbackDestination.self, forKey: .fallbackDestination)
            self.hooks = try container.decodeIfPresent([UpdateTelnyxPhoneNumberDtoHooksItem].self, forKey: .hooks)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
            self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
            self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.number = try container.decodeIfPresent(String.self, forKey: .number)
            self.credentialId = try container.decodeIfPresent(String.self, forKey: .credentialId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.fallbackDestination, forKey: .fallbackDestination)
            try container.encodeIfPresent(self.hooks, forKey: .hooks)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
            try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
            try container.encodeIfPresent(self.squadId, forKey: .squadId)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encodeIfPresent(self.number, forKey: .number)
            try container.encodeIfPresent(self.credentialId, forKey: .credentialId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case fallbackDestination
            case hooks
            case name
            case assistantId
            case workflowId
            case squadId
            case server
            case number
            case credentialId
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}
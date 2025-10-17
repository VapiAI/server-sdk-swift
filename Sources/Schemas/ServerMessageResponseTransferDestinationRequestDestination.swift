import Foundation

/// This is the destination you'd like the call to be transferred to.
public enum ServerMessageResponseTransferDestinationRequestDestination: Codable, Hashable, Sendable {
    case assistant(Assistant)
    case number(Number)
    case sip(Sip)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "assistant":
            self = .assistant(try Assistant(from: decoder))
        case "number":
            self = .number(try Number(from: decoder))
        case "sip":
            self = .sip(try Sip(from: decoder))
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
        case .assistant(let data):
            try data.encode(to: encoder)
        case .number(let data):
            try data.encode(to: encoder)
        case .sip(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Assistant: Codable, Hashable, Sendable {
        public let type: String = "assistant"
        /// This is spoken to the customer before connecting them to the destination.
        /// 
        /// Usage:
        /// - If this is not provided and transfer tool messages is not provided, default is "Transferring the call now".
        /// - If set to "", nothing is spoken. This is useful when you want to silently transfer. This is especially useful when transferring between assistants in a squad. In this scenario, you likely also want to set `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message` for the destination assistant.
        /// 
        /// This accepts a string or a ToolMessageStart class. Latter is useful if you want to specify multiple messages for different languages through the `contents` field.
        public let message: TransferDestinationAssistantMessage?
        /// This is the mode to use for the transfer. Defaults to `rolling-history`.
        /// 
        /// - `rolling-history`: This is the default mode. It keeps the entire conversation history and appends the new assistant's system message on transfer.
        /// 
        ///   Example:
        /// 
        ///   Pre-transfer:
        ///     system: assistant1 system message
        ///     assistant: assistant1 first message
        ///     user: hey, good morning
        ///     assistant: how can i help?
        ///     user: i need help with my account
        ///     assistant: (destination.message)
        /// 
        ///   Post-transfer:
        ///     system: assistant1 system message
        ///     assistant: assistant1 first message
        ///     user: hey, good morning
        ///     assistant: how can i help?
        ///     user: i need help with my account
        ///     assistant: (destination.message)
        ///     system: assistant2 system message
        ///     assistant: assistant2 first message (or model generated if firstMessageMode is set to `assistant-speaks-first-with-model-generated-message`)
        /// 
        /// - `swap-system-message-in-history`: This replaces the original system message with the new assistant's system message on transfer.
        /// 
        ///   Example:
        /// 
        ///   Pre-transfer:
        ///     system: assistant1 system message
        ///     assistant: assistant1 first message
        ///     user: hey, good morning
        ///     assistant: how can i help?
        ///     user: i need help with my account
        ///     assistant: (destination.message)
        /// 
        ///   Post-transfer:
        ///     system: assistant2 system message
        ///     assistant: assistant1 first message
        ///     user: hey, good morning
        ///     assistant: how can i help?
        ///     user: i need help with my account
        ///     assistant: (destination.message)
        ///     assistant: assistant2 first message (or model generated if firstMessageMode is set to `assistant-speaks-first-with-model-generated-message`)
        /// 
        /// - `delete-history`: This deletes the entire conversation history on transfer.
        /// 
        ///   Example:
        /// 
        ///   Pre-transfer:
        ///     system: assistant1 system message
        ///     assistant: assistant1 first message
        ///     user: hey, good morning
        ///     assistant: how can i help?
        ///     user: i need help with my account
        ///     assistant: (destination.message)
        /// 
        ///   Post-transfer:
        ///     system: assistant2 system message
        ///     assistant: assistant2 first message
        ///     user: Yes, please
        ///     assistant: how can i help?
        ///     user: i need help with my account
        /// 
        /// - `swap-system-message-in-history-and-remove-transfer-tool-messages`: This replaces the original system message with the new assistant's system message on transfer and removes transfer tool messages from conversation history sent to the LLM.
        /// 
        ///   Example:
        /// 
        ///   Pre-transfer:
        ///     system: assistant1 system message
        ///     assistant: assistant1 first message
        ///     user: hey, good morning
        ///     assistant: how can i help?
        ///     user: i need help with my account
        ///     transfer-tool
        ///     transfer-tool-result
        ///     assistant: (destination.message)
        /// 
        ///   Post-transfer:
        ///     system: assistant2 system message
        ///     assistant: assistant1 first message
        ///     user: hey, good morning
        ///     assistant: how can i help?
        ///     user: i need help with my account
        ///     assistant: (destination.message)
        ///     assistant: assistant2 first message (or model generated if firstMessageMode is set to `assistant-speaks-first-with-model-generated-message`)
        /// 
        /// @default 'rolling-history'
        public let transferMode: TransferMode?
        /// This is the assistant to transfer the call to.
        public let assistantName: String
        /// This is the description of the destination, used by the AI to choose when and how to transfer the call.
        public let description: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            message: TransferDestinationAssistantMessage? = nil,
            transferMode: TransferMode? = nil,
            assistantName: String,
            description: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.message = message
            self.transferMode = transferMode
            self.assistantName = assistantName
            self.description = description
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.message = try container.decodeIfPresent(TransferDestinationAssistantMessage.self, forKey: .message)
            self.transferMode = try container.decodeIfPresent(TransferMode.self, forKey: .transferMode)
            self.assistantName = try container.decode(String.self, forKey: .assistantName)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.message, forKey: .message)
            try container.encodeIfPresent(self.transferMode, forKey: .transferMode)
            try container.encode(self.assistantName, forKey: .assistantName)
            try container.encodeIfPresent(self.description, forKey: .description)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case message
            case transferMode
            case assistantName
            case description
        }
    }

    public struct Number: Codable, Hashable, Sendable {
        public let type: String = "number"
        /// This is spoken to the customer before connecting them to the destination.
        /// 
        /// Usage:
        /// - If this is not provided and transfer tool messages is not provided, default is "Transferring the call now".
        /// - If set to "", nothing is spoken. This is useful when you want to silently transfer. This is especially useful when transferring between assistants in a squad. In this scenario, you likely also want to set `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message` for the destination assistant.
        /// 
        /// This accepts a string or a ToolMessageStart class. Latter is useful if you want to specify multiple messages for different languages through the `contents` field.
        public let message: TransferDestinationNumberMessage?
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
        /// This is the phone number to transfer the call to.
        public let number: String
        /// This is the extension to dial after transferring the call to the `number`.
        public let `extension`: String?
        /// This is the caller ID to use when transferring the call to the `number`.
        /// 
        /// Usage:
        /// - If not provided, the caller ID will be the number the call is coming from. Example, +14151111111 calls in to and the assistant transfers out to +16470000000. +16470000000 will see +14151111111 as the caller.
        /// - To change this behavior, provide a `callerId`.
        /// - Set to '{{customer.number}}' to always use the customer's number as the caller ID.
        /// - Set to '{{phoneNumber.number}}' to always use the phone number of the assistant as the caller ID.
        /// - Set to any E164 number to always use that number as the caller ID. This needs to be a number that is owned or verified by your Transport provider like Twilio.
        /// 
        /// For Twilio, you can read up more here: https://www.twilio.com/docs/voice/twiml/dial#callerid
        public let callerId: String?
        /// This configures how transfer is executed and the experience of the destination party receiving the call. Defaults to `blind-transfer`.
        /// 
        /// @default `transferPlan.mode='blind-transfer'`
        public let transferPlan: TransferPlan?
        /// This is the description of the destination, used by the AI to choose when and how to transfer the call.
        public let description: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            message: TransferDestinationNumberMessage? = nil,
            numberE164CheckEnabled: Bool? = nil,
            number: String,
            extension: String? = nil,
            callerId: String? = nil,
            transferPlan: TransferPlan? = nil,
            description: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.message = message
            self.numberE164CheckEnabled = numberE164CheckEnabled
            self.number = number
            self.extension = `extension`
            self.callerId = callerId
            self.transferPlan = transferPlan
            self.description = description
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.message = try container.decodeIfPresent(TransferDestinationNumberMessage.self, forKey: .message)
            self.numberE164CheckEnabled = try container.decodeIfPresent(Bool.self, forKey: .numberE164CheckEnabled)
            self.number = try container.decode(String.self, forKey: .number)
            self.extension = try container.decodeIfPresent(String.self, forKey: .extension)
            self.callerId = try container.decodeIfPresent(String.self, forKey: .callerId)
            self.transferPlan = try container.decodeIfPresent(TransferPlan.self, forKey: .transferPlan)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.message, forKey: .message)
            try container.encodeIfPresent(self.numberE164CheckEnabled, forKey: .numberE164CheckEnabled)
            try container.encode(self.number, forKey: .number)
            try container.encodeIfPresent(self.extension, forKey: .extension)
            try container.encodeIfPresent(self.callerId, forKey: .callerId)
            try container.encodeIfPresent(self.transferPlan, forKey: .transferPlan)
            try container.encodeIfPresent(self.description, forKey: .description)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case message
            case numberE164CheckEnabled
            case number
            case `extension`
            case callerId
            case transferPlan
            case description
        }
    }

    public struct Sip: Codable, Hashable, Sendable {
        public let type: String = "sip"
        /// This is spoken to the customer before connecting them to the destination.
        /// 
        /// Usage:
        /// - If this is not provided and transfer tool messages is not provided, default is "Transferring the call now".
        /// - If set to "", nothing is spoken. This is useful when you want to silently transfer. This is especially useful when transferring between assistants in a squad. In this scenario, you likely also want to set `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message` for the destination assistant.
        /// 
        /// This accepts a string or a ToolMessageStart class. Latter is useful if you want to specify multiple messages for different languages through the `contents` field.
        public let message: TransferDestinationSipMessage?
        /// This is the SIP URI to transfer the call to.
        public let sipUri: String
        /// This configures how transfer is executed and the experience of the destination party receiving the call. Defaults to `blind-transfer`.
        /// 
        /// @default `transferPlan.mode='blind-transfer'`
        public let transferPlan: TransferPlan?
        /// These are custom headers to be added to SIP refer during transfer call.
        public let sipHeaders: [String: JSONValue]?
        /// This is the description of the destination, used by the AI to choose when and how to transfer the call.
        public let description: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            message: TransferDestinationSipMessage? = nil,
            sipUri: String,
            transferPlan: TransferPlan? = nil,
            sipHeaders: [String: JSONValue]? = nil,
            description: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.message = message
            self.sipUri = sipUri
            self.transferPlan = transferPlan
            self.sipHeaders = sipHeaders
            self.description = description
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.message = try container.decodeIfPresent(TransferDestinationSipMessage.self, forKey: .message)
            self.sipUri = try container.decode(String.self, forKey: .sipUri)
            self.transferPlan = try container.decodeIfPresent(TransferPlan.self, forKey: .transferPlan)
            self.sipHeaders = try container.decodeIfPresent([String: JSONValue].self, forKey: .sipHeaders)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.message, forKey: .message)
            try container.encode(self.sipUri, forKey: .sipUri)
            try container.encodeIfPresent(self.transferPlan, forKey: .transferPlan)
            try container.encodeIfPresent(self.sipHeaders, forKey: .sipHeaders)
            try container.encodeIfPresent(self.description, forKey: .description)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case message
            case sipUri
            case transferPlan
            case sipHeaders
            case description
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
import Foundation

/// These are the messages that can be sent from client-side SDKs to control the call.
public enum ClientInboundMessageMessage: Codable, Hashable, Sendable {
    case addMessage(AddMessage)
    case control(Control)
    case say(Say)
    case endCall(EndCall)
    case transfer(Transfer)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "add-message":
            self = .addMessage(try AddMessage(from: decoder))
        case "control":
            self = .control(try Control(from: decoder))
        case "say":
            self = .say(try Say(from: decoder))
        case "end-call":
            self = .endCall(try EndCall(from: decoder))
        case "transfer":
            self = .transfer(try Transfer(from: decoder))
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
        case .addMessage(let data):
            try data.encode(to: encoder)
        case .control(let data):
            try data.encode(to: encoder)
        case .say(let data):
            try data.encode(to: encoder)
        case .endCall(let data):
            try data.encode(to: encoder)
        case .transfer(let data):
            try data.encode(to: encoder)
        }
    }

    public struct AddMessage: Codable, Hashable, Sendable {
        public let type: String = "add-message"
        /// This is the message to add to the conversation.
        public let message: OpenAiMessage
        /// This is the flag to trigger a response, or to insert the message into the conversation history silently. Defaults to `true`.
        /// 
        /// Usage:
        /// - Use `true` to trigger a response.
        /// - Use `false` to insert the message into the conversation history silently.
        /// 
        /// @default true
        public let triggerResponseEnabled: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            message: OpenAiMessage,
            triggerResponseEnabled: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.message = message
            self.triggerResponseEnabled = triggerResponseEnabled
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.message = try container.decode(OpenAiMessage.self, forKey: .message)
            self.triggerResponseEnabled = try container.decodeIfPresent(Bool.self, forKey: .triggerResponseEnabled)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.message, forKey: .message)
            try container.encodeIfPresent(self.triggerResponseEnabled, forKey: .triggerResponseEnabled)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case message
            case triggerResponseEnabled
        }
    }

    public struct Control: Codable, Hashable, Sendable {
        public let type: String = "control"
        /// This is the control action
        public let control: ClientInboundMessageControlControl
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            control: ClientInboundMessageControlControl,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.control = control
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.control = try container.decode(ClientInboundMessageControlControl.self, forKey: .control)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.control, forKey: .control)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case control
        }
    }

    public struct Say: Codable, Hashable, Sendable {
        public let type: String = "say"
        /// This is the flag for whether the message should replace existing assistant speech.
        /// 
        /// @default false
        public let interruptAssistantEnabled: Bool?
        /// This is the content to say.
        public let content: String?
        /// This is the flag to end call after content is spoken.
        public let endCallAfterSpoken: Bool?
        /// This is the flag for whether the message is interruptible by the user.
        public let interruptionsEnabled: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            interruptAssistantEnabled: Bool? = nil,
            content: String? = nil,
            endCallAfterSpoken: Bool? = nil,
            interruptionsEnabled: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.interruptAssistantEnabled = interruptAssistantEnabled
            self.content = content
            self.endCallAfterSpoken = endCallAfterSpoken
            self.interruptionsEnabled = interruptionsEnabled
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.interruptAssistantEnabled = try container.decodeIfPresent(Bool.self, forKey: .interruptAssistantEnabled)
            self.content = try container.decodeIfPresent(String.self, forKey: .content)
            self.endCallAfterSpoken = try container.decodeIfPresent(Bool.self, forKey: .endCallAfterSpoken)
            self.interruptionsEnabled = try container.decodeIfPresent(Bool.self, forKey: .interruptionsEnabled)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.interruptAssistantEnabled, forKey: .interruptAssistantEnabled)
            try container.encodeIfPresent(self.content, forKey: .content)
            try container.encodeIfPresent(self.endCallAfterSpoken, forKey: .endCallAfterSpoken)
            try container.encodeIfPresent(self.interruptionsEnabled, forKey: .interruptionsEnabled)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case interruptAssistantEnabled
            case content
            case endCallAfterSpoken
            case interruptionsEnabled
        }
    }

    public struct EndCall: Codable, Hashable, Sendable {
        public let type: String = "end-call"
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            self.additionalProperties = try decoder.decodeAdditionalProperties(knownKeys: [])
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
        }
    }

    public struct Transfer: Codable, Hashable, Sendable {
        public let type: String = "transfer"
        /// This is the destination to transfer the call to.
        public let destination: ClientInboundMessageTransferDestination?
        /// This is the content to say.
        public let content: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            destination: ClientInboundMessageTransferDestination? = nil,
            content: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.destination = destination
            self.content = content
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.destination = try container.decodeIfPresent(ClientInboundMessageTransferDestination.self, forKey: .destination)
            self.content = try container.decodeIfPresent(String.self, forKey: .content)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.destination, forKey: .destination)
            try container.encodeIfPresent(self.content, forKey: .content)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case destination
            case content
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
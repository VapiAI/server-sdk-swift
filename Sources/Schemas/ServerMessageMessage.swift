import Foundation

/// These are all the messages that can be sent to your server before, after and during the call. Configure the messages you'd like to receive in `assistant.serverMessages`.
/// 
/// The server where the message is sent is determined by the following precedence order:
/// 
/// 1. `tool.server.url` (if configured, and only for "tool-calls" message)
/// 2. `assistant.serverUrl` (if configure)
/// 3. `phoneNumber.serverUrl` (if configured)
/// 4. `org.serverUrl` (if configured)
public enum ServerMessageMessage: Codable, Hashable, Sendable {
    case serverMessageAssistantRequest(ServerMessageAssistantRequest)
    case serverMessageConversationUpdate(ServerMessageConversationUpdate)
    case serverMessageEndOfCallReport(ServerMessageEndOfCallReport)
    case serverMessageHandoffDestinationRequest(ServerMessageHandoffDestinationRequest)
    case serverMessageHang(ServerMessageHang)
    case serverMessageKnowledgeBaseRequest(ServerMessageKnowledgeBaseRequest)
    case serverMessageModelOutput(ServerMessageModelOutput)
    case serverMessagePhoneCallControl(ServerMessagePhoneCallControl)
    case serverMessageSpeechUpdate(ServerMessageSpeechUpdate)
    case serverMessageStatusUpdate(ServerMessageStatusUpdate)
    case serverMessageToolCalls(ServerMessageToolCalls)
    case serverMessageTransferDestinationRequest(ServerMessageTransferDestinationRequest)
    case serverMessageTransferUpdate(ServerMessageTransferUpdate)
    case serverMessageTranscript(ServerMessageTranscript)
    case serverMessageUserInterrupted(ServerMessageUserInterrupted)
    case serverMessageLanguageChangeDetected(ServerMessageLanguageChangeDetected)
    case serverMessageVoiceInput(ServerMessageVoiceInput)
    case serverMessageVoiceRequest(ServerMessageVoiceRequest)
    case serverMessageCallEndpointingRequest(ServerMessageCallEndpointingRequest)
    case serverMessageChatCreated(ServerMessageChatCreated)
    case serverMessageChatDeleted(ServerMessageChatDeleted)
    case serverMessageSessionCreated(ServerMessageSessionCreated)
    case serverMessageSessionUpdated(ServerMessageSessionUpdated)
    case serverMessageSessionDeleted(ServerMessageSessionDeleted)
    case serverMessageCallDeleted(ServerMessageCallDeleted)
    case serverMessageCallDeleteFailed(ServerMessageCallDeleteFailed)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ServerMessageAssistantRequest.self) {
            self = .serverMessageAssistantRequest(value)
        } else if let value = try? container.decode(ServerMessageConversationUpdate.self) {
            self = .serverMessageConversationUpdate(value)
        } else if let value = try? container.decode(ServerMessageEndOfCallReport.self) {
            self = .serverMessageEndOfCallReport(value)
        } else if let value = try? container.decode(ServerMessageHandoffDestinationRequest.self) {
            self = .serverMessageHandoffDestinationRequest(value)
        } else if let value = try? container.decode(ServerMessageHang.self) {
            self = .serverMessageHang(value)
        } else if let value = try? container.decode(ServerMessageKnowledgeBaseRequest.self) {
            self = .serverMessageKnowledgeBaseRequest(value)
        } else if let value = try? container.decode(ServerMessageModelOutput.self) {
            self = .serverMessageModelOutput(value)
        } else if let value = try? container.decode(ServerMessagePhoneCallControl.self) {
            self = .serverMessagePhoneCallControl(value)
        } else if let value = try? container.decode(ServerMessageSpeechUpdate.self) {
            self = .serverMessageSpeechUpdate(value)
        } else if let value = try? container.decode(ServerMessageStatusUpdate.self) {
            self = .serverMessageStatusUpdate(value)
        } else if let value = try? container.decode(ServerMessageToolCalls.self) {
            self = .serverMessageToolCalls(value)
        } else if let value = try? container.decode(ServerMessageTransferDestinationRequest.self) {
            self = .serverMessageTransferDestinationRequest(value)
        } else if let value = try? container.decode(ServerMessageTransferUpdate.self) {
            self = .serverMessageTransferUpdate(value)
        } else if let value = try? container.decode(ServerMessageTranscript.self) {
            self = .serverMessageTranscript(value)
        } else if let value = try? container.decode(ServerMessageUserInterrupted.self) {
            self = .serverMessageUserInterrupted(value)
        } else if let value = try? container.decode(ServerMessageLanguageChangeDetected.self) {
            self = .serverMessageLanguageChangeDetected(value)
        } else if let value = try? container.decode(ServerMessageVoiceInput.self) {
            self = .serverMessageVoiceInput(value)
        } else if let value = try? container.decode(ServerMessageVoiceRequest.self) {
            self = .serverMessageVoiceRequest(value)
        } else if let value = try? container.decode(ServerMessageCallEndpointingRequest.self) {
            self = .serverMessageCallEndpointingRequest(value)
        } else if let value = try? container.decode(ServerMessageChatCreated.self) {
            self = .serverMessageChatCreated(value)
        } else if let value = try? container.decode(ServerMessageChatDeleted.self) {
            self = .serverMessageChatDeleted(value)
        } else if let value = try? container.decode(ServerMessageSessionCreated.self) {
            self = .serverMessageSessionCreated(value)
        } else if let value = try? container.decode(ServerMessageSessionUpdated.self) {
            self = .serverMessageSessionUpdated(value)
        } else if let value = try? container.decode(ServerMessageSessionDeleted.self) {
            self = .serverMessageSessionDeleted(value)
        } else if let value = try? container.decode(ServerMessageCallDeleted.self) {
            self = .serverMessageCallDeleted(value)
        } else if let value = try? container.decode(ServerMessageCallDeleteFailed.self) {
            self = .serverMessageCallDeleteFailed(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .serverMessageAssistantRequest(let value):
            try container.encode(value)
        case .serverMessageConversationUpdate(let value):
            try container.encode(value)
        case .serverMessageEndOfCallReport(let value):
            try container.encode(value)
        case .serverMessageHandoffDestinationRequest(let value):
            try container.encode(value)
        case .serverMessageHang(let value):
            try container.encode(value)
        case .serverMessageKnowledgeBaseRequest(let value):
            try container.encode(value)
        case .serverMessageModelOutput(let value):
            try container.encode(value)
        case .serverMessagePhoneCallControl(let value):
            try container.encode(value)
        case .serverMessageSpeechUpdate(let value):
            try container.encode(value)
        case .serverMessageStatusUpdate(let value):
            try container.encode(value)
        case .serverMessageToolCalls(let value):
            try container.encode(value)
        case .serverMessageTransferDestinationRequest(let value):
            try container.encode(value)
        case .serverMessageTransferUpdate(let value):
            try container.encode(value)
        case .serverMessageTranscript(let value):
            try container.encode(value)
        case .serverMessageUserInterrupted(let value):
            try container.encode(value)
        case .serverMessageLanguageChangeDetected(let value):
            try container.encode(value)
        case .serverMessageVoiceInput(let value):
            try container.encode(value)
        case .serverMessageVoiceRequest(let value):
            try container.encode(value)
        case .serverMessageCallEndpointingRequest(let value):
            try container.encode(value)
        case .serverMessageChatCreated(let value):
            try container.encode(value)
        case .serverMessageChatDeleted(let value):
            try container.encode(value)
        case .serverMessageSessionCreated(let value):
            try container.encode(value)
        case .serverMessageSessionUpdated(let value):
            try container.encode(value)
        case .serverMessageSessionDeleted(let value):
            try container.encode(value)
        case .serverMessageCallDeleted(let value):
            try container.encode(value)
        case .serverMessageCallDeleteFailed(let value):
            try container.encode(value)
        }
    }
}
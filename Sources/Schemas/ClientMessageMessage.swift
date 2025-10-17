import Foundation

/// These are all the messages that can be sent to the client-side SDKs during the call. Configure the messages you'd like to receive in `assistant.clientMessages`.
public enum ClientMessageMessage: Codable, Hashable, Sendable {
    case clientMessageWorkflowNodeStarted(ClientMessageWorkflowNodeStarted)
    case clientMessageConversationUpdate(ClientMessageConversationUpdate)
    case clientMessageHang(ClientMessageHang)
    case clientMessageMetadata(ClientMessageMetadata)
    case clientMessageModelOutput(ClientMessageModelOutput)
    case clientMessageSpeechUpdate(ClientMessageSpeechUpdate)
    case clientMessageTranscript(ClientMessageTranscript)
    case clientMessageToolCalls(ClientMessageToolCalls)
    case clientMessageToolCallsResult(ClientMessageToolCallsResult)
    case clientMessageTransferUpdate(ClientMessageTransferUpdate)
    case clientMessageUserInterrupted(ClientMessageUserInterrupted)
    case clientMessageLanguageChangeDetected(ClientMessageLanguageChangeDetected)
    case clientMessageVoiceInput(ClientMessageVoiceInput)
    case clientMessageChatCreated(ClientMessageChatCreated)
    case clientMessageChatDeleted(ClientMessageChatDeleted)
    case clientMessageSessionCreated(ClientMessageSessionCreated)
    case clientMessageSessionUpdated(ClientMessageSessionUpdated)
    case clientMessageSessionDeleted(ClientMessageSessionDeleted)
    case clientMessageCallDeleted(ClientMessageCallDeleted)
    case clientMessageCallDeleteFailed(ClientMessageCallDeleteFailed)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ClientMessageWorkflowNodeStarted.self) {
            self = .clientMessageWorkflowNodeStarted(value)
        } else if let value = try? container.decode(ClientMessageConversationUpdate.self) {
            self = .clientMessageConversationUpdate(value)
        } else if let value = try? container.decode(ClientMessageHang.self) {
            self = .clientMessageHang(value)
        } else if let value = try? container.decode(ClientMessageMetadata.self) {
            self = .clientMessageMetadata(value)
        } else if let value = try? container.decode(ClientMessageModelOutput.self) {
            self = .clientMessageModelOutput(value)
        } else if let value = try? container.decode(ClientMessageSpeechUpdate.self) {
            self = .clientMessageSpeechUpdate(value)
        } else if let value = try? container.decode(ClientMessageTranscript.self) {
            self = .clientMessageTranscript(value)
        } else if let value = try? container.decode(ClientMessageToolCalls.self) {
            self = .clientMessageToolCalls(value)
        } else if let value = try? container.decode(ClientMessageToolCallsResult.self) {
            self = .clientMessageToolCallsResult(value)
        } else if let value = try? container.decode(ClientMessageTransferUpdate.self) {
            self = .clientMessageTransferUpdate(value)
        } else if let value = try? container.decode(ClientMessageUserInterrupted.self) {
            self = .clientMessageUserInterrupted(value)
        } else if let value = try? container.decode(ClientMessageLanguageChangeDetected.self) {
            self = .clientMessageLanguageChangeDetected(value)
        } else if let value = try? container.decode(ClientMessageVoiceInput.self) {
            self = .clientMessageVoiceInput(value)
        } else if let value = try? container.decode(ClientMessageChatCreated.self) {
            self = .clientMessageChatCreated(value)
        } else if let value = try? container.decode(ClientMessageChatDeleted.self) {
            self = .clientMessageChatDeleted(value)
        } else if let value = try? container.decode(ClientMessageSessionCreated.self) {
            self = .clientMessageSessionCreated(value)
        } else if let value = try? container.decode(ClientMessageSessionUpdated.self) {
            self = .clientMessageSessionUpdated(value)
        } else if let value = try? container.decode(ClientMessageSessionDeleted.self) {
            self = .clientMessageSessionDeleted(value)
        } else if let value = try? container.decode(ClientMessageCallDeleted.self) {
            self = .clientMessageCallDeleted(value)
        } else if let value = try? container.decode(ClientMessageCallDeleteFailed.self) {
            self = .clientMessageCallDeleteFailed(value)
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
        case .clientMessageWorkflowNodeStarted(let value):
            try container.encode(value)
        case .clientMessageConversationUpdate(let value):
            try container.encode(value)
        case .clientMessageHang(let value):
            try container.encode(value)
        case .clientMessageMetadata(let value):
            try container.encode(value)
        case .clientMessageModelOutput(let value):
            try container.encode(value)
        case .clientMessageSpeechUpdate(let value):
            try container.encode(value)
        case .clientMessageTranscript(let value):
            try container.encode(value)
        case .clientMessageToolCalls(let value):
            try container.encode(value)
        case .clientMessageToolCallsResult(let value):
            try container.encode(value)
        case .clientMessageTransferUpdate(let value):
            try container.encode(value)
        case .clientMessageUserInterrupted(let value):
            try container.encode(value)
        case .clientMessageLanguageChangeDetected(let value):
            try container.encode(value)
        case .clientMessageVoiceInput(let value):
            try container.encode(value)
        case .clientMessageChatCreated(let value):
            try container.encode(value)
        case .clientMessageChatDeleted(let value):
            try container.encode(value)
        case .clientMessageSessionCreated(let value):
            try container.encode(value)
        case .clientMessageSessionUpdated(let value):
            try container.encode(value)
        case .clientMessageSessionDeleted(let value):
            try container.encode(value)
        case .clientMessageCallDeleted(let value):
            try container.encode(value)
        case .clientMessageCallDeleteFailed(let value):
            try container.encode(value)
        }
    }
}
import Foundation

public enum AssistantOverridesServerMessagesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case conversationUpdate = "conversation-update"
    case endOfCallReport = "end-of-call-report"
    case functionCall = "function-call"
    case hang
    case languageChanged = "language-changed"
    case languageChangeDetected = "language-change-detected"
    case modelOutput = "model-output"
    case phoneCallControl = "phone-call-control"
    case speechUpdate = "speech-update"
    case statusUpdate = "status-update"
    case transcript
    case transcriptTranscriptTypeFinal = "transcript[transcriptType=\"final\"]"
    case toolCalls = "tool-calls"
    case transferDestinationRequest = "transfer-destination-request"
    case handoffDestinationRequest = "handoff-destination-request"
    case transferUpdate = "transfer-update"
    case userInterrupted = "user-interrupted"
    case voiceInput = "voice-input"
    case chatCreated = "chat.created"
    case chatDeleted = "chat.deleted"
    case sessionCreated = "session.created"
    case sessionUpdated = "session.updated"
    case sessionDeleted = "session.deleted"
    case callDeleted = "call.deleted"
    case callDeleteFailed = "call.delete.failed"
}
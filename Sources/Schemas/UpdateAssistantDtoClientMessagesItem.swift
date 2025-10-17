import Foundation

public enum UpdateAssistantDtoClientMessagesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case conversationUpdate = "conversation-update"
    case functionCall = "function-call"
    case functionCallResult = "function-call-result"
    case hang
    case languageChanged = "language-changed"
    case metadata
    case modelOutput = "model-output"
    case speechUpdate = "speech-update"
    case statusUpdate = "status-update"
    case transcript
    case toolCalls = "tool-calls"
    case toolCallsResult = "tool-calls-result"
    case toolCompleted = "tool.completed"
    case transferUpdate = "transfer-update"
    case userInterrupted = "user-interrupted"
    case voiceInput = "voice-input"
    case workflowNodeStarted = "workflow.node.started"
}
import Foundation

/// This is the event that triggers this hook
public enum CallHookAssistantSpeechInterruptedOn: String, Codable, Hashable, CaseIterable, Sendable {
    case assistantSpeechInterrupted = "assistant.speech.interrupted"
}
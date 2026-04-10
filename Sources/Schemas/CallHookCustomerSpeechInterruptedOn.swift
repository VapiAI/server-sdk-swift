import Foundation

/// This is the event that triggers this hook
public enum CallHookCustomerSpeechInterruptedOn: String, Codable, Hashable, CaseIterable, Sendable {
    case customerSpeechInterrupted = "customer.speech.interrupted"
}
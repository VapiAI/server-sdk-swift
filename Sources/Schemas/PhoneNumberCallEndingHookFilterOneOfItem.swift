import Foundation

public enum PhoneNumberCallEndingHookFilterOneOfItem: String, Codable, Hashable, CaseIterable, Sendable {
    case assistantRequestFailed = "assistant-request-failed"
    case assistantRequestReturnedError = "assistant-request-returned-error"
    case assistantRequestReturnedUnspeakableError = "assistant-request-returned-unspeakable-error"
    case assistantRequestReturnedInvalidAssistant = "assistant-request-returned-invalid-assistant"
    case assistantRequestReturnedNoAssistant = "assistant-request-returned-no-assistant"
    case assistantRequestReturnedForwardingPhoneNumber = "assistant-request-returned-forwarding-phone-number"
}
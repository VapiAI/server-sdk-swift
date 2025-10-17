import Foundation

public enum WorkflowHooksItem: Codable, Hashable, Sendable {
    case callHookCallEnding(CallHookCallEnding)
    case callHookAssistantSpeechInterrupted(CallHookAssistantSpeechInterrupted)
    case callHookCustomerSpeechInterrupted(CallHookCustomerSpeechInterrupted)
    case callHookCustomerSpeechTimeout(CallHookCustomerSpeechTimeout)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CallHookCallEnding.self) {
            self = .callHookCallEnding(value)
        } else if let value = try? container.decode(CallHookAssistantSpeechInterrupted.self) {
            self = .callHookAssistantSpeechInterrupted(value)
        } else if let value = try? container.decode(CallHookCustomerSpeechInterrupted.self) {
            self = .callHookCustomerSpeechInterrupted(value)
        } else if let value = try? container.decode(CallHookCustomerSpeechTimeout.self) {
            self = .callHookCustomerSpeechTimeout(value)
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
        case .callHookCallEnding(let value):
            try container.encode(value)
        case .callHookAssistantSpeechInterrupted(let value):
            try container.encode(value)
        case .callHookCustomerSpeechInterrupted(let value):
            try container.encode(value)
        case .callHookCustomerSpeechTimeout(let value):
            try container.encode(value)
        }
    }
}
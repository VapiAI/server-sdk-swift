import Foundation

public enum TransferAssistantHooksItem: Codable, Hashable, Sendable {
    case callHookAssistantSpeechInterrupted(CallHookAssistantSpeechInterrupted)
    case callHookCustomerSpeechInterrupted(CallHookCustomerSpeechInterrupted)
    case callHookCustomerSpeechTimeout(CallHookCustomerSpeechTimeout)
    case callHookModelResponseTimeout(CallHookModelResponseTimeout)
    case callHookTranscriberEndpointedSpeechLowConfidence(CallHookTranscriberEndpointedSpeechLowConfidence)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CallHookAssistantSpeechInterrupted.self) {
            self = .callHookAssistantSpeechInterrupted(value)
        } else if let value = try? container.decode(CallHookCustomerSpeechInterrupted.self) {
            self = .callHookCustomerSpeechInterrupted(value)
        } else if let value = try? container.decode(CallHookCustomerSpeechTimeout.self) {
            self = .callHookCustomerSpeechTimeout(value)
        } else if let value = try? container.decode(CallHookModelResponseTimeout.self) {
            self = .callHookModelResponseTimeout(value)
        } else if let value = try? container.decode(CallHookTranscriberEndpointedSpeechLowConfidence.self) {
            self = .callHookTranscriberEndpointedSpeechLowConfidence(value)
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
        case .callHookAssistantSpeechInterrupted(let value):
            try container.encode(value)
        case .callHookCustomerSpeechInterrupted(let value):
            try container.encode(value)
        case .callHookCustomerSpeechTimeout(let value):
            try container.encode(value)
        case .callHookModelResponseTimeout(let value):
            try container.encode(value)
        case .callHookTranscriberEndpointedSpeechLowConfidence(let value):
            try container.encode(value)
        }
    }
}
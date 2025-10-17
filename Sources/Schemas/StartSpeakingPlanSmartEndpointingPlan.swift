import Foundation

/// This is the plan for smart endpointing. Pick between Vapi smart endpointing, LiveKit, or custom endpointing model (or nothing). We strongly recommend using livekit endpointing when working in English. LiveKit endpointing is not supported in other languages, yet.
/// 
/// If this is set, it will override and take precedence over `transcriptionEndpointingPlan`.
/// This plan will still be overridden by any matching `customEndpointingRules`.
/// 
/// If this is not set, the system will automatically use the transcriber's built-in endpointing capabilities if available.
public enum StartSpeakingPlanSmartEndpointingPlan: Codable, Hashable, Sendable {
    case vapiSmartEndpointingPlan(VapiSmartEndpointingPlan)
    case livekitSmartEndpointingPlan(LivekitSmartEndpointingPlan)
    case customEndpointingModelSmartEndpointingPlan(CustomEndpointingModelSmartEndpointingPlan)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(VapiSmartEndpointingPlan.self) {
            self = .vapiSmartEndpointingPlan(value)
        } else if let value = try? container.decode(LivekitSmartEndpointingPlan.self) {
            self = .livekitSmartEndpointingPlan(value)
        } else if let value = try? container.decode(CustomEndpointingModelSmartEndpointingPlan.self) {
            self = .customEndpointingModelSmartEndpointingPlan(value)
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
        case .vapiSmartEndpointingPlan(let value):
            try container.encode(value)
        case .livekitSmartEndpointingPlan(let value):
            try container.encode(value)
        case .customEndpointingModelSmartEndpointingPlan(let value):
            try container.encode(value)
        }
    }
}
import Foundation

/// This is the voicemail detection plan for the workflow.
public enum UpdateWorkflowDtoVoicemailDetection: Codable, Hashable, Sendable {
    case googleVoicemailDetectionPlan(GoogleVoicemailDetectionPlan)
    case openAiVoicemailDetectionPlan(OpenAiVoicemailDetectionPlan)
    case twilioVoicemailDetectionPlan(TwilioVoicemailDetectionPlan)
    case updateWorkflowDtoVoicemailDetectionZero(UpdateWorkflowDtoVoicemailDetectionZero)
    case vapiVoicemailDetectionPlan(VapiVoicemailDetectionPlan)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(GoogleVoicemailDetectionPlan.self) {
            self = .googleVoicemailDetectionPlan(value)
        } else if let value = try? container.decode(OpenAiVoicemailDetectionPlan.self) {
            self = .openAiVoicemailDetectionPlan(value)
        } else if let value = try? container.decode(TwilioVoicemailDetectionPlan.self) {
            self = .twilioVoicemailDetectionPlan(value)
        } else if let value = try? container.decode(UpdateWorkflowDtoVoicemailDetectionZero.self) {
            self = .updateWorkflowDtoVoicemailDetectionZero(value)
        } else if let value = try? container.decode(VapiVoicemailDetectionPlan.self) {
            self = .vapiVoicemailDetectionPlan(value)
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
        case .googleVoicemailDetectionPlan(let value):
            try container.encode(value)
        case .openAiVoicemailDetectionPlan(let value):
            try container.encode(value)
        case .twilioVoicemailDetectionPlan(let value):
            try container.encode(value)
        case .updateWorkflowDtoVoicemailDetectionZero(let value):
            try container.encode(value)
        case .vapiVoicemailDetectionPlan(let value):
            try container.encode(value)
        }
    }
}
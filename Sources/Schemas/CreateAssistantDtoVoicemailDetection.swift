import Foundation

/// These are the settings to configure or disable voicemail detection. Alternatively, voicemail detection can be configured using the model.tools=[VoicemailTool].
/// By default, voicemail detection is disabled.
public enum CreateAssistantDtoVoicemailDetection: Codable, Hashable, Sendable {
    case createAssistantDtoVoicemailDetectionZero(CreateAssistantDtoVoicemailDetectionZero)
    case googleVoicemailDetectionPlan(GoogleVoicemailDetectionPlan)
    case openAiVoicemailDetectionPlan(OpenAiVoicemailDetectionPlan)
    case twilioVoicemailDetectionPlan(TwilioVoicemailDetectionPlan)
    case vapiVoicemailDetectionPlan(VapiVoicemailDetectionPlan)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CreateAssistantDtoVoicemailDetectionZero.self) {
            self = .createAssistantDtoVoicemailDetectionZero(value)
        } else if let value = try? container.decode(GoogleVoicemailDetectionPlan.self) {
            self = .googleVoicemailDetectionPlan(value)
        } else if let value = try? container.decode(OpenAiVoicemailDetectionPlan.self) {
            self = .openAiVoicemailDetectionPlan(value)
        } else if let value = try? container.decode(TwilioVoicemailDetectionPlan.self) {
            self = .twilioVoicemailDetectionPlan(value)
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
        case .createAssistantDtoVoicemailDetectionZero(let value):
            try container.encode(value)
        case .googleVoicemailDetectionPlan(let value):
            try container.encode(value)
        case .openAiVoicemailDetectionPlan(let value):
            try container.encode(value)
        case .twilioVoicemailDetectionPlan(let value):
            try container.encode(value)
        case .vapiVoicemailDetectionPlan(let value):
            try container.encode(value)
        }
    }
}
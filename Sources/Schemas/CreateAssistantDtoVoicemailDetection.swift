import Foundation

/// These are the settings to configure or disable voicemail detection. Alternatively, voicemail detection can be configured using the model.tools=[VoicemailTool].
/// This uses Twilio's built-in detection while the VoicemailTool relies on the model to detect if a voicemail was reached.
/// You can use neither of them, one of them, or both of them. By default, Twilio built-in detection is enabled while VoicemailTool is not.
public enum CreateAssistantDtoVoicemailDetection: Codable, Hashable, Sendable {
    case google(Google)
    case openai(Openai)
    case twilio(Twilio)
    case vapi(Vapi)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "google":
            self = .google(try Google(from: decoder))
        case "openai":
            self = .openai(try Openai(from: decoder))
        case "twilio":
            self = .twilio(try Twilio(from: decoder))
        case "vapi":
            self = .vapi(try Vapi(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        switch self {
        case .google(let data):
            try data.encode(to: encoder)
        case .openai(let data):
            try data.encode(to: encoder)
        case .twilio(let data):
            try data.encode(to: encoder)
        case .vapi(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Google: Codable, Hashable, Sendable {
        public let provider: String = "google"
        /// This is the maximum duration from the start of the call that we will wait for a voicemail beep, before speaking our message
        /// 
        /// - If we detect a voicemail beep before this, we will speak the message at that point.
        /// 
        /// - Setting too low a value means that the bot will start speaking its voicemail message too early. If it does so before the actual beep, it will get cut off. You should definitely tune this to your use case.
        /// 
        /// @default 30
        /// @min 0
        /// @max 60
        public let beepMaxAwaitSeconds: Double?
        /// This is the backoff plan for the voicemail detection.
        public let backoffPlan: VoicemailDetectionBackoffPlan?
        /// This is the detection type to use for voicemail detection.
        /// - 'audio': Uses native audio models (default)
        /// - 'transcript': Uses ASR/transcript-based detection
        /// @default 'audio' (audio detection)
        public let type: GoogleVoicemailDetectionPlanType?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            beepMaxAwaitSeconds: Double? = nil,
            backoffPlan: VoicemailDetectionBackoffPlan? = nil,
            type: GoogleVoicemailDetectionPlanType? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.beepMaxAwaitSeconds = beepMaxAwaitSeconds
            self.backoffPlan = backoffPlan
            self.type = type
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.beepMaxAwaitSeconds = try container.decodeIfPresent(Double.self, forKey: .beepMaxAwaitSeconds)
            self.backoffPlan = try container.decodeIfPresent(VoicemailDetectionBackoffPlan.self, forKey: .backoffPlan)
            self.type = try container.decodeIfPresent(GoogleVoicemailDetectionPlanType.self, forKey: .type)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.beepMaxAwaitSeconds, forKey: .beepMaxAwaitSeconds)
            try container.encodeIfPresent(self.backoffPlan, forKey: .backoffPlan)
            try container.encodeIfPresent(self.type, forKey: .type)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case beepMaxAwaitSeconds
            case backoffPlan
            case type
        }
    }

    public struct Openai: Codable, Hashable, Sendable {
        public let provider: String = "openai"
        /// This is the maximum duration from the start of the call that we will wait for a voicemail beep, before speaking our message
        /// 
        /// - If we detect a voicemail beep before this, we will speak the message at that point.
        /// 
        /// - Setting too low a value means that the bot will start speaking its voicemail message too early. If it does so before the actual beep, it will get cut off. You should definitely tune this to your use case.
        /// 
        /// @default 30
        /// @min 0
        /// @max 60
        public let beepMaxAwaitSeconds: Double?
        /// This is the backoff plan for the voicemail detection.
        public let backoffPlan: VoicemailDetectionBackoffPlan?
        /// This is the detection type to use for voicemail detection.
        /// - 'audio': Uses native audio models (default)
        /// - 'transcript': Uses ASR/transcript-based detection
        /// @default 'audio' (audio detection)
        public let type: OpenAiVoicemailDetectionPlanType?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            beepMaxAwaitSeconds: Double? = nil,
            backoffPlan: VoicemailDetectionBackoffPlan? = nil,
            type: OpenAiVoicemailDetectionPlanType? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.beepMaxAwaitSeconds = beepMaxAwaitSeconds
            self.backoffPlan = backoffPlan
            self.type = type
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.beepMaxAwaitSeconds = try container.decodeIfPresent(Double.self, forKey: .beepMaxAwaitSeconds)
            self.backoffPlan = try container.decodeIfPresent(VoicemailDetectionBackoffPlan.self, forKey: .backoffPlan)
            self.type = try container.decodeIfPresent(OpenAiVoicemailDetectionPlanType.self, forKey: .type)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.beepMaxAwaitSeconds, forKey: .beepMaxAwaitSeconds)
            try container.encodeIfPresent(self.backoffPlan, forKey: .backoffPlan)
            try container.encodeIfPresent(self.type, forKey: .type)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case beepMaxAwaitSeconds
            case backoffPlan
            case type
        }
    }

    public struct Twilio: Codable, Hashable, Sendable {
        public let provider: String = "twilio"
        /// These are the AMD messages from Twilio that are considered as voicemail. Default is ['machine_end_beep', 'machine_end_silence'].
        /// 
        /// @default {Array} ['machine_end_beep', 'machine_end_silence']
        public let voicemailDetectionTypes: [TwilioVoicemailDetectionPlanVoicemailDetectionTypesItem]?
        /// This sets whether the assistant should detect voicemail. Defaults to true.
        /// 
        /// @default true
        public let enabled: Bool?
        /// The number of seconds that Twilio should attempt to perform answering machine detection before timing out and returning AnsweredBy as unknown. Default is 30 seconds.
        /// 
        /// Increasing this value will provide the engine more time to make a determination. This can be useful when DetectMessageEnd is provided in the MachineDetection parameter and there is an expectation of long answering machine greetings that can exceed 30 seconds.
        /// 
        /// Decreasing this value will reduce the amount of time the engine has to make a determination. This can be particularly useful when the Enable option is provided in the MachineDetection parameter and you want to limit the time for initial detection.
        /// 
        /// Check the [Twilio docs](https://www.twilio.com/docs/voice/answering-machine-detection#optional-api-tuning-parameters) for more info.
        /// 
        /// @default 30
        public let machineDetectionTimeout: Double?
        /// The number of milliseconds that is used as the measuring stick for the length of the speech activity. Durations lower than this value will be interpreted as a human, longer as a machine. Default is 2400 milliseconds.
        /// 
        /// Increasing this value will reduce the chance of a False Machine (detected machine, actually human) for a long human greeting (e.g., a business greeting) but increase the time it takes to detect a machine.
        /// 
        /// Decreasing this value will reduce the chances of a False Human (detected human, actually machine) for short voicemail greetings. The value of this parameter may need to be reduced by more than 1000ms to detect very short voicemail greetings. A reduction of that significance can result in increased False Machine detections. Adjusting the MachineDetectionSpeechEndThreshold is likely the better approach for short voicemails. Decreasing MachineDetectionSpeechThreshold will also reduce the time it takes to detect a machine.
        /// 
        /// Check the [Twilio docs](https://www.twilio.com/docs/voice/answering-machine-detection#optional-api-tuning-parameters) for more info.
        /// 
        /// @default 2400
        public let machineDetectionSpeechThreshold: Double?
        /// The number of milliseconds of silence after speech activity at which point the speech activity is considered complete. Default is 1200 milliseconds.
        /// 
        /// Increasing this value will typically be used to better address the short voicemail greeting scenarios. For short voicemails, there is typically 1000-2000ms of audio followed by 1200-2400ms of silence and then additional audio before the beep. Increasing the MachineDetectionSpeechEndThreshold to ~2500ms will treat the 1200-2400ms of silence as a gap in the greeting but not the end of the greeting and will result in a machine detection. The downsides of such a change include:
        /// - Increasing the delay for human detection by the amount you increase this parameter, e.g., a change of 1200ms to 2500ms increases human detection delay by 1300ms.
        /// - Cases where a human has two utterances separated by a period of silence (e.g. a "Hello", then 2000ms of silence, and another "Hello") may be interpreted as a machine.
        /// 
        /// Decreasing this value will result in faster human detection. The consequence is that it can lead to increased False Human (detected human, actually machine) detections because a silence gap in a voicemail greeting (not necessarily just in short voicemail scenarios) can be incorrectly interpreted as the end of speech.
        /// 
        /// Check the [Twilio docs](https://www.twilio.com/docs/voice/answering-machine-detection#optional-api-tuning-parameters) for more info.
        /// 
        /// @default 1200
        public let machineDetectionSpeechEndThreshold: Double?
        /// The number of milliseconds of initial silence after which an unknown AnsweredBy result will be returned. Default is 5000 milliseconds.
        /// 
        /// Increasing this value will result in waiting for a longer period of initial silence before returning an 'unknown' AMD result.
        /// 
        /// Decreasing this value will result in waiting for a shorter period of initial silence before returning an 'unknown' AMD result.
        /// 
        /// Check the [Twilio docs](https://www.twilio.com/docs/voice/answering-machine-detection#optional-api-tuning-parameters) for more info.
        /// 
        /// @default 5000
        public let machineDetectionSilenceTimeout: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            voicemailDetectionTypes: [TwilioVoicemailDetectionPlanVoicemailDetectionTypesItem]? = nil,
            enabled: Bool? = nil,
            machineDetectionTimeout: Double? = nil,
            machineDetectionSpeechThreshold: Double? = nil,
            machineDetectionSpeechEndThreshold: Double? = nil,
            machineDetectionSilenceTimeout: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.voicemailDetectionTypes = voicemailDetectionTypes
            self.enabled = enabled
            self.machineDetectionTimeout = machineDetectionTimeout
            self.machineDetectionSpeechThreshold = machineDetectionSpeechThreshold
            self.machineDetectionSpeechEndThreshold = machineDetectionSpeechEndThreshold
            self.machineDetectionSilenceTimeout = machineDetectionSilenceTimeout
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.voicemailDetectionTypes = try container.decodeIfPresent([TwilioVoicemailDetectionPlanVoicemailDetectionTypesItem].self, forKey: .voicemailDetectionTypes)
            self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
            self.machineDetectionTimeout = try container.decodeIfPresent(Double.self, forKey: .machineDetectionTimeout)
            self.machineDetectionSpeechThreshold = try container.decodeIfPresent(Double.self, forKey: .machineDetectionSpeechThreshold)
            self.machineDetectionSpeechEndThreshold = try container.decodeIfPresent(Double.self, forKey: .machineDetectionSpeechEndThreshold)
            self.machineDetectionSilenceTimeout = try container.decodeIfPresent(Double.self, forKey: .machineDetectionSilenceTimeout)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.voicemailDetectionTypes, forKey: .voicemailDetectionTypes)
            try container.encodeIfPresent(self.enabled, forKey: .enabled)
            try container.encodeIfPresent(self.machineDetectionTimeout, forKey: .machineDetectionTimeout)
            try container.encodeIfPresent(self.machineDetectionSpeechThreshold, forKey: .machineDetectionSpeechThreshold)
            try container.encodeIfPresent(self.machineDetectionSpeechEndThreshold, forKey: .machineDetectionSpeechEndThreshold)
            try container.encodeIfPresent(self.machineDetectionSilenceTimeout, forKey: .machineDetectionSilenceTimeout)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case voicemailDetectionTypes
            case enabled
            case machineDetectionTimeout
            case machineDetectionSpeechThreshold
            case machineDetectionSpeechEndThreshold
            case machineDetectionSilenceTimeout
        }
    }

    public struct Vapi: Codable, Hashable, Sendable {
        public let provider: String = "vapi"
        /// This is the maximum duration from the start of the call that we will wait for a voicemail beep, before speaking our message
        /// 
        /// - If we detect a voicemail beep before this, we will speak the message at that point.
        /// 
        /// - Setting too low a value means that the bot will start speaking its voicemail message too early. If it does so before the actual beep, it will get cut off. You should definitely tune this to your use case.
        /// 
        /// @default 30
        /// @min 0
        /// @max 60
        public let beepMaxAwaitSeconds: Double?
        /// This is the backoff plan for the voicemail detection.
        public let backoffPlan: VoicemailDetectionBackoffPlan?
        /// This is the detection type to use for voicemail detection.
        /// - 'audio': Uses native audio models (default)
        /// - 'transcript': Uses ASR/transcript-based detection
        /// @default 'audio' (audio detection)
        public let type: VapiVoicemailDetectionPlanType?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            beepMaxAwaitSeconds: Double? = nil,
            backoffPlan: VoicemailDetectionBackoffPlan? = nil,
            type: VapiVoicemailDetectionPlanType? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.beepMaxAwaitSeconds = beepMaxAwaitSeconds
            self.backoffPlan = backoffPlan
            self.type = type
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.beepMaxAwaitSeconds = try container.decodeIfPresent(Double.self, forKey: .beepMaxAwaitSeconds)
            self.backoffPlan = try container.decodeIfPresent(VoicemailDetectionBackoffPlan.self, forKey: .backoffPlan)
            self.type = try container.decodeIfPresent(VapiVoicemailDetectionPlanType.self, forKey: .type)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.beepMaxAwaitSeconds, forKey: .beepMaxAwaitSeconds)
            try container.encodeIfPresent(self.backoffPlan, forKey: .backoffPlan)
            try container.encodeIfPresent(self.type, forKey: .type)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case beepMaxAwaitSeconds
            case backoffPlan
            case type
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}
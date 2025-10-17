import Foundation

public struct GladiaTranscriber: Codable, Hashable, Sendable {
    /// This is the Gladia model that will be used. Default is 'fast'
    public let model: GladiaTranscriberModel?
    /// Defines how the transcription model detects the audio language. Default value is 'automatic single language'.
    public let languageBehaviour: GladiaTranscriberLanguageBehaviour?
    /// Defines the language to use for the transcription. Required when languageBehaviour is 'manual'.
    public let language: GladiaTranscriberLanguage?
    /// Defines the languages to use for the transcription. Required when languageBehaviour is 'manual'.
    public let languages: GladiaTranscriberLanguages?
    /// Provides a custom vocabulary to the model to improve accuracy of transcribing context specific words, technical terms, names, etc. If empty, this argument is ignored.
    /// ⚠️ Warning ⚠️: Please be aware that the transcription_hint field has a character limit of 600. If you provide a transcription_hint longer than 600 characters, it will be automatically truncated to meet this limit.
    public let transcriptionHint: String?
    /// If prosody is true, you will get a transcription that can contain prosodies i.e. (laugh) (giggles) (malefic laugh) (toss) (music)… Default value is false.
    public let prosody: Bool?
    /// If true, audio will be pre-processed to improve accuracy but latency will increase. Default value is false.
    public let audioEnhancer: Bool?
    /// Transcripts below this confidence threshold will be discarded.
    /// 
    /// @default 0.4
    public let confidenceThreshold: Double?
    /// Endpointing time in seconds - time to wait before considering speech ended
    public let endpointing: Double?
    /// Speech threshold - sensitivity configuration for speech detection (0.0 to 1.0)
    public let speechThreshold: Double?
    /// Enable custom vocabulary for improved accuracy
    public let customVocabularyEnabled: Bool?
    /// Custom vocabulary configuration
    public let customVocabularyConfig: GladiaCustomVocabularyConfigDto?
    /// Region for processing audio (us-west or eu-west)
    public let region: GladiaTranscriberRegion?
    /// Enable partial transcripts for low-latency streaming transcription
    public let receivePartialTranscripts: Bool?
    /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
    public let fallbackPlan: FallbackTranscriberPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: GladiaTranscriberModel? = nil,
        languageBehaviour: GladiaTranscriberLanguageBehaviour? = nil,
        language: GladiaTranscriberLanguage? = nil,
        languages: GladiaTranscriberLanguages? = nil,
        transcriptionHint: String? = nil,
        prosody: Bool? = nil,
        audioEnhancer: Bool? = nil,
        confidenceThreshold: Double? = nil,
        endpointing: Double? = nil,
        speechThreshold: Double? = nil,
        customVocabularyEnabled: Bool? = nil,
        customVocabularyConfig: GladiaCustomVocabularyConfigDto? = nil,
        region: GladiaTranscriberRegion? = nil,
        receivePartialTranscripts: Bool? = nil,
        fallbackPlan: FallbackTranscriberPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.languageBehaviour = languageBehaviour
        self.language = language
        self.languages = languages
        self.transcriptionHint = transcriptionHint
        self.prosody = prosody
        self.audioEnhancer = audioEnhancer
        self.confidenceThreshold = confidenceThreshold
        self.endpointing = endpointing
        self.speechThreshold = speechThreshold
        self.customVocabularyEnabled = customVocabularyEnabled
        self.customVocabularyConfig = customVocabularyConfig
        self.region = region
        self.receivePartialTranscripts = receivePartialTranscripts
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(GladiaTranscriberModel.self, forKey: .model)
        self.languageBehaviour = try container.decodeIfPresent(GladiaTranscriberLanguageBehaviour.self, forKey: .languageBehaviour)
        self.language = try container.decodeIfPresent(GladiaTranscriberLanguage.self, forKey: .language)
        self.languages = try container.decodeIfPresent(GladiaTranscriberLanguages.self, forKey: .languages)
        self.transcriptionHint = try container.decodeIfPresent(String.self, forKey: .transcriptionHint)
        self.prosody = try container.decodeIfPresent(Bool.self, forKey: .prosody)
        self.audioEnhancer = try container.decodeIfPresent(Bool.self, forKey: .audioEnhancer)
        self.confidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .confidenceThreshold)
        self.endpointing = try container.decodeIfPresent(Double.self, forKey: .endpointing)
        self.speechThreshold = try container.decodeIfPresent(Double.self, forKey: .speechThreshold)
        self.customVocabularyEnabled = try container.decodeIfPresent(Bool.self, forKey: .customVocabularyEnabled)
        self.customVocabularyConfig = try container.decodeIfPresent(GladiaCustomVocabularyConfigDto.self, forKey: .customVocabularyConfig)
        self.region = try container.decodeIfPresent(GladiaTranscriberRegion.self, forKey: .region)
        self.receivePartialTranscripts = try container.decodeIfPresent(Bool.self, forKey: .receivePartialTranscripts)
        self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.languageBehaviour, forKey: .languageBehaviour)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.languages, forKey: .languages)
        try container.encodeIfPresent(self.transcriptionHint, forKey: .transcriptionHint)
        try container.encodeIfPresent(self.prosody, forKey: .prosody)
        try container.encodeIfPresent(self.audioEnhancer, forKey: .audioEnhancer)
        try container.encodeIfPresent(self.confidenceThreshold, forKey: .confidenceThreshold)
        try container.encodeIfPresent(self.endpointing, forKey: .endpointing)
        try container.encodeIfPresent(self.speechThreshold, forKey: .speechThreshold)
        try container.encodeIfPresent(self.customVocabularyEnabled, forKey: .customVocabularyEnabled)
        try container.encodeIfPresent(self.customVocabularyConfig, forKey: .customVocabularyConfig)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.receivePartialTranscripts, forKey: .receivePartialTranscripts)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case languageBehaviour
        case language
        case languages
        case transcriptionHint
        case prosody
        case audioEnhancer
        case confidenceThreshold
        case endpointing
        case speechThreshold
        case customVocabularyEnabled
        case customVocabularyConfig
        case region
        case receivePartialTranscripts
        case fallbackPlan
    }
}
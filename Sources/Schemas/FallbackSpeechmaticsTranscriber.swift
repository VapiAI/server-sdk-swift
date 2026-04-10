import Foundation

public struct FallbackSpeechmaticsTranscriber: Codable, Hashable, Sendable {
    /// This is the model that will be used for the transcription.
    public let model: FallbackSpeechmaticsTranscriberModel?
    public let language: FallbackSpeechmaticsTranscriberLanguage?
    /// This is the operating point for the transcription. Choose between `standard` for faster turnaround with strong accuracy or `enhanced` for highest accuracy when precision is critical.
    /// 
    /// @default 'enhanced'
    public let operatingPoint: FallbackSpeechmaticsTranscriberOperatingPoint?
    /// This is the region for the Speechmatics API. Choose between EU (Europe) and US (United States) regions for lower latency and data sovereignty compliance.
    /// 
    /// @default 'eu'
    public let region: FallbackSpeechmaticsTranscriberRegion?
    /// This enables speaker diarization, which identifies and separates speakers in the transcription. Essential for multi-speaker conversations and conference calls.
    /// 
    /// @default false
    public let enableDiarization: Bool?
    /// This sets the maximum delay in milliseconds for partial transcripts. Balances latency and accuracy.
    /// 
    /// @default 3000
    public let maxDelay: Double?
    public let customVocabulary: [SpeechmaticsCustomVocabularyItem]
    /// This controls how numbers, dates, currencies, and other entities are formatted in the transcription output.
    /// 
    /// @default 'written'
    public let numeralStyle: FallbackSpeechmaticsTranscriberNumeralStyle?
    /// This is the sensitivity level for end-of-turn detection, which determines when a speaker has finished talking. Higher values are more sensitive.
    /// 
    /// @default 0.5
    public let endOfTurnSensitivity: Double?
    /// This enables removal of disfluencies (um, uh) from the transcript to create cleaner, more professional output.
    /// 
    /// This is only supported for the English language transcriber.
    /// 
    /// @default false
    public let removeDisfluencies: Bool?
    /// This is the minimum duration in seconds for speech segments. Shorter segments will be filtered out. Helps remove noise and improve accuracy.
    /// 
    /// @default 0.0
    public let minimumSpeechDuration: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: FallbackSpeechmaticsTranscriberModel? = nil,
        language: FallbackSpeechmaticsTranscriberLanguage? = nil,
        operatingPoint: FallbackSpeechmaticsTranscriberOperatingPoint? = nil,
        region: FallbackSpeechmaticsTranscriberRegion? = nil,
        enableDiarization: Bool? = nil,
        maxDelay: Double? = nil,
        customVocabulary: [SpeechmaticsCustomVocabularyItem],
        numeralStyle: FallbackSpeechmaticsTranscriberNumeralStyle? = nil,
        endOfTurnSensitivity: Double? = nil,
        removeDisfluencies: Bool? = nil,
        minimumSpeechDuration: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.language = language
        self.operatingPoint = operatingPoint
        self.region = region
        self.enableDiarization = enableDiarization
        self.maxDelay = maxDelay
        self.customVocabulary = customVocabulary
        self.numeralStyle = numeralStyle
        self.endOfTurnSensitivity = endOfTurnSensitivity
        self.removeDisfluencies = removeDisfluencies
        self.minimumSpeechDuration = minimumSpeechDuration
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(FallbackSpeechmaticsTranscriberModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(FallbackSpeechmaticsTranscriberLanguage.self, forKey: .language)
        self.operatingPoint = try container.decodeIfPresent(FallbackSpeechmaticsTranscriberOperatingPoint.self, forKey: .operatingPoint)
        self.region = try container.decodeIfPresent(FallbackSpeechmaticsTranscriberRegion.self, forKey: .region)
        self.enableDiarization = try container.decodeIfPresent(Bool.self, forKey: .enableDiarization)
        self.maxDelay = try container.decodeIfPresent(Double.self, forKey: .maxDelay)
        self.customVocabulary = try container.decode([SpeechmaticsCustomVocabularyItem].self, forKey: .customVocabulary)
        self.numeralStyle = try container.decodeIfPresent(FallbackSpeechmaticsTranscriberNumeralStyle.self, forKey: .numeralStyle)
        self.endOfTurnSensitivity = try container.decodeIfPresent(Double.self, forKey: .endOfTurnSensitivity)
        self.removeDisfluencies = try container.decodeIfPresent(Bool.self, forKey: .removeDisfluencies)
        self.minimumSpeechDuration = try container.decodeIfPresent(Double.self, forKey: .minimumSpeechDuration)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.operatingPoint, forKey: .operatingPoint)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.enableDiarization, forKey: .enableDiarization)
        try container.encodeIfPresent(self.maxDelay, forKey: .maxDelay)
        try container.encode(self.customVocabulary, forKey: .customVocabulary)
        try container.encodeIfPresent(self.numeralStyle, forKey: .numeralStyle)
        try container.encodeIfPresent(self.endOfTurnSensitivity, forKey: .endOfTurnSensitivity)
        try container.encodeIfPresent(self.removeDisfluencies, forKey: .removeDisfluencies)
        try container.encodeIfPresent(self.minimumSpeechDuration, forKey: .minimumSpeechDuration)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case language
        case operatingPoint
        case region
        case enableDiarization
        case maxDelay
        case customVocabulary
        case numeralStyle
        case endOfTurnSensitivity
        case removeDisfluencies
        case minimumSpeechDuration
    }
}
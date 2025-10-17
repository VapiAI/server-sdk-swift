import Foundation

public struct AzureSpeechTranscriber: Codable, Hashable, Sendable {
    /// This is the language that will be set for the transcription. The list of languages Azure supports can be found here: https://learn.microsoft.com/en-us/azure/ai-services/speech-service/language-support?tabs=stt
    public let language: AzureSpeechTranscriberLanguage?
    /// Controls how phrase boundaries are detected, enabling either simple time/silence heuristics or more advanced semantic segmentation.
    public let segmentationStrategy: AzureSpeechTranscriberSegmentationStrategy?
    /// Duration of detected silence after which the service finalizes a phrase. Configure to adjust sensitivity to pauses in speech.
    public let segmentationSilenceTimeoutMs: Double?
    /// Maximum duration a segment can reach before being cut off when using time-based segmentation.
    public let segmentationMaximumTimeMs: Double?
    /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
    public let fallbackPlan: FallbackTranscriberPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        language: AzureSpeechTranscriberLanguage? = nil,
        segmentationStrategy: AzureSpeechTranscriberSegmentationStrategy? = nil,
        segmentationSilenceTimeoutMs: Double? = nil,
        segmentationMaximumTimeMs: Double? = nil,
        fallbackPlan: FallbackTranscriberPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.language = language
        self.segmentationStrategy = segmentationStrategy
        self.segmentationSilenceTimeoutMs = segmentationSilenceTimeoutMs
        self.segmentationMaximumTimeMs = segmentationMaximumTimeMs
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.language = try container.decodeIfPresent(AzureSpeechTranscriberLanguage.self, forKey: .language)
        self.segmentationStrategy = try container.decodeIfPresent(AzureSpeechTranscriberSegmentationStrategy.self, forKey: .segmentationStrategy)
        self.segmentationSilenceTimeoutMs = try container.decodeIfPresent(Double.self, forKey: .segmentationSilenceTimeoutMs)
        self.segmentationMaximumTimeMs = try container.decodeIfPresent(Double.self, forKey: .segmentationMaximumTimeMs)
        self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.segmentationStrategy, forKey: .segmentationStrategy)
        try container.encodeIfPresent(self.segmentationSilenceTimeoutMs, forKey: .segmentationSilenceTimeoutMs)
        try container.encodeIfPresent(self.segmentationMaximumTimeMs, forKey: .segmentationMaximumTimeMs)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case language
        case segmentationStrategy
        case segmentationSilenceTimeoutMs
        case segmentationMaximumTimeMs
        case fallbackPlan
    }
}
import Foundation

public struct FallbackReson8Transcriber: Codable, Hashable, Sendable {
    /// The Reson8 speech-to-text endpoint to use. `turns` is Reson8's turn-detection endpoint.
    public let model: FallbackReson8TranscriberModel?
    /// Language for transcription (e.g. `nl`), or a comma-separated candidate list such as `nl,en` which constrains auto-detection. When omitted, Reson8 auto-detects the language per utterance. Supported: de, en, es, fr, fy, it, nl, pl, pt, sv.
    public let language: String?
    /// Domain-specific terms to boost recognition (brand names, product codes, jargon). Sent to Reson8 as the `phrases` parameter. Max 250 phrases.
    public let keyterms: [String]?
    /// A stored Reson8 phrase collection (custom model) id, managed via the Reson8 API or console.
    public let customModelId: String?
    /// Threshold (0-1) at which Reson8 emits an eager turn-end candidate. Provider default 0.5.
    public let eagerTurnProbability: Double?
    /// Threshold (0-1) at which Reson8 confirms the end of a turn. Provider default 0.92.
    public let finalTurnProbability: Double?
    /// How Reson8 renders filler words in transcripts. Provider default `natural`.
    public let fillerMode: FallbackReson8TranscriberFillerMode?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: FallbackReson8TranscriberModel? = nil,
        language: String? = nil,
        keyterms: [String]? = nil,
        customModelId: String? = nil,
        eagerTurnProbability: Double? = nil,
        finalTurnProbability: Double? = nil,
        fillerMode: FallbackReson8TranscriberFillerMode? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.language = language
        self.keyterms = keyterms
        self.customModelId = customModelId
        self.eagerTurnProbability = eagerTurnProbability
        self.finalTurnProbability = finalTurnProbability
        self.fillerMode = fillerMode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(FallbackReson8TranscriberModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.keyterms = try container.decodeIfPresent([String].self, forKey: .keyterms)
        self.customModelId = try container.decodeIfPresent(String.self, forKey: .customModelId)
        self.eagerTurnProbability = try container.decodeIfPresent(Double.self, forKey: .eagerTurnProbability)
        self.finalTurnProbability = try container.decodeIfPresent(Double.self, forKey: .finalTurnProbability)
        self.fillerMode = try container.decodeIfPresent(FallbackReson8TranscriberFillerMode.self, forKey: .fillerMode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.keyterms, forKey: .keyterms)
        try container.encodeIfPresent(self.customModelId, forKey: .customModelId)
        try container.encodeIfPresent(self.eagerTurnProbability, forKey: .eagerTurnProbability)
        try container.encodeIfPresent(self.finalTurnProbability, forKey: .finalTurnProbability)
        try container.encodeIfPresent(self.fillerMode, forKey: .fillerMode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case language
        case keyterms
        case customModelId
        case eagerTurnProbability
        case finalTurnProbability
        case fillerMode
    }
}
import Foundation

public struct DeepgramTranscriber: Codable, Hashable, Sendable {
    /// This is the Deepgram model that will be used. A list of models can be found here: https://developers.deepgram.com/docs/models-languages-overview
    public let model: DeepgramTranscriberModel?
    /// This is the language that will be set for the transcription. The list of languages Deepgram supports can be found here: https://developers.deepgram.com/docs/models-languages-overview
    public let language: DeepgramTranscriberLanguage?
    /// This will be use smart format option provided by Deepgram. It's default disabled because it can sometimes format numbers as times but it's getting better.
    public let smartFormat: Bool?
    /// If set to true, this will add mip_opt_out=true as a query parameter of all API requests. See https://developers.deepgram.com/docs/the-deepgram-model-improvement-partnership-program#want-to-opt-out
    /// 
    /// This will only be used if you are using your own Deepgram API key.
    /// 
    /// @default false
    public let mipOptOut: Bool?
    /// If set to true, this will cause deepgram to convert spoken numbers to literal numerals. For example, "my phone number is nine-seven-two..." would become "my phone number is 972..."
    /// 
    /// @default false
    public let numerals: Bool?
    /// Transcripts below this confidence threshold will be discarded.
    /// 
    /// @default 0.4
    public let confidenceThreshold: Double?
    /// Eager end-of-turn confidence required to fire a eager end-of-turn event. Setting a value here will enable EagerEndOfTurn and SpeechResumed events. It is disabled by default. Only used with Flux models.
    public let eagerEotThreshold: Double?
    /// End-of-turn confidence required to finish a turn. Only used with Flux models.
    /// 
    /// @default 0.7
    public let eotThreshold: Double?
    /// A turn will be finished when this much time has passed after speech, regardless of EOT confidence. Only used with Flux models.
    /// 
    /// @default 5000
    public let eotTimeoutMs: Double?
    /// These keywords are passed to the transcription model to help it pick up use-case specific words. Anything that may not be a common word, like your company name, should be added here.
    public let keywords: [String]?
    /// Keyterm Prompting allows you improve Keyword Recall Rate (KRR) for important keyterms or phrases up to 90%.
    public let keyterm: [String]?
    /// This is the timeout after which Deepgram will send transcription on user silence. You can read in-depth documentation here: https://developers.deepgram.com/docs/endpointing.
    /// 
    /// Here are the most important bits:
    /// - Defaults to 10. This is recommended for most use cases to optimize for latency.
    /// - 10 can cause some missing transcriptions since because of the shorter context. This mostly happens for one-word utterances. For those uses cases, it's recommended to try 300. It will add a bit of latency but the quality and reliability of the experience will be better.
    /// - If neither 10 nor 300 work, contact support@vapi.ai and we'll find another solution.
    /// 
    /// @default 10
    public let endpointing: Double?
    /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
    public let fallbackPlan: FallbackTranscriberPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: DeepgramTranscriberModel? = nil,
        language: DeepgramTranscriberLanguage? = nil,
        smartFormat: Bool? = nil,
        mipOptOut: Bool? = nil,
        numerals: Bool? = nil,
        confidenceThreshold: Double? = nil,
        eagerEotThreshold: Double? = nil,
        eotThreshold: Double? = nil,
        eotTimeoutMs: Double? = nil,
        keywords: [String]? = nil,
        keyterm: [String]? = nil,
        endpointing: Double? = nil,
        fallbackPlan: FallbackTranscriberPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.language = language
        self.smartFormat = smartFormat
        self.mipOptOut = mipOptOut
        self.numerals = numerals
        self.confidenceThreshold = confidenceThreshold
        self.eagerEotThreshold = eagerEotThreshold
        self.eotThreshold = eotThreshold
        self.eotTimeoutMs = eotTimeoutMs
        self.keywords = keywords
        self.keyterm = keyterm
        self.endpointing = endpointing
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(DeepgramTranscriberModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(DeepgramTranscriberLanguage.self, forKey: .language)
        self.smartFormat = try container.decodeIfPresent(Bool.self, forKey: .smartFormat)
        self.mipOptOut = try container.decodeIfPresent(Bool.self, forKey: .mipOptOut)
        self.numerals = try container.decodeIfPresent(Bool.self, forKey: .numerals)
        self.confidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .confidenceThreshold)
        self.eagerEotThreshold = try container.decodeIfPresent(Double.self, forKey: .eagerEotThreshold)
        self.eotThreshold = try container.decodeIfPresent(Double.self, forKey: .eotThreshold)
        self.eotTimeoutMs = try container.decodeIfPresent(Double.self, forKey: .eotTimeoutMs)
        self.keywords = try container.decodeIfPresent([String].self, forKey: .keywords)
        self.keyterm = try container.decodeIfPresent([String].self, forKey: .keyterm)
        self.endpointing = try container.decodeIfPresent(Double.self, forKey: .endpointing)
        self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.smartFormat, forKey: .smartFormat)
        try container.encodeIfPresent(self.mipOptOut, forKey: .mipOptOut)
        try container.encodeIfPresent(self.numerals, forKey: .numerals)
        try container.encodeIfPresent(self.confidenceThreshold, forKey: .confidenceThreshold)
        try container.encodeIfPresent(self.eagerEotThreshold, forKey: .eagerEotThreshold)
        try container.encodeIfPresent(self.eotThreshold, forKey: .eotThreshold)
        try container.encodeIfPresent(self.eotTimeoutMs, forKey: .eotTimeoutMs)
        try container.encodeIfPresent(self.keywords, forKey: .keywords)
        try container.encodeIfPresent(self.keyterm, forKey: .keyterm)
        try container.encodeIfPresent(self.endpointing, forKey: .endpointing)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case language
        case smartFormat
        case mipOptOut
        case numerals
        case confidenceThreshold
        case eagerEotThreshold
        case eotThreshold
        case eotTimeoutMs
        case keywords
        case keyterm
        case endpointing
        case fallbackPlan
    }
}
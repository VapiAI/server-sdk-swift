import Foundation

/// Fallback configuration for transcribing speech with Cartesia, including model and language.
public struct FallbackCartesiaTranscriber: Codable, Hashable, Sendable {
    /// The Cartesia speech-to-text model used for transcription.
    public let model: FallbackCartesiaTranscriberModel?
    /// The language code used for transcription.
    public let language: FallbackCartesiaTranscriberLanguage?
    /// Ink 2 speech likelihood above which a turn starts. Higher values require stronger speech evidence. Must exceed turnEagerEndThreshold, which is 0.4 when unset. When unset, the Cartesia server default (currently 0.8) applies. With startSpeakingPlan.smartEndpointingPlan unset, this affects when the assistant replies. A smart endpointing plan decides reply timing itself from Ink 2's partial and final transcripts, so with one set this only shapes the plan's input.
    public let turnStartThreshold: Double?
    /// Ink 2 speech likelihood below which an eager end fires. Higher values fire sooner. Must be below turnStartThreshold (0.8 when unset) and above turnEndThreshold (0.2 when unset). Eager ends are emitted as partial transcripts. With startSpeakingPlan.smartEndpointingPlan unset they do not start a model request, so tuning this changes when the event is observed rather than when the assistant replies. A smart endpointing plan receives them with Ink 2's other transcripts and decides reply timing itself. When unset, the Cartesia server default (currently 0.4) applies.
    public let turnEagerEndThreshold: Double?
    /// Ink 2 speech likelihood below which a turn ends. Higher values end the turn sooner. Must be below turnEagerEndThreshold, which is 0.4 when unset; values at or above that therefore require raising turnEagerEndThreshold as well. When unset, the Cartesia server default (currently 0.2) applies. With startSpeakingPlan.smartEndpointingPlan unset, this affects when the assistant replies. A smart endpointing plan decides reply timing itself from Ink 2's partial and final transcripts, so with one set this only shapes the plan's input.
    public let turnEndThreshold: Double?
    /// Maximum Ink 2 wait after speech stops, in milliseconds. Lower values force an earlier end. When unset, the Cartesia server default (currently 5600) applies. With startSpeakingPlan.smartEndpointingPlan unset, this affects when the assistant replies. A smart endpointing plan decides reply timing itself from Ink 2's partial and final transcripts, so with one set this only shapes the plan's input.
    public let turnEndTimeoutMs: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: FallbackCartesiaTranscriberModel? = nil,
        language: FallbackCartesiaTranscriberLanguage? = nil,
        turnStartThreshold: Double? = nil,
        turnEagerEndThreshold: Double? = nil,
        turnEndThreshold: Double? = nil,
        turnEndTimeoutMs: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.language = language
        self.turnStartThreshold = turnStartThreshold
        self.turnEagerEndThreshold = turnEagerEndThreshold
        self.turnEndThreshold = turnEndThreshold
        self.turnEndTimeoutMs = turnEndTimeoutMs
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeIfPresent(FallbackCartesiaTranscriberModel.self, forKey: .model)
        self.language = try container.decodeIfPresent(FallbackCartesiaTranscriberLanguage.self, forKey: .language)
        self.turnStartThreshold = try container.decodeIfPresent(Double.self, forKey: .turnStartThreshold)
        self.turnEagerEndThreshold = try container.decodeIfPresent(Double.self, forKey: .turnEagerEndThreshold)
        self.turnEndThreshold = try container.decodeIfPresent(Double.self, forKey: .turnEndThreshold)
        self.turnEndTimeoutMs = try container.decodeIfPresent(Int.self, forKey: .turnEndTimeoutMs)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.turnStartThreshold, forKey: .turnStartThreshold)
        try container.encodeIfPresent(self.turnEagerEndThreshold, forKey: .turnEagerEndThreshold)
        try container.encodeIfPresent(self.turnEndThreshold, forKey: .turnEndThreshold)
        try container.encodeIfPresent(self.turnEndTimeoutMs, forKey: .turnEndTimeoutMs)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case language
        case turnStartThreshold
        case turnEagerEndThreshold
        case turnEndThreshold
        case turnEndTimeoutMs
    }
}
import Foundation

public struct FourierDenoisingPlan: Codable, Hashable, Sendable {
    /// Whether Fourier denoising is enabled. Note that this is experimental and may not work as expected.
    public let enabled: Bool?
    /// Whether automatic media detection is enabled. When enabled, the filter will automatically
    /// detect consistent background TV/music/radio and switch to more aggressive filtering settings.
    /// Only applies when enabled is true.
    public let mediaDetectionEnabled: Bool?
    /// Static threshold in dB used as fallback when no baseline is established.
    public let staticThreshold: Double?
    /// How far below the rolling baseline to filter audio, in dB.
    /// Lower values (e.g., -10) are more aggressive, higher values (e.g., -20) are more conservative.
    public let baselineOffsetDb: Double?
    /// Rolling window size in milliseconds for calculating the audio baseline.
    /// Larger windows adapt more slowly but are more stable.
    public let windowSizeMs: Double?
    /// Percentile to use for baseline calculation (1-99).
    /// Higher percentiles (e.g., 85) focus on louder speech, lower percentiles (e.g., 50) include quieter speech.
    public let baselinePercentile: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        enabled: Bool? = nil,
        mediaDetectionEnabled: Bool? = nil,
        staticThreshold: Double? = nil,
        baselineOffsetDb: Double? = nil,
        windowSizeMs: Double? = nil,
        baselinePercentile: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.enabled = enabled
        self.mediaDetectionEnabled = mediaDetectionEnabled
        self.staticThreshold = staticThreshold
        self.baselineOffsetDb = baselineOffsetDb
        self.windowSizeMs = windowSizeMs
        self.baselinePercentile = baselinePercentile
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.mediaDetectionEnabled = try container.decodeIfPresent(Bool.self, forKey: .mediaDetectionEnabled)
        self.staticThreshold = try container.decodeIfPresent(Double.self, forKey: .staticThreshold)
        self.baselineOffsetDb = try container.decodeIfPresent(Double.self, forKey: .baselineOffsetDb)
        self.windowSizeMs = try container.decodeIfPresent(Double.self, forKey: .windowSizeMs)
        self.baselinePercentile = try container.decodeIfPresent(Double.self, forKey: .baselinePercentile)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.mediaDetectionEnabled, forKey: .mediaDetectionEnabled)
        try container.encodeIfPresent(self.staticThreshold, forKey: .staticThreshold)
        try container.encodeIfPresent(self.baselineOffsetDb, forKey: .baselineOffsetDb)
        try container.encodeIfPresent(self.windowSizeMs, forKey: .windowSizeMs)
        try container.encodeIfPresent(self.baselinePercentile, forKey: .baselinePercentile)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case enabled
        case mediaDetectionEnabled
        case staticThreshold
        case baselineOffsetDb
        case windowSizeMs
        case baselinePercentile
    }
}
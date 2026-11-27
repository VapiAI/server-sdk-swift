import Foundation

/// Controls whether Krisp smart denoising filters background speech and noise.
public struct SmartDenoisingPlan: Codable, Hashable, Sendable {
    /// Whether smart denoising using Krisp is enabled.
    public let enabled: Bool?
    /// Intensity of the applied noise suppression, in the range [0, 100].
    /// - 0 indicates no noise suppression (audio passes through Krisp unchanged).
    /// - 100 indicates full noise suppression and is the historical default.
    /// Lower values are gentler; useful for narrowband telephony audio where
    /// aggressive suppression can over-attenuate brief or quiet user utterances.
    /// 
    /// Per-call intensity is in beta, rolling out to select organizations and
    /// regions. Where it is not available, or the intensity-aware denoiser cannot
    /// be reached for a call, the standard denoiser runs at full suppression
    /// (100) whatever this is set to, so 0 does not turn suppression off there;
    /// set `enabled` to false for that. If the standard denoiser cannot be
    /// reached either, the call's audio passes through without smart denoising.
    /// 
    /// @default 100
    public let intensity: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        enabled: Bool? = nil,
        intensity: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.enabled = enabled
        self.intensity = intensity
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.intensity = try container.decodeIfPresent(Double.self, forKey: .intensity)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.intensity, forKey: .intensity)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case enabled
        case intensity
    }
}
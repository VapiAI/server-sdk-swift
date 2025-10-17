import Foundation

public struct BackgroundSpeechDenoisingPlan: Codable, Hashable, Sendable {
    /// Whether smart denoising using Krisp is enabled.
    public let smartDenoisingPlan: SmartDenoisingPlan?
    /// Whether Fourier denoising is enabled. Note that this is experimental and may not work as expected.
    /// 
    /// This can be combined with smart denoising, and will be run afterwards.
    public let fourierDenoisingPlan: FourierDenoisingPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        smartDenoisingPlan: SmartDenoisingPlan? = nil,
        fourierDenoisingPlan: FourierDenoisingPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.smartDenoisingPlan = smartDenoisingPlan
        self.fourierDenoisingPlan = fourierDenoisingPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.smartDenoisingPlan = try container.decodeIfPresent(SmartDenoisingPlan.self, forKey: .smartDenoisingPlan)
        self.fourierDenoisingPlan = try container.decodeIfPresent(FourierDenoisingPlan.self, forKey: .fourierDenoisingPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.smartDenoisingPlan, forKey: .smartDenoisingPlan)
        try container.encodeIfPresent(self.fourierDenoisingPlan, forKey: .fourierDenoisingPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case smartDenoisingPlan
        case fourierDenoisingPlan
    }
}
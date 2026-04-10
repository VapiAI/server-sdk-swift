import Foundation

public struct CartesiaGenerationConfigExperimental: Codable, Hashable, Sendable {
    /// Toggle accent localization for sonic-3: 0 (disabled, default) or 1 (enabled). When enabled, the voice adapts to match the transcript language accent while preserving vocal characteristics.
    public let accentLocalization: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accentLocalization: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accentLocalization = accentLocalization
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accentLocalization = try container.decodeIfPresent(Int.self, forKey: .accentLocalization)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.accentLocalization, forKey: .accentLocalization)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accentLocalization
    }
}
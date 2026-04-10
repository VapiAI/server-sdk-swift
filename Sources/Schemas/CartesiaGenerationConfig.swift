import Foundation

public struct CartesiaGenerationConfig: Codable, Hashable, Sendable {
    /// Fine-grained speed control for sonic-3. Only available for sonic-3 model.
    public let speed: Double?
    /// Fine-grained volume control for sonic-3. Only available for sonic-3 model.
    public let volume: Double?
    /// Experimental model controls for sonic-3. These are subject to breaking changes.
    public let experimental: CartesiaGenerationConfigExperimental?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        speed: Double? = nil,
        volume: Double? = nil,
        experimental: CartesiaGenerationConfigExperimental? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.speed = speed
        self.volume = volume
        self.experimental = experimental
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
        self.volume = try container.decodeIfPresent(Double.self, forKey: .volume)
        self.experimental = try container.decodeIfPresent(CartesiaGenerationConfigExperimental.self, forKey: .experimental)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.speed, forKey: .speed)
        try container.encodeIfPresent(self.volume, forKey: .volume)
        try container.encodeIfPresent(self.experimental, forKey: .experimental)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case speed
        case volume
        case experimental
    }
}
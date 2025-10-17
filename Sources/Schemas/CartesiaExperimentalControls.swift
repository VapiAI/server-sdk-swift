import Foundation

public struct CartesiaExperimentalControls: Codable, Hashable, Sendable {
    public let speed: CartesiaSpeedControl?
    public let emotion: CartesiaExperimentalControlsEmotion?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        speed: CartesiaSpeedControl? = nil,
        emotion: CartesiaExperimentalControlsEmotion? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.speed = speed
        self.emotion = emotion
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.speed = try container.decodeIfPresent(CartesiaSpeedControl.self, forKey: .speed)
        self.emotion = try container.decodeIfPresent(CartesiaExperimentalControlsEmotion.self, forKey: .emotion)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.speed, forKey: .speed)
        try container.encodeIfPresent(self.emotion, forKey: .emotion)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case speed
        case emotion
    }
}
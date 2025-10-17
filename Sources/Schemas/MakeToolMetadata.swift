import Foundation

public struct MakeToolMetadata: Codable, Hashable, Sendable {
    public let scenarioId: Double?
    public let triggerHookId: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        scenarioId: Double? = nil,
        triggerHookId: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.scenarioId = scenarioId
        self.triggerHookId = triggerHookId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.scenarioId = try container.decodeIfPresent(Double.self, forKey: .scenarioId)
        self.triggerHookId = try container.decodeIfPresent(Double.self, forKey: .triggerHookId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.scenarioId, forKey: .scenarioId)
        try container.encodeIfPresent(self.triggerHookId, forKey: .triggerHookId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case scenarioId
        case triggerHookId
    }
}
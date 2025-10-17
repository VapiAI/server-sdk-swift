import Foundation

public struct TurnLatency: Codable, Hashable, Sendable {
    /// This is the model latency for the first token.
    public let modelLatency: Double?
    /// This is the voice latency from the model output.
    public let voiceLatency: Double?
    /// This is the transcriber latency from the user speech.
    public let transcriberLatency: Double?
    /// This is the endpointing latency.
    public let endpointingLatency: Double?
    /// This is the latency for the whole turn.
    public let turnLatency: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        modelLatency: Double? = nil,
        voiceLatency: Double? = nil,
        transcriberLatency: Double? = nil,
        endpointingLatency: Double? = nil,
        turnLatency: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.modelLatency = modelLatency
        self.voiceLatency = voiceLatency
        self.transcriberLatency = transcriberLatency
        self.endpointingLatency = endpointingLatency
        self.turnLatency = turnLatency
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.modelLatency = try container.decodeIfPresent(Double.self, forKey: .modelLatency)
        self.voiceLatency = try container.decodeIfPresent(Double.self, forKey: .voiceLatency)
        self.transcriberLatency = try container.decodeIfPresent(Double.self, forKey: .transcriberLatency)
        self.endpointingLatency = try container.decodeIfPresent(Double.self, forKey: .endpointingLatency)
        self.turnLatency = try container.decodeIfPresent(Double.self, forKey: .turnLatency)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.modelLatency, forKey: .modelLatency)
        try container.encodeIfPresent(self.voiceLatency, forKey: .voiceLatency)
        try container.encodeIfPresent(self.transcriberLatency, forKey: .transcriberLatency)
        try container.encodeIfPresent(self.endpointingLatency, forKey: .endpointingLatency)
        try container.encodeIfPresent(self.turnLatency, forKey: .turnLatency)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case modelLatency
        case voiceLatency
        case transcriberLatency
        case endpointingLatency
        case turnLatency
    }
}
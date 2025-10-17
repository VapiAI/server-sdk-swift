import Foundation

public struct PerformanceMetrics: Codable, Hashable, Sendable {
    /// These are the individual latencies for each turn.
    public let turnLatencies: [TurnLatency]?
    /// This is the average latency for the model to output the first token.
    public let modelLatencyAverage: Double?
    /// This is the average latency for the text to speech.
    public let voiceLatencyAverage: Double?
    /// This is the average latency for the transcriber.
    public let transcriberLatencyAverage: Double?
    /// This is the average latency for the endpointing.
    public let endpointingLatencyAverage: Double?
    /// This is the average latency for complete turns.
    public let turnLatencyAverage: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        turnLatencies: [TurnLatency]? = nil,
        modelLatencyAverage: Double? = nil,
        voiceLatencyAverage: Double? = nil,
        transcriberLatencyAverage: Double? = nil,
        endpointingLatencyAverage: Double? = nil,
        turnLatencyAverage: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.turnLatencies = turnLatencies
        self.modelLatencyAverage = modelLatencyAverage
        self.voiceLatencyAverage = voiceLatencyAverage
        self.transcriberLatencyAverage = transcriberLatencyAverage
        self.endpointingLatencyAverage = endpointingLatencyAverage
        self.turnLatencyAverage = turnLatencyAverage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.turnLatencies = try container.decodeIfPresent([TurnLatency].self, forKey: .turnLatencies)
        self.modelLatencyAverage = try container.decodeIfPresent(Double.self, forKey: .modelLatencyAverage)
        self.voiceLatencyAverage = try container.decodeIfPresent(Double.self, forKey: .voiceLatencyAverage)
        self.transcriberLatencyAverage = try container.decodeIfPresent(Double.self, forKey: .transcriberLatencyAverage)
        self.endpointingLatencyAverage = try container.decodeIfPresent(Double.self, forKey: .endpointingLatencyAverage)
        self.turnLatencyAverage = try container.decodeIfPresent(Double.self, forKey: .turnLatencyAverage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.turnLatencies, forKey: .turnLatencies)
        try container.encodeIfPresent(self.modelLatencyAverage, forKey: .modelLatencyAverage)
        try container.encodeIfPresent(self.voiceLatencyAverage, forKey: .voiceLatencyAverage)
        try container.encodeIfPresent(self.transcriberLatencyAverage, forKey: .transcriberLatencyAverage)
        try container.encodeIfPresent(self.endpointingLatencyAverage, forKey: .endpointingLatencyAverage)
        try container.encodeIfPresent(self.turnLatencyAverage, forKey: .turnLatencyAverage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case turnLatencies
        case modelLatencyAverage
        case voiceLatencyAverage
        case transcriberLatencyAverage
        case endpointingLatencyAverage
        case turnLatencyAverage
    }
}
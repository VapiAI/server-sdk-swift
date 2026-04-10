import Foundation

public struct LatencyMetrics: Codable, Hashable, Sendable {
    /// This is the number of conversation turns.
    public let turnCount: Double
    /// This is the average total turn latency in milliseconds.
    public let avgTurn: Double?
    /// This is the average transcriber latency in milliseconds.
    public let avgTranscriber: Double?
    /// This is the average LLM/model latency in milliseconds.
    public let avgModel: Double?
    /// This is the average voice/TTS latency in milliseconds.
    public let avgVoice: Double?
    /// This is the average endpointing latency in milliseconds.
    public let avgEndpointing: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        turnCount: Double,
        avgTurn: Double? = nil,
        avgTranscriber: Double? = nil,
        avgModel: Double? = nil,
        avgVoice: Double? = nil,
        avgEndpointing: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.turnCount = turnCount
        self.avgTurn = avgTurn
        self.avgTranscriber = avgTranscriber
        self.avgModel = avgModel
        self.avgVoice = avgVoice
        self.avgEndpointing = avgEndpointing
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.turnCount = try container.decode(Double.self, forKey: .turnCount)
        self.avgTurn = try container.decodeIfPresent(Double.self, forKey: .avgTurn)
        self.avgTranscriber = try container.decodeIfPresent(Double.self, forKey: .avgTranscriber)
        self.avgModel = try container.decodeIfPresent(Double.self, forKey: .avgModel)
        self.avgVoice = try container.decodeIfPresent(Double.self, forKey: .avgVoice)
        self.avgEndpointing = try container.decodeIfPresent(Double.self, forKey: .avgEndpointing)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.turnCount, forKey: .turnCount)
        try container.encodeIfPresent(self.avgTurn, forKey: .avgTurn)
        try container.encodeIfPresent(self.avgTranscriber, forKey: .avgTranscriber)
        try container.encodeIfPresent(self.avgModel, forKey: .avgModel)
        try container.encodeIfPresent(self.avgVoice, forKey: .avgVoice)
        try container.encodeIfPresent(self.avgEndpointing, forKey: .avgEndpointing)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case turnCount
        case avgTurn
        case avgTranscriber
        case avgModel
        case avgVoice
        case avgEndpointing
    }
}
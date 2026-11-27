import Foundation

public struct TrafficTabLatencyMsDto: Codable, Hashable, Sendable {
    public let model: TrafficTabLatencyStatsDto
    public let voice: TrafficTabLatencyStatsDto
    public let transcriber: TrafficTabLatencyStatsDto
    public let turn: TrafficTabLatencyStatsDto
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: TrafficTabLatencyStatsDto,
        voice: TrafficTabLatencyStatsDto,
        transcriber: TrafficTabLatencyStatsDto,
        turn: TrafficTabLatencyStatsDto,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.voice = voice
        self.transcriber = transcriber
        self.turn = turn
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decode(TrafficTabLatencyStatsDto.self, forKey: .model)
        self.voice = try container.decode(TrafficTabLatencyStatsDto.self, forKey: .voice)
        self.transcriber = try container.decode(TrafficTabLatencyStatsDto.self, forKey: .transcriber)
        self.turn = try container.decode(TrafficTabLatencyStatsDto.self, forKey: .turn)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.voice, forKey: .voice)
        try container.encode(self.transcriber, forKey: .transcriber)
        try container.encode(self.turn, forKey: .turn)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case voice
        case transcriber
        case turn
    }
}
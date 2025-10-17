import Foundation

public struct TranscriberCost: Codable, Hashable, Sendable {
    /// This is the transcriber that was used during the call.
    /// 
    /// This matches one of the below:
    /// - `call.assistant.transcriber`,
    /// - `call.assistantId->transcriber`,
    /// - `call.squad[n].assistant.transcriber`,
    /// - `call.squad[n].assistantId->transcriber`,
    /// - `call.squadId->[n].assistant.transcriber`,
    /// - `call.squadId->[n].assistantId->transcriber`.
    public let transcriber: [String: JSONValue]
    /// This is the minutes of `transcriber` usage. This should match `call.endedAt` - `call.startedAt` for single assistant calls, while squad calls will have multiple transcriber costs one for each assistant that was used.
    public let minutes: Double
    /// This is the cost of the component in USD.
    public let cost: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        transcriber: [String: JSONValue],
        minutes: Double,
        cost: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.transcriber = transcriber
        self.minutes = minutes
        self.cost = cost
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transcriber = try container.decode([String: JSONValue].self, forKey: .transcriber)
        self.minutes = try container.decode(Double.self, forKey: .minutes)
        self.cost = try container.decode(Double.self, forKey: .cost)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.transcriber, forKey: .transcriber)
        try container.encode(self.minutes, forKey: .minutes)
        try container.encode(self.cost, forKey: .cost)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case transcriber
        case minutes
        case cost
    }
}
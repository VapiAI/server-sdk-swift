import Foundation

public struct TrafficTabCostBreakdownPerMinuteDto: Codable, Hashable, Sendable {
    public let llm: Nullable<Double>?
    public let stt: Nullable<Double>?
    public let tts: Nullable<Double>?
    public let vapi: Nullable<Double>?
    public let transport: Nullable<Double>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        llm: Nullable<Double>? = nil,
        stt: Nullable<Double>? = nil,
        tts: Nullable<Double>? = nil,
        vapi: Nullable<Double>? = nil,
        transport: Nullable<Double>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.llm = llm
        self.stt = stt
        self.tts = tts
        self.vapi = vapi
        self.transport = transport
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.llm = try container.decodeNullableIfPresent(Double.self, forKey: .llm)
        self.stt = try container.decodeNullableIfPresent(Double.self, forKey: .stt)
        self.tts = try container.decodeNullableIfPresent(Double.self, forKey: .tts)
        self.vapi = try container.decodeNullableIfPresent(Double.self, forKey: .vapi)
        self.transport = try container.decodeNullableIfPresent(Double.self, forKey: .transport)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.llm, forKey: .llm)
        try container.encodeNullableIfPresent(self.stt, forKey: .stt)
        try container.encodeNullableIfPresent(self.tts, forKey: .tts)
        try container.encodeNullableIfPresent(self.vapi, forKey: .vapi)
        try container.encodeNullableIfPresent(self.transport, forKey: .transport)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case llm
        case stt
        case tts
        case vapi
        case transport
    }
}
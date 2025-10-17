import Foundation

public struct ChunkPlan: Codable, Hashable, Sendable {
    /// This determines whether the model output is chunked before being sent to the voice provider. Default `true`.
    /// 
    /// Usage:
    /// - To rely on the voice provider's audio generation logic, set this to `false`.
    /// - If seeing issues with quality, set this to `true`.
    /// 
    /// If disabled, Vapi-provided audio control tokens like <flush /> will not work.
    /// 
    /// @default true
    public let enabled: Bool?
    /// This is the minimum number of characters in a chunk.
    /// 
    /// Usage:
    /// - To increase quality, set this to a higher value.
    /// - To decrease latency, set this to a lower value.
    /// 
    /// @default 30
    public let minCharacters: Double?
    /// These are the punctuations that are considered valid boundaries for a chunk to be created.
    /// 
    /// Usage:
    /// - To increase quality, constrain to fewer boundaries.
    /// - To decrease latency, enable all.
    /// 
    /// Default is automatically set to balance the trade-off between quality and latency based on the provider.
    public let punctuationBoundaries: [PunctuationBoundary]?
    /// This is the plan for formatting the chunk before it is sent to the voice provider.
    public let formatPlan: FormatPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        enabled: Bool? = nil,
        minCharacters: Double? = nil,
        punctuationBoundaries: [PunctuationBoundary]? = nil,
        formatPlan: FormatPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.enabled = enabled
        self.minCharacters = minCharacters
        self.punctuationBoundaries = punctuationBoundaries
        self.formatPlan = formatPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.minCharacters = try container.decodeIfPresent(Double.self, forKey: .minCharacters)
        self.punctuationBoundaries = try container.decodeIfPresent([PunctuationBoundary].self, forKey: .punctuationBoundaries)
        self.formatPlan = try container.decodeIfPresent(FormatPlan.self, forKey: .formatPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.minCharacters, forKey: .minCharacters)
        try container.encodeIfPresent(self.punctuationBoundaries, forKey: .punctuationBoundaries)
        try container.encodeIfPresent(self.formatPlan, forKey: .formatPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case enabled
        case minCharacters
        case punctuationBoundaries
        case formatPlan
    }
}
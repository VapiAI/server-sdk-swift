import Foundation

public struct ToolCallResultMessageWarning: Codable, Hashable, Sendable {
    /// The kind of warning. Currently:
    /// - `oversized-tool-response`: the tool's serialized response exceeded the
    ///   recommended size and is likely to bloat the model context, increasing
    ///   latency and risking truncation of earlier instructions.
    public let type: ToolCallResultMessageWarningType
    /// The estimated number of tokens in the serialized tool response.
    public let tokenCount: Double
    /// The threshold (in tokens) above which the warning is raised.
    public let threshold: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: ToolCallResultMessageWarningType,
        tokenCount: Double,
        threshold: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.tokenCount = tokenCount
        self.threshold = threshold
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ToolCallResultMessageWarningType.self, forKey: .type)
        self.tokenCount = try container.decode(Double.self, forKey: .tokenCount)
        self.threshold = try container.decode(Double.self, forKey: .threshold)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.tokenCount, forKey: .tokenCount)
        try container.encode(self.threshold, forKey: .threshold)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case tokenCount
        case threshold
    }
}
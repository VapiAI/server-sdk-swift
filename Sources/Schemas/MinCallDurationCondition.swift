import Foundation

public struct MinCallDurationCondition: Codable, Hashable, Sendable {
    /// This is the minimum call duration in seconds required for the structured
    /// output to run.
    /// 
    /// When timestamps are unavailable (for example, chat sessions have no call
    /// timestamps), this check passes and does not block the structured output.
    public let seconds: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        seconds: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.seconds = seconds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.seconds = try container.decode(Double.self, forKey: .seconds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.seconds, forKey: .seconds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case seconds
    }
}
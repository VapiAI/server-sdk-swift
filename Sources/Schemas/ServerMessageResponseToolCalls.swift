import Foundation

public struct ServerMessageResponseToolCalls: Codable, Hashable, Sendable {
    /// These are the results of the "tool-calls" message.
    public let results: [ToolCallResult]?
    /// This is the error message if the tool call was not successful.
    public let error: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        results: [ToolCallResult]? = nil,
        error: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.results = results
        self.error = error
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decodeIfPresent([ToolCallResult].self, forKey: .results)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.results, forKey: .results)
        try container.encodeIfPresent(self.error, forKey: .error)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case results
        case error
    }
}
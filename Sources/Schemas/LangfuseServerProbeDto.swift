import Foundation

public struct LangfuseServerProbeDto: Codable, Hashable, Sendable {
    /// The Langfuse host URL to probe, e.g. https://cloud.langfuse.com. Only the unauthenticated health endpoint is read; no keys are involved.
    public let apiUrl: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiUrl: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiUrl = apiUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiUrl = try container.decode(String.self, forKey: .apiUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.apiUrl, forKey: .apiUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiUrl
    }
}
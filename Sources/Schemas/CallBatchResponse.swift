import Foundation

public struct CallBatchResponse: Codable, Hashable, Sendable {
    /// This is the list of calls that were created.
    public let results: [Call]
    /// This is the list of calls that failed to be created.
    public let errors: [CallBatchError]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        results: [Call],
        errors: [CallBatchError],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.results = results
        self.errors = errors
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([Call].self, forKey: .results)
        self.errors = try container.decode([CallBatchError].self, forKey: .errors)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.results, forKey: .results)
        try container.encode(self.errors, forKey: .errors)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case results
        case errors
    }
}
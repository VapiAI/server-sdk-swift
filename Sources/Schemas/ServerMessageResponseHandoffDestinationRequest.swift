import Foundation

public struct ServerMessageResponseHandoffDestinationRequest: Codable, Hashable, Sendable {
    /// This is the local tool result message returned for the handoff tool call.
    public let result: String?
    /// This is the destination you'd like the call to be transferred to.
    public let destination: [String: JSONValue]
    /// This is the error message if the handoff should not be made.
    public let error: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        result: String? = nil,
        destination: [String: JSONValue],
        error: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.result = result
        self.destination = destination
        self.error = error
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.result = try container.decodeIfPresent(String.self, forKey: .result)
        self.destination = try container.decode([String: JSONValue].self, forKey: .destination)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.result, forKey: .result)
        try container.encode(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.error, forKey: .error)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case result
        case destination
        case error
    }
}
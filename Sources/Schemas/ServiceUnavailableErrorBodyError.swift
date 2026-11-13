import Foundation

public struct ServiceUnavailableErrorBodyError: Codable, Hashable, Sendable {
    public let statusCode: Double
    public let message: String
    public let error: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        statusCode: Double,
        message: String,
        error: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.statusCode = statusCode
        self.message = message
        self.error = error
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.statusCode = try container.decode(Double.self, forKey: .statusCode)
        self.message = try container.decode(String.self, forKey: .message)
        self.error = try container.decode(String.self, forKey: .error)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.statusCode, forKey: .statusCode)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.error, forKey: .error)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case statusCode
        case message
        case error
    }
}
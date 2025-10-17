import Foundation

public struct ResponseErrorEvent: Codable, Hashable, Sendable {
    /// Event type
    public let type: Error
    /// Error code
    public let code: String
    /// Error message
    public let message: String
    /// Parameter that caused the error
    public let param: Nullable<String>?
    /// Sequence number of the event
    public let sequenceNumber: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: Error,
        code: String,
        message: String,
        param: Nullable<String>? = nil,
        sequenceNumber: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.code = code
        self.message = message
        self.param = param
        self.sequenceNumber = sequenceNumber
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(Error.self, forKey: .type)
        self.code = try container.decode(String.self, forKey: .code)
        self.message = try container.decode(String.self, forKey: .message)
        self.param = try container.decodeNullableIfPresent(String.self, forKey: .param)
        self.sequenceNumber = try container.decode(Double.self, forKey: .sequenceNumber)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.message, forKey: .message)
        try container.encodeNullableIfPresent(self.param, forKey: .param)
        try container.encode(self.sequenceNumber, forKey: .sequenceNumber)
    }

    public enum Error: String, Codable, Hashable, CaseIterable, Sendable {
        case error
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case code
        case message
        case param
        case sequenceNumber = "sequence_number"
    }
}
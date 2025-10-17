import Foundation

public struct ResponseObject: Codable, Hashable, Sendable {
    /// Unique identifier for this Response
    public let id: String
    /// The object type
    public let object: Response
    /// Unix timestamp (in seconds) of when this Response was created
    public let createdAt: Double
    /// Status of the response
    public let status: ResponseObjectStatus
    /// Error message if the response failed
    public let error: Nullable<String>?
    /// Output messages from the model
    public let output: [ResponseOutputMessage]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        object: Response,
        createdAt: Double,
        status: ResponseObjectStatus,
        error: Nullable<String>? = nil,
        output: [ResponseOutputMessage],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.object = object
        self.createdAt = createdAt
        self.status = status
        self.error = error
        self.output = output
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.object = try container.decode(Response.self, forKey: .object)
        self.createdAt = try container.decode(Double.self, forKey: .createdAt)
        self.status = try container.decode(ResponseObjectStatus.self, forKey: .status)
        self.error = try container.decodeNullableIfPresent(String.self, forKey: .error)
        self.output = try container.decode([ResponseOutputMessage].self, forKey: .output)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.status, forKey: .status)
        try container.encodeNullableIfPresent(self.error, forKey: .error)
        try container.encode(self.output, forKey: .output)
    }

    public enum Response: String, Codable, Hashable, CaseIterable, Sendable {
        case response
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case object
        case createdAt = "created_at"
        case status
        case error
        case output
    }
}
import Foundation

public struct ResponseCompletedEvent: Codable, Hashable, Sendable {
    /// The completed response
    public let response: ResponseObject
    /// Event type
    public let type: ResponseCompletedEventType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        response: ResponseObject,
        type: ResponseCompletedEventType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.response = response
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.response = try container.decode(ResponseObject.self, forKey: .response)
        self.type = try container.decode(ResponseCompletedEventType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.response, forKey: .response)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case response
        case type
    }
}
import Foundation

public struct AssistantGoalErrorDto: Codable, Hashable, Sendable {
    public let statusCode: Int
    public let error: String?
    public let message: AssistantGoalErrorDtoMessage
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        statusCode: Int,
        error: String? = nil,
        message: AssistantGoalErrorDtoMessage,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.statusCode = statusCode
        self.error = error
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.statusCode = try container.decode(Int.self, forKey: .statusCode)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        self.message = try container.decode(AssistantGoalErrorDtoMessage.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.statusCode, forKey: .statusCode)
        try container.encodeIfPresent(self.error, forKey: .error)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case statusCode
        case error
        case message
    }
}
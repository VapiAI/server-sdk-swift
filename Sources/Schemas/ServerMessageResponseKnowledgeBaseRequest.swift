import Foundation

public struct ServerMessageResponseKnowledgeBaseRequest: Codable, Hashable, Sendable {
    /// This is the list of documents that will be sent to the model alongside the `messages` to generate a response.
    public let documents: [KnowledgeBaseResponseDocument]?
    /// This can be used to skip the model output generation and speak a custom message.
    public let message: CustomMessage?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        documents: [KnowledgeBaseResponseDocument]? = nil,
        message: CustomMessage? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.documents = documents
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.documents = try container.decodeIfPresent([KnowledgeBaseResponseDocument].self, forKey: .documents)
        self.message = try container.decodeIfPresent(CustomMessage.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.documents, forKey: .documents)
        try container.encodeIfPresent(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case documents
        case message
    }
}
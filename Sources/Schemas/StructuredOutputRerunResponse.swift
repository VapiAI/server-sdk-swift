import Foundation

public struct StructuredOutputRerunResponse: Codable, Hashable, Sendable {
    /// This is the id of the workflow processing the rerun.
    public let workflowId: String?
    public let message: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        workflowId: String? = nil,
        message: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.workflowId = workflowId
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.workflowId = try container.decodeIfPresent(String.self, forKey: .workflowId)
        self.message = try container.decode(String.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.workflowId, forKey: .workflowId)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case workflowId
        case message
    }
}
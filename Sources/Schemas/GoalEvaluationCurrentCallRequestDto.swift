import Foundation

public struct GoalEvaluationCurrentCallRequestDto: Codable, Hashable, Sendable {
    public let callId: String
    public let goalId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        callId: String,
        goalId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.callId = callId
        self.goalId = goalId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.callId = try container.decode(String.self, forKey: .callId)
        self.goalId = try container.decode(String.self, forKey: .goalId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.callId, forKey: .callId)
        try container.encode(self.goalId, forKey: .goalId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case callId
        case goalId
    }
}
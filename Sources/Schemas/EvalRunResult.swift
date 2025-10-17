import Foundation

public struct EvalRunResult: Codable, Hashable, Sendable {
    /// This is the status of the eval run result.
    /// The status is only 'pass' or 'fail' for an eval run result.
    /// Currently, An eval is considered `pass` only if all the Assistant Judge messages are evaluated to pass.
    public let status: EvalRunResultStatus
    /// This is the messages of the eval run result.
    /// It contains the user/system messages
    public let messages: [EvalRunResultMessagesItem]
    /// This is the start time of the eval run result.
    public let startedAt: Date
    /// This is the end time of the eval run result.
    public let endedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: EvalRunResultStatus,
        messages: [EvalRunResultMessagesItem],
        startedAt: Date,
        endedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.messages = messages
        self.startedAt = startedAt
        self.endedAt = endedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(EvalRunResultStatus.self, forKey: .status)
        self.messages = try container.decode([EvalRunResultMessagesItem].self, forKey: .messages)
        self.startedAt = try container.decode(Date.self, forKey: .startedAt)
        self.endedAt = try container.decode(Date.self, forKey: .endedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.messages, forKey: .messages)
        try container.encode(self.startedAt, forKey: .startedAt)
        try container.encode(self.endedAt, forKey: .endedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case messages
        case startedAt
        case endedAt
    }
}
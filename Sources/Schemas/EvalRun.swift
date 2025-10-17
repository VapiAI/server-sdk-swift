import Foundation

public struct EvalRun: Codable, Hashable, Sendable {
    /// This is the status of the eval run. When an eval run is created, the status is 'running'.
    /// When the eval run is completed, the status is 'ended'.
    public let status: EvalRunStatus
    /// This is the reason for the eval run to end.
    /// When the eval run is completed normally i.e end of mock conversation, the status is 'mockConversation.done'.
    /// When the eval fails due to an error like Chat error or incorrect configuration, the status is 'error'.
    /// When the eval runs for too long, due to model issues or tool call issues, the status is 'timeout'.
    /// When the eval run is cancelled by the user, the status is 'cancelled'.
    /// When the eval run is cancelled by Vapi for any reason, the status is 'aborted'.
    public let endedReason: EvalRunEndedReason
    /// This is the transient eval that will be run
    public let eval: CreateEvalDto?
    /// This is the target that will be run against the eval
    public let target: EvalRunTarget
    public let id: String
    public let orgId: String
    public let createdAt: Date
    public let startedAt: Date
    public let endedAt: Date
    /// This is the ended message when the eval run ended for any reason apart from mockConversation.done
    public let endedMessage: String?
    /// This is the results of the eval or suite run.
    /// The array will have a single item for an eval run, and multiple items each corresponding to the an eval in a suite run in the same order as the evals in the suite.
    public let results: [EvalRunResult]
    /// This is the type of the run.
    /// Currently it is fixed to `eval`.
    public let type: Eval
    /// This is the id of the eval that will be run.
    public let evalId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: EvalRunStatus,
        endedReason: EvalRunEndedReason,
        eval: CreateEvalDto? = nil,
        target: EvalRunTarget,
        id: String,
        orgId: String,
        createdAt: Date,
        startedAt: Date,
        endedAt: Date,
        endedMessage: String? = nil,
        results: [EvalRunResult],
        type: Eval,
        evalId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.endedReason = endedReason
        self.eval = eval
        self.target = target
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.startedAt = startedAt
        self.endedAt = endedAt
        self.endedMessage = endedMessage
        self.results = results
        self.type = type
        self.evalId = evalId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(EvalRunStatus.self, forKey: .status)
        self.endedReason = try container.decode(EvalRunEndedReason.self, forKey: .endedReason)
        self.eval = try container.decodeIfPresent(CreateEvalDto.self, forKey: .eval)
        self.target = try container.decode(EvalRunTarget.self, forKey: .target)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.startedAt = try container.decode(Date.self, forKey: .startedAt)
        self.endedAt = try container.decode(Date.self, forKey: .endedAt)
        self.endedMessage = try container.decodeIfPresent(String.self, forKey: .endedMessage)
        self.results = try container.decode([EvalRunResult].self, forKey: .results)
        self.type = try container.decode(Eval.self, forKey: .type)
        self.evalId = try container.decodeIfPresent(String.self, forKey: .evalId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.endedReason, forKey: .endedReason)
        try container.encodeIfPresent(self.eval, forKey: .eval)
        try container.encode(self.target, forKey: .target)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.startedAt, forKey: .startedAt)
        try container.encode(self.endedAt, forKey: .endedAt)
        try container.encodeIfPresent(self.endedMessage, forKey: .endedMessage)
        try container.encode(self.results, forKey: .results)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.evalId, forKey: .evalId)
    }

    public enum Eval: String, Codable, Hashable, CaseIterable, Sendable {
        case eval
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case endedReason
        case eval
        case target
        case id
        case orgId
        case createdAt
        case startedAt
        case endedAt
        case endedMessage
        case results
        case type
        case evalId
    }
}
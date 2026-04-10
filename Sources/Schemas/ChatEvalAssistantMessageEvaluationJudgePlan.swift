import Foundation

/// This is the judge plan that instructs how to evaluate the assistant message.
/// The assistant message can be evaluated against fixed content (exact match or RegEx) or with an LLM-as-judge by defining the evaluation criteria in a prompt.
public enum ChatEvalAssistantMessageEvaluationJudgePlan: Codable, Hashable, Sendable {
    case ai(AssistantMessageJudgePlanAi)
    case exact(AssistantMessageJudgePlanExact)
    case regex(AssistantMessageJudgePlanRegex)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "ai":
            self = .ai(try AssistantMessageJudgePlanAi(from: decoder))
        case "exact":
            self = .exact(try AssistantMessageJudgePlanExact(from: decoder))
        case "regex":
            self = .regex(try AssistantMessageJudgePlanRegex(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .ai(let data):
            try container.encode("ai", forKey: .type)
            try data.encode(to: encoder)
        case .exact(let data):
            try container.encode("exact", forKey: .type)
            try data.encode(to: encoder)
        case .regex(let data):
            try container.encode("regex", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}
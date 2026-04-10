import Foundation

/// This is the type of the judge plan.
/// Use 'ai' to evaluate the assistant message content using LLM-as-a-judge.
/// @default 'ai'
public enum AssistantMessageJudgePlanAiType: String, Codable, Hashable, CaseIterable, Sendable {
    case ai
}
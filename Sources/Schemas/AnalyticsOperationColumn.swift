import Foundation

/// This is the columns you want to perform the aggregation operation on.
public enum AnalyticsOperationColumn: String, Codable, Hashable, CaseIterable, Sendable {
    case id
    case cost
    case costBreakdownLlm = "costBreakdown.llm"
    case costBreakdownStt = "costBreakdown.stt"
    case costBreakdownTts = "costBreakdown.tts"
    case costBreakdownVapi = "costBreakdown.vapi"
    case costBreakdownTransport = "costBreakdown.transport"
    case costBreakdownAnalysisBreakdownSummary = "costBreakdown.analysisBreakdown.summary"
    case costBreakdownTranscriber = "costBreakdown.transcriber"
    case costBreakdownTtsCharacters = "costBreakdown.ttsCharacters"
    case costBreakdownLlmPromptTokens = "costBreakdown.llmPromptTokens"
    case costBreakdownLlmCompletionTokens = "costBreakdown.llmCompletionTokens"
    case duration
    case concurrency
    case minutesUsed
}
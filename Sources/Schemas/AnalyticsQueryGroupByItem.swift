import Foundation

public enum AnalyticsQueryGroupByItem: String, Codable, Hashable, CaseIterable, Sendable {
    case type
    case assistantId
    case endedReason
    case analysisSuccessEvaluation = "analysis.successEvaluation"
    case status
}
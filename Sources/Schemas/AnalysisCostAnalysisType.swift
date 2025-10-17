import Foundation

/// This is the type of analysis performed.
public enum AnalysisCostAnalysisType: String, Codable, Hashable, CaseIterable, Sendable {
    case summary
    case structuredData
    case successEvaluation
    case structuredOutput
}
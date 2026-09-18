import Foundation

/// Routes assistant call observability data to Langfuse.
public enum LangfuseObservabilityPlanProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case langfuse
}
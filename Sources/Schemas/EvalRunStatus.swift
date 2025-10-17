import Foundation

/// This is the status of the eval run. When an eval run is created, the status is 'running'.
/// When the eval run is completed, the status is 'ended'.
public enum EvalRunStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case running
    case ended
    case queued
}
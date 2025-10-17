import Foundation

/// This is the status of the call.
public enum CallStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case scheduled
    case queued
    case ringing
    case inProgress = "in-progress"
    case forwarding
    case ended
    case notFound = "not-found"
    case deletionFailed = "deletion-failed"
}
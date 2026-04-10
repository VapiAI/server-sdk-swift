import Foundation

/// This is the type of the message. "end-of-call-report" is sent when the call ends and post-processing is complete.
public enum ServerMessageEndOfCallReportType: String, Codable, Hashable, CaseIterable, Sendable {
    case endOfCallReport = "end-of-call-report"
}
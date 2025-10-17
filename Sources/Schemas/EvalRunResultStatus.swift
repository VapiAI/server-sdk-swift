import Foundation

/// This is the status of the eval run result.
/// The status is only 'pass' or 'fail' for an eval run result.
/// Currently, An eval is considered `pass` only if all the Assistant Judge messages are evaluated to pass.
public enum EvalRunResultStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pass
    case fail
}
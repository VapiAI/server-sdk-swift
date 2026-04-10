import Foundation

/// This is the type of the run.
/// Currently it is fixed to `eval`.
public enum EvalRunType: String, Codable, Hashable, CaseIterable, Sendable {
    case eval
}
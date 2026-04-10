import Foundation

/// This is the type of the run.
/// Currently it is fixed to `eval`.
public enum CreateEvalRunDtoType: String, Codable, Hashable, CaseIterable, Sendable {
    case eval
}
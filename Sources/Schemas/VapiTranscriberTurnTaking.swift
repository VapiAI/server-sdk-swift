import Foundation

/// This is the turn-taking mode. `intelligent` uses the underlying model's
/// native end-of-turn detection; `manual` ignores it and waits a fixed
/// end-of-turn delay. Defaults to `intelligent`.
public enum VapiTranscriberTurnTaking: String, Codable, Hashable, CaseIterable, Sendable {
    case intelligent
    case manual
}
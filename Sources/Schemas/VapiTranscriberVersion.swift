import Foundation

/// This is the version of the Vapi transcriber. Vapi manages the underlying
/// model and routing. When omitted, the latest version is used.
/// 
/// Managed version params are additive-only and `'latest'` is an auto-update
/// channel — see the param-evolution INVARIANT in `vapiManaged/types.ts`.
public enum VapiTranscriberVersion: String, Codable, Hashable, CaseIterable, Sendable {
    case latest
    case one = "1"
}
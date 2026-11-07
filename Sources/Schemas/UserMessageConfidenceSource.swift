import Foundation

/// Whether `confidence` came directly from the transcriber ('provider') or
/// was computed by Vapi ('derived').
/// 
/// 'derived' means Vapi computed the score from the transcriber's per-word
/// scores; the exact aggregation is provider-specific (an average, a median
/// or a minimum, depending on the transcriber). It is also 'derived' when
/// consecutive transcript fragments were merged into one message, where the
/// score is the minimum across the fragments.
/// 
/// Absent means no trustworthy score was available for this message: either
/// the transcriber does not report one, or the value it reported was invalid
/// and was dropped. A merged message is unmarked whenever any fragment it
/// contains was unmarked.
public enum UserMessageConfidenceSource: String, Codable, Hashable, CaseIterable, Sendable {
    case provider
    case derived
}
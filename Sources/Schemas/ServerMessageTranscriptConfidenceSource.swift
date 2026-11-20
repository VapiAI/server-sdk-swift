import Foundation

/// Whether `confidence` came directly from the transcriber ('provider') or
/// was computed by Vapi ('derived').
/// 
/// 'derived' means Vapi computed the score from the transcriber's per-word
/// scores; the exact aggregation is provider-specific (an average, a median
/// or a minimum, depending on the transcriber).
/// 
/// Absent means no trustworthy score was available for this transcript:
/// either the transcriber does not report one, or the value it reported was
/// invalid and was dropped.
public enum ServerMessageTranscriptConfidenceSource: String, Codable, Hashable, CaseIterable, Sendable {
    case provider
    case derived
}
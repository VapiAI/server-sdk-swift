import Foundation

/// This is the transcription mode used by the `universal-3-5-pro` speech model. Only applies to the `universal-3-5-pro` speech model.
/// 
/// @default 'balanced'
public enum AssemblyAiTranscriberMode: String, Codable, Hashable, CaseIterable, Sendable {
    case maxAccuracy = "max_accuracy"
    case minLatency = "min_latency"
    case balanced
}
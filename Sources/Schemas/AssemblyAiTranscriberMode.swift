import Foundation

/// This is the transcription mode used by the Universal Pro speech models. Only applies to `universal-3-5-pro` and `universal-3-6-pro`.
/// 
/// @default 'balanced'
public enum AssemblyAiTranscriberMode: String, Codable, Hashable, CaseIterable, Sendable {
    case maxAccuracy = "max_accuracy"
    case minLatency = "min_latency"
    case balanced
}
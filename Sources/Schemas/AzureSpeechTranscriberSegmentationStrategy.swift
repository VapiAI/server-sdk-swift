import Foundation

/// Controls how phrase boundaries are detected, enabling either simple time/silence heuristics or more advanced semantic segmentation.
public enum AzureSpeechTranscriberSegmentationStrategy: String, Codable, Hashable, CaseIterable, Sendable {
    case `default` = "Default"
    case time = "Time"
    case semantic = "Semantic"
}
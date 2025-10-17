import Foundation

/// This determines the format of the recording. Defaults to `wav;l16`.
/// 
/// @default 'wav;l16'
public enum ArtifactPlanRecordingFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case wavL16 = "wav;l16"
    case mp3
}
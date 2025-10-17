import Foundation

/// This is the region for the Speechmatics API. Choose between EU (Europe) and US (United States) regions for lower latency and data sovereignty compliance.
/// 
/// @default 'eu'
public enum SpeechmaticsTranscriberRegion: String, Codable, Hashable, CaseIterable, Sendable {
    case eu
    case us
}
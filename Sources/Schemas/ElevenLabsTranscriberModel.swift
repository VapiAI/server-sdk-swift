import Foundation

public enum ElevenLabsTranscriberModel: String, Codable, Hashable, CaseIterable, Sendable {
    case scribeV1 = "scribe_v1"
    case scribeV2 = "scribe_v2"
    case scribeV2Realtime = "scribe_v2_realtime"
}
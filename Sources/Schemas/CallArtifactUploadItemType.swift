import Foundation

/// The artifact this result refers to.
public enum CallArtifactUploadItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case endOfCallReport = "end-of-call-report"
    case recordingMono = "recording-mono"
    case recordingStereo = "recording-stereo"
    case recordingAssistant = "recording-assistant"
    case recordingCustomer = "recording-customer"
    case log
    case pcap
}
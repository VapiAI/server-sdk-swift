import Foundation

/// This is the type of recording consent.
public enum RecordingConsentType: String, Codable, Hashable, CaseIterable, Sendable {
    case stayOnLine = "stay-on-line"
    case verbal
}
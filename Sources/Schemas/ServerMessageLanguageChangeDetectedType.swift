import Foundation

/// This is the type of the message. "language-change-detected" is sent when the transcriber is automatically switched based on the detected language.
public enum ServerMessageLanguageChangeDetectedType: String, Codable, Hashable, CaseIterable, Sendable {
    case languageChangeDetected = "language-change-detected"
}
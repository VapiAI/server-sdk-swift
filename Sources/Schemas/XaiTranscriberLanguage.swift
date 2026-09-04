import Foundation

/// Single language for transcription as an ISO 639-1 code (e.g., `en`, `es`). Defaults to `en` if not set. xAI auto-detects when omitted via the API but Vapi defaults to English for deterministic behavior.
public enum XaiTranscriberLanguage: String, Codable, Hashable, CaseIterable, Sendable {
    case ar
    case cs
    case da
    case nl
    case en
    case fil
    case fr
    case de
    case hi
    case id
    case it
    case ja
    case ko
    case mk
    case ms
    case fa
    case pl
    case pt
    case ro
    case ru
    case es
    case sv
    case th
    case tr
    case vi
}
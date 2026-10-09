import Foundation

/// The Vapi voice routing generation. `latest` auto-updates to the newest generation; version 1 uses legacy mappings; version 2 can use xAI-backed voices when available. When omitted, Version 1 is used. Accepts the string channel ('latest', '1', '2'); legacy numeric values (1, 2) are also accepted and coerced to their string form.
public enum VapiVoiceVersion: String, Codable, Hashable, CaseIterable, Sendable {
    case one = "1"
    case two = "2"
    case latest
}
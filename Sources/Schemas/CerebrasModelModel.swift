import Foundation

/// The Cerebras model used to generate assistant responses. `llama-3.3-70b` is deprecated and no longer available in the Dashboard.
public enum CerebrasModelModel: String, Codable, Hashable, CaseIterable, Sendable {
    case llama318B = "llama3.1-8b"
}
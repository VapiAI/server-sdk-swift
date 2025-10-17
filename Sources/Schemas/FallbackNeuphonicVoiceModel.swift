import Foundation

/// This is the model that will be used. Defaults to 'neu_fast' if not specified.
public enum FallbackNeuphonicVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case neuHq = "neu_hq"
    case neuFast = "neu_fast"
}
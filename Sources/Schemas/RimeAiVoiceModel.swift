import Foundation

/// This is the model that will be used. Defaults to 'arcana' when not specified.
public enum RimeAiVoiceModel: String, Codable, Hashable, CaseIterable, Sendable {
    case arcana
    case coda
    case mistv2
    case mistv3
    case mist
}
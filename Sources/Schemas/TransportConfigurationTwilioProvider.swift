import Foundation

/// Selects Twilio as the call transport provider.
public enum TransportConfigurationTwilioProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case twilio
}
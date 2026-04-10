import Foundation

/// The type of transport to use for sending the chat response.
/// Currently supports 'twilio.sms' for SMS delivery via Twilio.
public enum TwilioSmsChatTransportType: String, Codable, Hashable, CaseIterable, Sendable {
    case twilioSms = "twilio.sms"
}
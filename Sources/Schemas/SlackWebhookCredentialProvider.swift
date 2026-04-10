import Foundation

public enum SlackWebhookCredentialProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case slackWebhook = "slack-webhook"
}
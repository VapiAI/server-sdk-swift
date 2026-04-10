import Foundation

public enum SlackOAuth2AuthorizationCredentialProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case slackOauth2Authorization = "slack.oauth2-authorization"
}
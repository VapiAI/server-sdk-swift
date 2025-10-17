import Foundation

/// This is the channel of the org. There is the cluster the API traffic for the org will be directed.
public enum OrgChannel: String, Codable, Hashable, CaseIterable, Sendable {
    case `default`
    case weekly
}
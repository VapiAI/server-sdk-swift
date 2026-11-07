import Foundation

/// This is the HTTP method for the request (api-request tool).
public enum UpdateToolDraftDtoMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
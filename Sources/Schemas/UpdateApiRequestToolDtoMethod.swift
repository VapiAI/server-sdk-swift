import Foundation

/// The HTTP method used for the API request.
public enum UpdateApiRequestToolDtoMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
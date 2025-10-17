import Foundation

public enum UpdateApiRequestToolDtoMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
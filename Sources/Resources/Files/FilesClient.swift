import Foundation

public final class FilesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(requestOptions: RequestOptions? = nil) async throws -> [File] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/file",
            requestOptions: requestOptions,
            responseType: [File].self
        )
    }

    public func create(request: Requests.CreateFileDto, requestOptions: RequestOptions? = nil) async throws -> File {
        return try await httpClient.performRequest(
            method: .post,
            path: "/file",
            contentType: .multipartFormData,
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: File.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> File {
        return try await httpClient.performRequest(
            method: .get,
            path: "/file/\(id)",
            requestOptions: requestOptions,
            responseType: File.self
        )
    }

    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> File {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/file/\(id)",
            requestOptions: requestOptions,
            responseType: File.self
        )
    }

    public func update(id: String, request: Requests.UpdateFileDto, requestOptions: RequestOptions? = nil) async throws -> File {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/file/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: File.self
        )
    }
}
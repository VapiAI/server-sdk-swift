import Foundation

public final class FilesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns files uploaded to the authenticated organization.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(purpose: String, requestOptions: RequestOptions? = nil) async throws -> [File] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/file",
            queryParams: [
                "purpose": .string(purpose)
            ],
            requestOptions: requestOptions,
            responseType: [File].self
        )
    }

    /// Uploads a file for use with a Vapi knowledge base.
    ///
    /// - Parameter request: A file-upload request containing the file to store and process in Vapi.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
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

    /// Returns the uploaded file identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the file.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> File {
        return try await httpClient.performRequest(
            method: .get,
            path: "/file/\(id)",
            requestOptions: requestOptions,
            responseType: File.self
        )
    }

    /// Deletes the uploaded file identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the file.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> File {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/file/\(id)",
            requestOptions: requestOptions,
            responseType: File.self
        )
    }

    /// Updates the name of the uploaded file identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the file.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
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
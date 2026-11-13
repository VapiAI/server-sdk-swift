import Foundation

public final class StructuredOutputsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns structured-output definitions for the authenticated organization. Filter results by ID, name, or creation and update timestamps.
    ///
    /// - Parameter id: This will return structured outputs where the id matches the specified value.
    /// - Parameter name: This will return structured outputs where the name matches the specified value.
    /// - Parameter page: This is the page number to return. Defaults to 1.
    /// - Parameter sortOrder: This is the sort order for pagination. Defaults to 'DESC'.
    /// - Parameter sortBy: This is the column to sort by. Defaults to 'createdAt'.
    /// - Parameter limit: This is the maximum number of items to return. Defaults to 100.
    /// - Parameter createdAtGt: This will return items where the createdAt is greater than the specified value.
    /// - Parameter createdAtLt: This will return items where the createdAt is less than the specified value.
    /// - Parameter createdAtGe: This will return items where the createdAt is greater than or equal to the specified value.
    /// - Parameter createdAtLe: This will return items where the createdAt is less than or equal to the specified value.
    /// - Parameter updatedAtGt: This will return items where the updatedAt is greater than the specified value.
    /// - Parameter updatedAtLt: This will return items where the updatedAt is less than the specified value.
    /// - Parameter updatedAtGe: This will return items where the updatedAt is greater than or equal to the specified value.
    /// - Parameter updatedAtLe: This will return items where the updatedAt is less than or equal to the specified value.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func structuredOutputControllerFindAll(id: String? = nil, name: String? = nil, page: Double? = nil, sortOrder: StructuredOutputControllerFindAllRequestSortOrder? = nil, sortBy: StructuredOutputControllerFindAllRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> StructuredOutputPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/structured-output",
            queryParams: [
                "id": id.map { .string($0) }, 
                "name": name.map { .string($0) }, 
                "page": page.map { .double($0) }, 
                "sortOrder": sortOrder.map { .string($0.rawValue) }, 
                "sortBy": sortBy.map { .string($0.rawValue) }, 
                "limit": limit.map { .double($0) }, 
                "createdAtGt": createdAtGt.map { .date($0) }, 
                "createdAtLt": createdAtLt.map { .date($0) }, 
                "createdAtGe": createdAtGe.map { .date($0) }, 
                "createdAtLe": createdAtLe.map { .date($0) }, 
                "updatedAtGt": updatedAtGt.map { .date($0) }, 
                "updatedAtLt": updatedAtLt.map { .date($0) }, 
                "updatedAtGe": updatedAtGe.map { .date($0) }, 
                "updatedAtLe": updatedAtLe.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: StructuredOutputPaginatedResponse.self
        )
    }

    /// Creates a reusable definition for extracting validated data from conversations using an AI model or regular expression.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func structuredOutputControllerCreate(request: CreateStructuredOutputDto, requestOptions: RequestOptions? = nil) async throws -> StructuredOutput {
        return try await httpClient.performRequest(
            method: .post,
            path: "/structured-output",
            body: request,
            requestOptions: requestOptions,
            responseType: StructuredOutput.self
        )
    }

    /// Returns the structured-output definition identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the structured output.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func structuredOutputControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> StructuredOutput {
        return try await httpClient.performRequest(
            method: .get,
            path: "/structured-output/\(id)",
            requestOptions: requestOptions,
            responseType: StructuredOutput.self
        )
    }

    /// Deletes the structured-output definition identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the structured output.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func structuredOutputControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> StructuredOutput {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/structured-output/\(id)",
            requestOptions: requestOptions,
            responseType: StructuredOutput.self
        )
    }

    /// Updates the structured-output definition identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the structured output.
    /// - Parameter schemaOverride: Set to the string `true` to allow changing the schema's top-level type. Other values do not enable schema type changes.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func structuredOutputControllerUpdate(id: String, schemaOverride: String, request: Requests.UpdateStructuredOutputDto, requestOptions: RequestOptions? = nil) async throws -> StructuredOutput {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/structured-output/\(id)",
            queryParams: [
                "schemaOverride": .string(schemaOverride)
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: StructuredOutput.self
        )
    }

    /// Runs a saved or transient structured-output definition against one or more calls, optionally returning a preview without updating call artifacts.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func structuredOutputControllerRun(request: Requests.StructuredOutputRunDto, requestOptions: RequestOptions? = nil) async throws -> StructuredOutputControllerRunResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/structured-output/run",
            body: request,
            requestOptions: requestOptions,
            responseType: StructuredOutputControllerRunResponse.self
        )
    }
}
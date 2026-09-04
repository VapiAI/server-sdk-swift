import Foundation

public final class EvalClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns eval definitions for the authenticated organization. Filter results by ID or creation and update timestamps.
    ///
    /// - Parameter id: Filters eval definitions by ID.
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
    public func evalControllerGetPaginated(id: String? = nil, page: Double? = nil, sortOrder: EvalControllerGetPaginatedRequestSortOrder? = nil, sortBy: EvalControllerGetPaginatedRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> EvalPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval",
            queryParams: [
                "id": id.map { .string($0) }, 
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
            responseType: EvalPaginatedResponse.self
        )
    }

    /// Creates a reusable eval that defines a mock conversation and checkpoints for evaluating assistant responses and tool calls.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func evalControllerCreate(request: CreateEvalDto, requestOptions: RequestOptions? = nil) async throws -> Eval {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval",
            body: request,
            requestOptions: requestOptions,
            responseType: Eval.self
        )
    }

    /// Returns the eval definition identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the eval definition.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func evalControllerGet(id: String, requestOptions: RequestOptions? = nil) async throws -> Eval {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/\(id)",
            requestOptions: requestOptions,
            responseType: Eval.self
        )
    }

    /// Deletes the eval definition identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the eval definition.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func evalControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> Eval {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/eval/\(id)",
            requestOptions: requestOptions,
            responseType: Eval.self
        )
    }

    /// Updates the eval definition identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the eval definition.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func evalControllerUpdate(id: String, request: Requests.UpdateEvalDto, requestOptions: RequestOptions? = nil) async throws -> Eval {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/eval/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Eval.self
        )
    }

    /// Returns the eval run identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the eval run.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func evalControllerGetRun(id: String, requestOptions: RequestOptions? = nil) async throws -> EvalRun {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/run/\(id)",
            requestOptions: requestOptions,
            responseType: EvalRun.self
        )
    }

    /// Deletes the eval run identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the eval run.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func evalControllerRemoveRun(id: String, requestOptions: RequestOptions? = nil) async throws -> EvalRun {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/eval/run/\(id)",
            requestOptions: requestOptions,
            responseType: EvalRun.self
        )
    }

    /// Returns eval runs for the authenticated organization. Filter results by ID or creation and update timestamps.
    ///
    /// - Parameter id: Filters eval runs by ID.
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
    public func evalControllerGetRunsPaginated(id: String? = nil, page: Double? = nil, sortOrder: EvalControllerGetRunsPaginatedRequestSortOrder? = nil, sortBy: EvalControllerGetRunsPaginatedRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> EvalRunPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/run",
            queryParams: [
                "id": id.map { .string($0) }, 
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
            responseType: EvalRunPaginatedResponse.self
        )
    }

    /// Runs a saved or transient eval against an assistant or squad and creates an eval-run record containing the results.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func evalControllerRun(request: Requests.CreateEvalRunDto, requestOptions: RequestOptions? = nil) async throws -> [String: JSONValue] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval/run",
            body: request,
            requestOptions: requestOptions,
            responseType: [String: JSONValue].self
        )
    }
}
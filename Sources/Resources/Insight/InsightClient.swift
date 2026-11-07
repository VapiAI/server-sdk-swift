import Foundation

public final class InsightClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns saved reporting insights for the authenticated organization. Filter results by ID or creation and update timestamps.
    ///
    /// - Parameter id: Filters reporting insights by ID.
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
    public func insightControllerFindAll(id: String? = nil, page: Double? = nil, sortOrder: InsightControllerFindAllRequestSortOrder? = nil, sortBy: InsightControllerFindAllRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> InsightPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reporting/insight",
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
            responseType: InsightPaginatedResponse.self
        )
    }

    /// Creates a saved reporting insight that queries call data and presents the results as a bar chart, pie chart, line chart, or text value.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func insightControllerCreate(request: InsightControllerCreateRequest, requestOptions: RequestOptions? = nil) async throws -> InsightControllerCreateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/reporting/insight",
            body: request,
            requestOptions: requestOptions,
            responseType: InsightControllerCreateResponse.self
        )
    }

    /// Returns the reporting insight identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the reporting insight.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func insightControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> InsightControllerFindOneResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reporting/insight/\(id)",
            requestOptions: requestOptions,
            responseType: InsightControllerFindOneResponse.self
        )
    }

    /// Deletes the reporting insight identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the reporting insight.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func insightControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> InsightControllerRemoveResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/reporting/insight/\(id)",
            requestOptions: requestOptions,
            responseType: InsightControllerRemoveResponse.self
        )
    }

    /// Updates the reporting insight identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the reporting insight.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func insightControllerUpdate(id: String, request: InsightControllerUpdateRequestBody, requestOptions: RequestOptions? = nil) async throws -> InsightControllerUpdateResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/reporting/insight/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: InsightControllerUpdateResponse.self
        )
    }

    /// Runs a saved reporting insight, optionally overriding its time range and response format.
    ///
    /// - Parameter id: The unique identifier of the reporting insight.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func insightControllerRun(id: String, request: Requests.InsightRunDto, requestOptions: RequestOptions? = nil) async throws -> InsightRunResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/reporting/insight/\(id)/run",
            body: request,
            requestOptions: requestOptions,
            responseType: InsightRunResponse.self
        )
    }

    /// Runs an insight definition without first saving it, returning a preview of the resulting chart or text value.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func insightControllerPreview(request: InsightControllerPreviewRequest, requestOptions: RequestOptions? = nil) async throws -> InsightRunResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/reporting/insight/preview",
            body: request,
            requestOptions: requestOptions,
            responseType: InsightRunResponse.self
        )
    }
}
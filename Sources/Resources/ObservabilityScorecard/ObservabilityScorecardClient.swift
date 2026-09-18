import Foundation

public final class ObservabilityScorecardClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns the scorecard identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the scorecard.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func scorecardControllerGet(id: String, requestOptions: RequestOptions? = nil) async throws -> Scorecard {
        return try await httpClient.performRequest(
            method: .get,
            path: "/observability/scorecard/\(id)",
            requestOptions: requestOptions,
            responseType: Scorecard.self
        )
    }

    /// Deletes the scorecard identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the scorecard.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func scorecardControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> Scorecard {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/observability/scorecard/\(id)",
            requestOptions: requestOptions,
            responseType: Scorecard.self
        )
    }

    /// Updates the scorecard identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the scorecard.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func scorecardControllerUpdate(id: String, request: Requests.UpdateScorecardDto, requestOptions: RequestOptions? = nil) async throws -> Scorecard {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/observability/scorecard/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Scorecard.self
        )
    }

    /// Returns scorecards for the authenticated organization. Filter results by ID or creation and update timestamps.
    ///
    /// - Parameter id: Filters scorecards by ID.
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
    public func scorecardControllerGetPaginated(id: String? = nil, page: Double? = nil, sortOrder: ScorecardControllerGetPaginatedRequestSortOrder? = nil, sortBy: ScorecardControllerGetPaginatedRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ScorecardPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/observability/scorecard",
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
            responseType: ScorecardPaginatedResponse.self
        )
    }

    /// Creates a scorecard containing metrics, scoring conditions, and optional links to assistants whose calls should be evaluated.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func scorecardControllerCreate(request: CreateScorecardDto, requestOptions: RequestOptions? = nil) async throws -> Scorecard {
        return try await httpClient.performRequest(
            method: .post,
            path: "/observability/scorecard",
            body: request,
            requestOptions: requestOptions,
            responseType: Scorecard.self
        )
    }
}
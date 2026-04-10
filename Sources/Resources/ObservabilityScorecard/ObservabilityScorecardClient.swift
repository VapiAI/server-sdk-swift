import Foundation

public final class ObservabilityScorecardClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func scorecardControllerGet(id: String, requestOptions: RequestOptions? = nil) async throws -> Scorecard {
        return try await httpClient.performRequest(
            method: .get,
            path: "/observability/scorecard/\(id)",
            requestOptions: requestOptions,
            responseType: Scorecard.self
        )
    }

    public func scorecardControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> Scorecard {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/observability/scorecard/\(id)",
            requestOptions: requestOptions,
            responseType: Scorecard.self
        )
    }

    public func scorecardControllerUpdate(id: String, request: Requests.UpdateScorecardDto, requestOptions: RequestOptions? = nil) async throws -> Scorecard {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/observability/scorecard/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Scorecard.self
        )
    }

    public func scorecardControllerGetPaginated(id: String? = nil, page: Double? = nil, sortOrder: ScorecardControllerGetPaginatedRequestSortOrder? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ScorecardPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/observability/scorecard",
            queryParams: [
                "id": id.map { .string($0) }, 
                "page": page.map { .double($0) }, 
                "sortOrder": sortOrder.map { .string($0.rawValue) }, 
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
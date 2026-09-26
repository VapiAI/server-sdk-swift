import Foundation

public final class BoardClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func boardControllerFindAll(page: Double? = nil, sortOrder: BoardControllerFindAllRequestSortOrder? = nil, sortBy: BoardControllerFindAllRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> BoardPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reporting/board",
            queryParams: [
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
            responseType: BoardPaginatedResponse.self
        )
    }

    public func boardControllerCreate(request: Requests.CreateBoardDto, requestOptions: RequestOptions? = nil) async throws -> Board {
        return try await httpClient.performRequest(
            method: .post,
            path: "/reporting/board",
            body: request,
            requestOptions: requestOptions,
            responseType: Board.self
        )
    }

    public func boardControllerMetricsOverviewEnsure(requestOptions: RequestOptions? = nil) async throws -> Board {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reporting/board/default/metrics-overview",
            requestOptions: requestOptions,
            responseType: Board.self
        )
    }

    public func boardControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> Board {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reporting/board/\(id)",
            requestOptions: requestOptions,
            responseType: Board.self
        )
    }

    public func boardControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> Board {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/reporting/board/\(id)",
            requestOptions: requestOptions,
            responseType: Board.self
        )
    }

    public func boardControllerUpdate(id: String, request: Requests.UpdateBoardDto, requestOptions: RequestOptions? = nil) async throws -> Board {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/reporting/board/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Board.self
        )
    }
}
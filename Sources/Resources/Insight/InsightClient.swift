import Foundation

public final class InsightClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func insightControllerFindAll(id: String? = nil, page: Double? = nil, sortOrder: InsightControllerFindAllRequestSortOrder? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> InsightPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reporting/insight",
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
            responseType: InsightPaginatedResponse.self
        )
    }

    public func insightControllerCreate(request: InsightControllerCreateRequest, requestOptions: RequestOptions? = nil) async throws -> InsightControllerCreateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/reporting/insight",
            body: request,
            requestOptions: requestOptions,
            responseType: InsightControllerCreateResponse.self
        )
    }

    public func insightControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> InsightControllerFindOneResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reporting/insight/\(id)",
            requestOptions: requestOptions,
            responseType: InsightControllerFindOneResponse.self
        )
    }

    public func insightControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> InsightControllerRemoveResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/reporting/insight/\(id)",
            requestOptions: requestOptions,
            responseType: InsightControllerRemoveResponse.self
        )
    }

    public func insightControllerUpdate(id: String, request: InsightControllerUpdateRequestBody, requestOptions: RequestOptions? = nil) async throws -> InsightControllerUpdateResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/reporting/insight/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: InsightControllerUpdateResponse.self
        )
    }

    public func insightControllerRun(id: String, request: Requests.InsightRunDto, requestOptions: RequestOptions? = nil) async throws -> InsightRunResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/reporting/insight/\(id)/run",
            body: request,
            requestOptions: requestOptions,
            responseType: InsightRunResponse.self
        )
    }

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
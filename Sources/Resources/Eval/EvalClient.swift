import Foundation

public final class EvalClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func evalControllerGetPaginated(id: String? = nil, page: Double? = nil, sortOrder: EvalControllerGetPaginatedRequestSortOrder? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> EvalPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval",
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
            responseType: EvalPaginatedResponse.self
        )
    }

    public func evalControllerCreate(request: CreateEvalDto, requestOptions: RequestOptions? = nil) async throws -> Eval {
        return try await httpClient.performRequest(
            method: .post,
            path: "/eval",
            body: request,
            requestOptions: requestOptions,
            responseType: Eval.self
        )
    }

    public func evalControllerGet(id: String, requestOptions: RequestOptions? = nil) async throws -> Eval {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/\(id)",
            requestOptions: requestOptions,
            responseType: Eval.self
        )
    }

    public func evalControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> Eval {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/eval/\(id)",
            requestOptions: requestOptions,
            responseType: Eval.self
        )
    }

    public func evalControllerUpdate(id: String, request: Requests.UpdateEvalDto, requestOptions: RequestOptions? = nil) async throws -> Eval {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/eval/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Eval.self
        )
    }

    public func evalControllerGetRun(id: String, requestOptions: RequestOptions? = nil) async throws -> EvalRun {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/run/\(id)",
            requestOptions: requestOptions,
            responseType: EvalRun.self
        )
    }

    public func evalControllerRemoveRun(id: String, requestOptions: RequestOptions? = nil) async throws -> EvalRun {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/eval/run/\(id)",
            requestOptions: requestOptions,
            responseType: EvalRun.self
        )
    }

    public func evalControllerGetRunsPaginated(id: String? = nil, page: Double? = nil, sortOrder: EvalControllerGetRunsPaginatedRequestSortOrder? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> EvalRunPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/run",
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
            responseType: EvalRunPaginatedResponse.self
        )
    }

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
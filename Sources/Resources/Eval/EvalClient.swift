import Foundation

public final class EvalClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func evalControllerGetPaginated(id: Nullable<String>? = nil, page: Nullable<Double>? = nil, sortOrder: Nullable<EvalControllerGetPaginatedRequestSortOrder>? = nil, limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> EvalPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval",
            queryParams: [
                "id": id?.wrappedValue.map { .string($0) }, 
                "page": page?.wrappedValue.map { .double($0) }, 
                "sortOrder": sortOrder?.wrappedValue.map { .string($0) }, 
                "limit": limit?.wrappedValue.map { .double($0) }, 
                "createdAtGt": createdAtGt?.wrappedValue.map { .date($0) }, 
                "createdAtLt": createdAtLt?.wrappedValue.map { .date($0) }, 
                "createdAtGe": createdAtGe?.wrappedValue.map { .date($0) }, 
                "createdAtLe": createdAtLe?.wrappedValue.map { .date($0) }, 
                "updatedAtGt": updatedAtGt?.wrappedValue.map { .date($0) }, 
                "updatedAtLt": updatedAtLt?.wrappedValue.map { .date($0) }, 
                "updatedAtGe": updatedAtGe?.wrappedValue.map { .date($0) }, 
                "updatedAtLe": updatedAtLe?.wrappedValue.map { .date($0) }
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

    public func evalControllerGetRunsPaginated(id: Nullable<String>? = nil, page: Nullable<Double>? = nil, sortOrder: Nullable<EvalControllerGetRunsPaginatedRequestSortOrder>? = nil, limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> EvalRunPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/eval/run",
            queryParams: [
                "id": id?.wrappedValue.map { .string($0) }, 
                "page": page?.wrappedValue.map { .double($0) }, 
                "sortOrder": sortOrder?.wrappedValue.map { .string($0) }, 
                "limit": limit?.wrappedValue.map { .double($0) }, 
                "createdAtGt": createdAtGt?.wrappedValue.map { .date($0) }, 
                "createdAtLt": createdAtLt?.wrappedValue.map { .date($0) }, 
                "createdAtGe": createdAtGe?.wrappedValue.map { .date($0) }, 
                "createdAtLe": createdAtLe?.wrappedValue.map { .date($0) }, 
                "updatedAtGt": updatedAtGt?.wrappedValue.map { .date($0) }, 
                "updatedAtLt": updatedAtLt?.wrappedValue.map { .date($0) }, 
                "updatedAtGe": updatedAtGe?.wrappedValue.map { .date($0) }, 
                "updatedAtLe": updatedAtLe?.wrappedValue.map { .date($0) }
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
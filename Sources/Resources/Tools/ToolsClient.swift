import Foundation

public final class ToolsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> [ToolsListResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/tool",
            queryParams: [
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
            responseType: [ToolsListResponseItem].self
        )
    }

    public func create(request: ToolsCreateRequest, requestOptions: RequestOptions? = nil) async throws -> ToolsCreateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/tool",
            body: request,
            requestOptions: requestOptions,
            responseType: ToolsCreateResponse.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> ToolsGetResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/tool/\(id)",
            requestOptions: requestOptions,
            responseType: ToolsGetResponse.self
        )
    }

    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> ToolsDeleteResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/tool/\(id)",
            requestOptions: requestOptions,
            responseType: ToolsDeleteResponse.self
        )
    }

    public func update(id: String, request: ToolsUpdateRequest, requestOptions: RequestOptions? = nil) async throws -> ToolsUpdateResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/tool/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: ToolsUpdateResponse.self
        )
    }
}
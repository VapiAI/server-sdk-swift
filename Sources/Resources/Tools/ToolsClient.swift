import Foundation

public final class ToolsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [ListToolsResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/tool",
            queryParams: [
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
            responseType: [ListToolsResponseItem].self
        )
    }

    public func create(request: CreateToolsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateToolsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/tool",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateToolsResponse.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> GetToolsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/tool/\(id)",
            requestOptions: requestOptions,
            responseType: GetToolsResponse.self
        )
    }

    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteToolsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/tool/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteToolsResponse.self
        )
    }

    public func update(id: String, request: UpdateToolsRequestBody, requestOptions: RequestOptions? = nil) async throws -> UpdateToolsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/tool/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateToolsResponse.self
        )
    }
}
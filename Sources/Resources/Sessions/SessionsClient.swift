import Foundation

public final class SessionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(name: Nullable<String>? = nil, assistantId: Nullable<String>? = nil, squadId: Nullable<String>? = nil, workflowId: Nullable<String>? = nil, page: Nullable<Double>? = nil, sortOrder: Nullable<SessionsListRequestSortOrder>? = nil, limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> SessionPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/session",
            queryParams: [
                "name": name?.wrappedValue.map { .string($0) }, 
                "assistantId": assistantId?.wrappedValue.map { .string($0) }, 
                "squadId": squadId?.wrappedValue.map { .string($0) }, 
                "workflowId": workflowId?.wrappedValue.map { .string($0) }, 
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
            responseType: SessionPaginatedResponse.self
        )
    }

    public func create(request: Requests.CreateSessionDto, requestOptions: RequestOptions? = nil) async throws -> Session {
        return try await httpClient.performRequest(
            method: .post,
            path: "/session",
            body: request,
            requestOptions: requestOptions,
            responseType: Session.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> Session {
        return try await httpClient.performRequest(
            method: .get,
            path: "/session/\(id)",
            requestOptions: requestOptions,
            responseType: Session.self
        )
    }

    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Session {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/session/\(id)",
            requestOptions: requestOptions,
            responseType: Session.self
        )
    }

    public func update(id: String, request: Requests.UpdateSessionDto, requestOptions: RequestOptions? = nil) async throws -> Session {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/session/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Session.self
        )
    }
}
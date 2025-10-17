import Foundation

public final class AssistantsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> [Assistant] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/assistant",
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
            responseType: [Assistant].self
        )
    }

    public func create(request: CreateAssistantDto, requestOptions: RequestOptions? = nil) async throws -> Assistant {
        return try await httpClient.performRequest(
            method: .post,
            path: "/assistant",
            body: request,
            requestOptions: requestOptions,
            responseType: Assistant.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> Assistant {
        return try await httpClient.performRequest(
            method: .get,
            path: "/assistant/\(id)",
            requestOptions: requestOptions,
            responseType: Assistant.self
        )
    }

    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Assistant {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/assistant/\(id)",
            requestOptions: requestOptions,
            responseType: Assistant.self
        )
    }

    public func update(id: String, request: Requests.UpdateAssistantDto, requestOptions: RequestOptions? = nil) async throws -> Assistant {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/assistant/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Assistant.self
        )
    }
}
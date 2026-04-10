import Foundation

public final class AssistantsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [Assistant] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/assistant",
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
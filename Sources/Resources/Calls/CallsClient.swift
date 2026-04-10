import Foundation

public final class CallsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(id: String? = nil, assistantId: String? = nil, phoneNumberId: String? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [Call] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call",
            queryParams: [
                "id": id.map { .string($0) }, 
                "assistantId": assistantId.map { .string($0) }, 
                "phoneNumberId": phoneNumberId.map { .string($0) }, 
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
            responseType: [Call].self
        )
    }

    public func create(request: Requests.CreateCallDto, requestOptions: RequestOptions? = nil) async throws -> CreateCallsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/call",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateCallsResponse.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> Call {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call/\(id)",
            requestOptions: requestOptions,
            responseType: Call.self
        )
    }

    public func delete(id: String, request: Requests.DeleteCallDto, requestOptions: RequestOptions? = nil) async throws -> Call {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/call/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Call.self
        )
    }

    public func update(id: String, request: Requests.UpdateCallDto, requestOptions: RequestOptions? = nil) async throws -> Call {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/call/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Call.self
        )
    }
}
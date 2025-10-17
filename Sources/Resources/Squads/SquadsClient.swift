import Foundation

public final class SquadsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> [Squad] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/squad",
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
            responseType: [Squad].self
        )
    }

    public func create(request: CreateSquadDto, requestOptions: RequestOptions? = nil) async throws -> Squad {
        return try await httpClient.performRequest(
            method: .post,
            path: "/squad",
            body: request,
            requestOptions: requestOptions,
            responseType: Squad.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> Squad {
        return try await httpClient.performRequest(
            method: .get,
            path: "/squad/\(id)",
            requestOptions: requestOptions,
            responseType: Squad.self
        )
    }

    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Squad {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/squad/\(id)",
            requestOptions: requestOptions,
            responseType: Squad.self
        )
    }

    public func update(id: String, request: Requests.UpdateSquadDto, requestOptions: RequestOptions? = nil) async throws -> Squad {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/squad/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Squad.self
        )
    }
}
import Foundation

public final class StructuredOutputsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func structuredOutputControllerFindAll(id: Nullable<String>? = nil, name: Nullable<String>? = nil, page: Nullable<Double>? = nil, sortOrder: Nullable<StructuredOutputControllerFindAllRequestSortOrder>? = nil, limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> StructuredOutputPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/structured-output",
            queryParams: [
                "id": id?.wrappedValue.map { .string($0) }, 
                "name": name?.wrappedValue.map { .string($0) }, 
                "page": page?.wrappedValue.map { .double($0) }, 
                "sortOrder": sortOrder?.wrappedValue.map { .string($0.rawValue) }, 
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
            responseType: StructuredOutputPaginatedResponse.self
        )
    }

    public func structuredOutputControllerCreate(request: Requests.CreateStructuredOutputDto, requestOptions: RequestOptions? = nil) async throws -> StructuredOutput {
        return try await httpClient.performRequest(
            method: .post,
            path: "/structured-output",
            body: request,
            requestOptions: requestOptions,
            responseType: StructuredOutput.self
        )
    }

    public func structuredOutputControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> StructuredOutput {
        return try await httpClient.performRequest(
            method: .get,
            path: "/structured-output/\(id)",
            requestOptions: requestOptions,
            responseType: StructuredOutput.self
        )
    }

    public func structuredOutputControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> StructuredOutput {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/structured-output/\(id)",
            requestOptions: requestOptions,
            responseType: StructuredOutput.self
        )
    }

    public func structuredOutputControllerUpdate(id: String, schemaOverride: String, request: Requests.UpdateStructuredOutputDto, requestOptions: RequestOptions? = nil) async throws -> StructuredOutput {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/structured-output/\(id)",
            queryParams: [
                "schemaOverride": .string(schemaOverride)
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: StructuredOutput.self
        )
    }
}
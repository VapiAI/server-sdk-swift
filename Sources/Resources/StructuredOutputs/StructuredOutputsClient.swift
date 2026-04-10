import Foundation

public final class StructuredOutputsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func structuredOutputControllerFindAll(id: String? = nil, name: String? = nil, page: Double? = nil, sortOrder: StructuredOutputControllerFindAllRequestSortOrder? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> StructuredOutputPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/structured-output",
            queryParams: [
                "id": id.map { .string($0) }, 
                "name": name.map { .string($0) }, 
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
            responseType: StructuredOutputPaginatedResponse.self
        )
    }

    public func structuredOutputControllerCreate(request: CreateStructuredOutputDto, requestOptions: RequestOptions? = nil) async throws -> StructuredOutput {
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

    public func structuredOutputControllerRun(request: Requests.StructuredOutputRunDto, requestOptions: RequestOptions? = nil) async throws -> StructuredOutput {
        return try await httpClient.performRequest(
            method: .post,
            path: "/structured-output/run",
            body: request,
            requestOptions: requestOptions,
            responseType: StructuredOutput.self
        )
    }
}
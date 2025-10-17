import Foundation

public final class ProviderResourcesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func providerResourceControllerGetProviderResourcesPaginated(provider: String, resourceName: String, id: Nullable<String>? = nil, resourceId: Nullable<String>? = nil, page: Nullable<Double>? = nil, sortOrder: Nullable<ProviderResourceControllerGetProviderResourcesPaginatedRequestSortOrder>? = nil, limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> ProviderResourcePaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/provider/\(provider)/\(resourceName)",
            queryParams: [
                "id": id?.wrappedValue.map { .string($0) }, 
                "resourceId": resourceId?.wrappedValue.map { .string($0) }, 
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
            responseType: ProviderResourcePaginatedResponse.self
        )
    }

    public func providerResourceControllerCreateProviderResource(provider: String, resourceName: String, requestOptions: RequestOptions? = nil) async throws -> ProviderResource {
        return try await httpClient.performRequest(
            method: .post,
            path: "/provider/\(provider)/\(resourceName)",
            requestOptions: requestOptions,
            responseType: ProviderResource.self
        )
    }

    public func providerResourceControllerGetProviderResource(provider: String, resourceName: String, id: String, requestOptions: RequestOptions? = nil) async throws -> ProviderResource {
        return try await httpClient.performRequest(
            method: .get,
            path: "/provider/\(provider)/\(resourceName)/\(id)",
            requestOptions: requestOptions,
            responseType: ProviderResource.self
        )
    }

    public func providerResourceControllerDeleteProviderResource(provider: String, resourceName: String, id: String, requestOptions: RequestOptions? = nil) async throws -> ProviderResource {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/provider/\(provider)/\(resourceName)/\(id)",
            requestOptions: requestOptions,
            responseType: ProviderResource.self
        )
    }

    public func providerResourceControllerUpdateProviderResource(provider: String, resourceName: String, id: String, requestOptions: RequestOptions? = nil) async throws -> ProviderResource {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/provider/\(provider)/\(resourceName)/\(id)",
            requestOptions: requestOptions,
            responseType: ProviderResource.self
        )
    }
}
import Foundation

public final class ProviderResourcesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func providerResourceControllerGetProviderResourcesPaginated(provider: String, resourceName: String, id: String? = nil, resourceId: String? = nil, page: Double? = nil, sortOrder: ProviderResourceControllerGetProviderResourcesPaginatedRequestSortOrder? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ProviderResourcePaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/provider/\(provider)/\(resourceName)",
            queryParams: [
                "id": id.map { .string($0) }, 
                "resourceId": resourceId.map { .string($0) }, 
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
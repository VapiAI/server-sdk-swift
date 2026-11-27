import Foundation

public final class ProviderResourcesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of provider resources for the authenticated organization. Filter pronunciation dictionaries by provider, resource ID, or creation and update timestamps.
    ///
    /// - Parameter provider: The provider (e.g., 11labs)
    /// - Parameter resourceName: The resource name (e.g., pronunciation-dictionary)
    /// - Parameter id: Filters provider resources by their resource ID.
    /// - Parameter resourceId: Filters provider resources by their provider-specific resource ID.
    /// - Parameter page: This is the page number to return. Defaults to 1.
    /// - Parameter sortOrder: This is the sort order for pagination. Defaults to 'DESC'.
    /// - Parameter sortBy: This is the column to sort by. Defaults to 'createdAt'.
    /// - Parameter limit: This is the maximum number of items to return. Defaults to 100.
    /// - Parameter createdAtGt: This will return items where the createdAt is greater than the specified value.
    /// - Parameter createdAtLt: This will return items where the createdAt is less than the specified value.
    /// - Parameter createdAtGe: This will return items where the createdAt is greater than or equal to the specified value.
    /// - Parameter createdAtLe: This will return items where the createdAt is less than or equal to the specified value.
    /// - Parameter updatedAtGt: This will return items where the updatedAt is greater than the specified value.
    /// - Parameter updatedAtLt: This will return items where the updatedAt is less than the specified value.
    /// - Parameter updatedAtGe: This will return items where the updatedAt is greater than or equal to the specified value.
    /// - Parameter updatedAtLe: This will return items where the updatedAt is less than or equal to the specified value.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func providerResourceControllerGetProviderResourcesPaginated(provider: String, resourceName: String, id: String? = nil, resourceId: String? = nil, page: Double? = nil, sortOrder: ProviderResourceControllerGetProviderResourcesPaginatedRequestSortOrder? = nil, sortBy: ProviderResourceControllerGetProviderResourcesPaginatedRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ProviderResourcePaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/provider/\(provider)/\(resourceName)",
            queryParams: [
                "id": id.map { .string($0) }, 
                "resourceId": resourceId.map { .string($0) }, 
                "page": page.map { .double($0) }, 
                "sortOrder": sortOrder.map { .string($0.rawValue) }, 
                "sortBy": sortBy.map { .string($0.rawValue) }, 
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

    /// Creates a pronunciation-dictionary resource for a supported provider, currently Cartesia or ElevenLabs.
    ///
    /// - Parameter provider: The provider (e.g., 11labs)
    /// - Parameter resourceName: The resource name (e.g., pronunciation-dictionary)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func providerResourceControllerCreateProviderResource(provider: String, resourceName: String, requestOptions: RequestOptions? = nil) async throws -> ProviderResource {
        return try await httpClient.performRequest(
            method: .post,
            path: "/provider/\(provider)/\(resourceName)",
            requestOptions: requestOptions,
            responseType: ProviderResource.self
        )
    }

    /// Returns the provider resource identified by its Vapi resource ID.
    ///
    /// - Parameter provider: The provider (e.g., 11labs)
    /// - Parameter resourceName: The resource name (e.g., pronunciation-dictionary)
    /// - Parameter id: The unique identifier of the provider resource.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func providerResourceControllerGetProviderResource(provider: String, resourceName: String, id: String, requestOptions: RequestOptions? = nil) async throws -> ProviderResource {
        return try await httpClient.performRequest(
            method: .get,
            path: "/provider/\(provider)/\(resourceName)/\(id)",
            requestOptions: requestOptions,
            responseType: ProviderResource.self
        )
    }

    /// Deletes the provider resource identified by its Vapi resource ID.
    ///
    /// - Parameter provider: The provider (e.g., 11labs)
    /// - Parameter resourceName: The resource name (e.g., pronunciation-dictionary)
    /// - Parameter id: The unique identifier of the provider resource.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func providerResourceControllerDeleteProviderResource(provider: String, resourceName: String, id: String, requestOptions: RequestOptions? = nil) async throws -> ProviderResource {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/provider/\(provider)/\(resourceName)/\(id)",
            requestOptions: requestOptions,
            responseType: ProviderResource.self
        )
    }

    /// Updates the provider resource identified by its Vapi resource ID.
    ///
    /// - Parameter provider: The provider (e.g., 11labs)
    /// - Parameter resourceName: The resource name (e.g., pronunciation-dictionary)
    /// - Parameter id: The unique identifier of the provider resource.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func providerResourceControllerUpdateProviderResource(provider: String, resourceName: String, id: String, requestOptions: RequestOptions? = nil) async throws -> ProviderResource {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/provider/\(provider)/\(resourceName)/\(id)",
            requestOptions: requestOptions,
            responseType: ProviderResource.self
        )
    }
}
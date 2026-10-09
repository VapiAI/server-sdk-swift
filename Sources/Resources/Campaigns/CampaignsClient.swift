import Foundation

public final class CampaignsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns outbound calling campaigns for the authenticated organization. Filter results by campaign ID, status, or creation and update timestamps.
    ///
    /// - Parameter id: Filters campaigns by ID.
    /// - Parameter status: Filters campaigns by status.
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
    public func campaignControllerFindAll(id: String? = nil, status: CampaignControllerFindAllRequestStatus? = nil, page: Double? = nil, sortOrder: CampaignControllerFindAllRequestSortOrder? = nil, sortBy: CampaignControllerFindAllRequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> CampaignPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/campaign",
            queryParams: [
                "id": id.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
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
            responseType: CampaignPaginatedResponse.self
        )
    }

    /// Creates an outbound calling campaign that calls a set of customers.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func campaignControllerCreate(request: CreateCampaignDto, requestOptions: RequestOptions? = nil) async throws -> Campaign {
        return try await httpClient.performRequest(
            method: .post,
            path: "/campaign",
            body: request,
            requestOptions: requestOptions,
            responseType: Campaign.self
        )
    }

    public func campaignControllerFindAllV2(id: String? = nil, status: CampaignControllerFindAllV2RequestStatus? = nil, includeCounters: Bool? = nil, page: Double? = nil, sortOrder: CampaignControllerFindAllV2RequestSortOrder? = nil, sortBy: CampaignControllerFindAllV2RequestSortBy? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> CampaignSummaryPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2/campaign",
            queryParams: [
                "id": id.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "includeCounters": includeCounters.map { .bool($0) }, 
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
            responseType: CampaignSummaryPaginatedResponse.self
        )
    }

    public func campaignControllerCreateV2(request: CreateCampaignDto, requestOptions: RequestOptions? = nil) async throws -> Campaign {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v2/campaign",
            body: request,
            requestOptions: requestOptions,
            responseType: Campaign.self
        )
    }

    public func campaignControllerFindOneV2(id: String, includeCounters: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> CampaignSummary {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2/campaign/\(id)",
            queryParams: [
                "includeCounters": includeCounters.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: CampaignSummary.self
        )
    }

    public func campaignControllerRemoveV2(id: String, requestOptions: RequestOptions? = nil) async throws -> Campaign {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v2/campaign/\(id)",
            requestOptions: requestOptions,
            responseType: Campaign.self
        )
    }

    public func campaignControllerUpdateV2(id: String, request: UpdateCampaignDto, requestOptions: RequestOptions? = nil) async throws -> Campaign {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/v2/campaign/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Campaign.self
        )
    }

    /// Returns the outbound calling campaign identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the campaign.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func campaignControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> Campaign {
        return try await httpClient.performRequest(
            method: .get,
            path: "/campaign/\(id)",
            requestOptions: requestOptions,
            responseType: Campaign.self
        )
    }

    /// Deletes the outbound calling campaign identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the campaign.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func campaignControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> Campaign {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/campaign/\(id)",
            requestOptions: requestOptions,
            responseType: Campaign.self
        )
    }

    /// Updates the outbound calling campaign identified by its ID. Campaigns can be ended by updating their status to `ended`.
    ///
    /// - Parameter id: The unique identifier of the campaign.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func campaignControllerUpdate(id: String, request: UpdateCampaignDto, requestOptions: RequestOptions? = nil) async throws -> Campaign {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/campaign/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Campaign.self
        )
    }

    public func campaignControllerGetCampaignV2Contacts(id: String, status: CampaignControllerGetCampaignV2ContactsRequestStatusItem? = nil, limit: Double? = nil, sortBy: CampaignControllerGetCampaignV2ContactsRequestSortBy? = nil, page: Double? = nil, requestOptions: RequestOptions? = nil) async throws -> CampaignContactPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2/campaign/\(id)/contacts",
            queryParams: [
                "status": status.map { .string($0.rawValue) }, 
                "limit": limit.map { .double($0) }, 
                "sortBy": sortBy.map { .string($0.rawValue) }, 
                "page": page.map { .double($0) }
            ],
            requestOptions: requestOptions,
            responseType: CampaignContactPaginatedResponse.self
        )
    }
}
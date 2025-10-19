import Foundation

public final class CampaignsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func campaignControllerFindAll(id: Nullable<String>? = nil, status: Nullable<CampaignControllerFindAllRequestStatus>? = nil, page: Nullable<Double>? = nil, sortOrder: Nullable<CampaignControllerFindAllRequestSortOrder>? = nil, limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> CampaignPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/campaign",
            queryParams: [
                "id": id?.wrappedValue.map { .string($0) }, 
                "status": status?.wrappedValue.map { .string($0.rawValue) }, 
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
            responseType: CampaignPaginatedResponse.self
        )
    }

    public func campaignControllerCreate(request: Requests.CreateCampaignDto, requestOptions: RequestOptions? = nil) async throws -> Campaign {
        return try await httpClient.performRequest(
            method: .post,
            path: "/campaign",
            body: request,
            requestOptions: requestOptions,
            responseType: Campaign.self
        )
    }

    public func campaignControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> Campaign {
        return try await httpClient.performRequest(
            method: .get,
            path: "/campaign/\(id)",
            requestOptions: requestOptions,
            responseType: Campaign.self
        )
    }

    public func campaignControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> Campaign {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/campaign/\(id)",
            requestOptions: requestOptions,
            responseType: Campaign.self
        )
    }

    public func campaignControllerUpdate(id: String, request: Requests.UpdateCampaignDto, requestOptions: RequestOptions? = nil) async throws -> Campaign {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/campaign/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Campaign.self
        )
    }
}
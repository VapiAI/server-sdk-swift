import Foundation

public final class CampaignsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func campaignControllerFindAll(id: String? = nil, status: CampaignControllerFindAllRequestStatus? = nil, page: Double? = nil, sortOrder: CampaignControllerFindAllRequestSortOrder? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> CampaignPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/campaign",
            queryParams: [
                "id": id.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
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
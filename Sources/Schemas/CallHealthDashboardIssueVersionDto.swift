import Foundation

public struct CallHealthDashboardIssueVersionDto: Codable, Hashable, Sendable {
    /// The version the calls ran on; null groups the calls that ran on no version.
    public let assistantVersionId: Nullable<String>
    /// The version's label, such as v3; absent for calls on no version or whose label was unavailable at registration.
    public let assistantVersion: String?
    /// Distinct visible calls on this version matching the issue in the window.
    public let affectedCallCount: Int
    /// Accepted current-goal outcomes on this version for the issue's assistant in the window.
    public let analyzedCallCount: Int
    /// affectedCallCount / analyzedCallCount; omitted for a zero denominator.
    public let affectedCallRate: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantVersionId: Nullable<String>,
        assistantVersion: String? = nil,
        affectedCallCount: Int,
        analyzedCallCount: Int,
        affectedCallRate: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantVersionId = assistantVersionId
        self.assistantVersion = assistantVersion
        self.affectedCallCount = affectedCallCount
        self.analyzedCallCount = analyzedCallCount
        self.affectedCallRate = affectedCallRate
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantVersionId = try container.decode(Nullable<String>.self, forKey: .assistantVersionId)
        self.assistantVersion = try container.decodeIfPresent(String.self, forKey: .assistantVersion)
        self.affectedCallCount = try container.decode(Int.self, forKey: .affectedCallCount)
        self.analyzedCallCount = try container.decode(Int.self, forKey: .analyzedCallCount)
        self.affectedCallRate = try container.decodeIfPresent(Double.self, forKey: .affectedCallRate)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.assistantVersionId, forKey: .assistantVersionId)
        try container.encodeIfPresent(self.assistantVersion, forKey: .assistantVersion)
        try container.encode(self.affectedCallCount, forKey: .affectedCallCount)
        try container.encode(self.analyzedCallCount, forKey: .analyzedCallCount)
        try container.encodeIfPresent(self.affectedCallRate, forKey: .affectedCallRate)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantVersionId
        case assistantVersion
        case affectedCallCount
        case analyzedCallCount
        case affectedCallRate
    }
}
import Foundation

/// This is the S3 Region. It should look like us-east-1
/// It should be one of the supabase regions defined in the SUPABASE_REGION enum
/// Check https://supabase.com/docs/guides/platform/regions for up to date regions
public enum SupabaseBucketPlanRegion: String, Codable, Hashable, CaseIterable, Sendable {
    case usWest1 = "us-west-1"
    case usEast1 = "us-east-1"
    case usEast2 = "us-east-2"
    case caCentral1 = "ca-central-1"
    case euWest1 = "eu-west-1"
    case euWest2 = "eu-west-2"
    case euWest3 = "eu-west-3"
    case euCentral1 = "eu-central-1"
    case euCentral2 = "eu-central-2"
    case euNorth1 = "eu-north-1"
    case apSouth1 = "ap-south-1"
    case apSoutheast1 = "ap-southeast-1"
    case apNortheast1 = "ap-northeast-1"
    case apNortheast2 = "ap-northeast-2"
    case apSoutheast2 = "ap-southeast-2"
    case saEast1 = "sa-east-1"
}
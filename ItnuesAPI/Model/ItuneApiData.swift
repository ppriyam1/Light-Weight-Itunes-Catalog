
import Foundation

// MARK: - ItuneAPIData
struct ItuneAPIData: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let wrapperType: WrapperType
    let kind: Kind
    let artistID, collectionID: Int?
    let trackID: Int
    let artistName: String
    let collectionName: String?
    let trackName: String
    let collectionCensoredName: String?
    let trackCensoredName: String
    let artistViewURL, collectionViewURL: String?
    let trackViewURL: String
    let previewURL: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice: Double
    let collectionHDPrice, trackHDPrice: Double?
    let releaseDate: String
    let collectionExplicitness, trackExplicitness: Explicitness
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int
    let country: Country
    let currency: Currency
    let primaryGenreName: String
    let contentAdvisoryRating: String?
    let shortDescription, longDescription: String?
    let trackRentalPrice, trackHDRentalPrice: Double?
    let collectionArtistName: String?
    let isStreamable: Bool?
    let collectionArtistID: Int?
    let collectionArtistViewURL: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, trackRentalPrice
        case trackHDRentalPrice = "trackHdRentalPrice"
        case collectionArtistName, isStreamable
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
    }
}

enum Explicitness: String, Codable {
    case explicit = "explicit"
    case notExplicit = "notExplicit"
}

enum ContentAdvisoryRating: String, Codable {
    case explicit = "Explicit"
    case g = "G"
    case tvG = "TV-G"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
    case musicVideo = "music-video"
    case song = "song"
    case tvEpisode = "tv-episode"
}

enum PrimaryGenreName: String, Codable {
    case comedy = "Comedy"
    case hipHopRap = "Hip-Hop/Rap"
    case kidsFamily = "Kids & Family"
    case musicals = "Musicals"
    case pop = "Pop"
    case soundtrack = "Soundtrack"
}

enum WrapperType: String, Codable {
    case track = "track"
}

import Foundation

// MARK: - TransactionDTO
public final class TransactionDTO: Codable, Hashable {
    public var id: UUID
    public var accountId: String
    public var accountOwner: String?
    public var amount: Double
    public var isoCurrencyCode: String?
    public var unofficialCurrencyCode: String?
    public var checkNumber: String?
    public var date: Date
    public var location: LocationDTO
    public var name: String
    public var merchantName: String?
    public var merchantEntityId: String?
    public var originalDescription: String?
    public var paymentMeta: [PaymentMetaDTO]
    public var pending: Bool
    public var pendingTransactionId: String?
    public var transactionId: String
    public var transactionType: String
    public var logoUrl: String?
    public var website: String?
    public var authorizedDate: Date?
    public var authorizedDatetime: Date?
    public var datetime: Date?
    public var paymentChannel: String
    public var personalFinanceCategory: PersonalFinanceCategoryDTO?
    public var personalFinanceCategoryIconUrl: String
    public var transactionCode: String?
    // Optional fields to support manually entered transactions
    public var manuallyEntered: Bool?
    public var userEnteredAt: Date?
    public var userNotes: String?
    public var userCategoryOverride: String?
    public var userAmendedAmount: Double?
    /// Weak reference to the parent account (not encoded to avoid cycles)
    public weak var account: AccountDTO?

    public init(
        id: UUID = UUID(),
        accountId: String,
        accountOwner: String? = nil,
        amount: Double,
        isoCurrencyCode: String? = nil,
        unofficialCurrencyCode: String? = nil,
        checkNumber: String? = nil,
        date: Date,
        location: LocationDTO,
        name: String,
        merchantName: String? = nil,
        merchantEntityId: String? = nil,
        originalDescription: String? = nil,
        paymentMeta: [PaymentMetaDTO],
        pending: Bool,
        pendingTransactionId: String? = nil,
        transactionId: String,
        transactionType: String,
        logoUrl: String? = nil,
        website: String? = nil,
        authorizedDate: Date? = nil,
        authorizedDatetime: Date? = nil,
        datetime: Date? = nil,
        paymentChannel: String,
        personalFinanceCategory: PersonalFinanceCategoryDTO? = nil,
        personalFinanceCategoryIconUrl: String,
        transactionCode: String? = nil,
        manuallyEntered: Bool? = nil,
        userEnteredAt: Date? = nil,
        userNotes: String? = nil,
        userCategoryOverride: String? = nil,
        userAmendedAmount: Double? = nil,
        account: AccountDTO? = nil
    ) {
        self.id = id
        self.accountId = accountId
        self.accountOwner = accountOwner
        self.amount = amount
        self.isoCurrencyCode = isoCurrencyCode
        self.unofficialCurrencyCode = unofficialCurrencyCode
        self.checkNumber = checkNumber
        self.date = date
        self.location = location
        self.name = name
        self.merchantName = merchantName
        self.merchantEntityId = merchantEntityId
        self.originalDescription = originalDescription
        self.paymentMeta = paymentMeta
        self.pending = pending
        self.pendingTransactionId = pendingTransactionId
        self.transactionId = transactionId
        self.transactionType = transactionType
        self.logoUrl = logoUrl
        self.website = website
        self.authorizedDate = authorizedDate
        self.authorizedDatetime = authorizedDatetime
        self.datetime = datetime
        self.paymentChannel = paymentChannel
        self.personalFinanceCategory = personalFinanceCategory
        self.personalFinanceCategoryIconUrl = personalFinanceCategoryIconUrl
        self.transactionCode = transactionCode
        self.manuallyEntered = manuallyEntered
        self.userEnteredAt = userEnteredAt
        self.userNotes = userNotes
        self.userCategoryOverride = userCategoryOverride
        self.userAmendedAmount = userAmendedAmount
        self.account = account
    }

    private enum CodingKeys: String, CodingKey {
        case id, accountId, accountOwner, amount, isoCurrencyCode, unofficialCurrencyCode, checkNumber, date, location, name, merchantName, merchantEntityId, originalDescription, paymentMeta, pending, pendingTransactionId, transactionId, transactionType, logoUrl, website, authorizedDate, authorizedDatetime, datetime, paymentChannel, personalFinanceCategory, personalFinanceCategoryIconUrl, transactionCode, manuallyEntered, userEnteredAt, userNotes, userCategoryOverride, userAmendedAmount
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(accountId, forKey: .accountId)
        try container.encodeIfPresent(accountOwner, forKey: .accountOwner)
        try container.encode(amount, forKey: .amount)
        try container.encodeIfPresent(isoCurrencyCode, forKey: .isoCurrencyCode)
        try container.encodeIfPresent(unofficialCurrencyCode, forKey: .unofficialCurrencyCode)
        try container.encodeIfPresent(checkNumber, forKey: .checkNumber)
        try container.encode(date, forKey: .date)
        try container.encode(location, forKey: .location)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(merchantName, forKey: .merchantName)
        try container.encodeIfPresent(merchantEntityId, forKey: .merchantEntityId)
        try container.encodeIfPresent(originalDescription, forKey: .originalDescription)
        try container.encode(paymentMeta, forKey: .paymentMeta)
        try container.encode(pending, forKey: .pending)
        try container.encodeIfPresent(pendingTransactionId, forKey: .pendingTransactionId)
        try container.encode(transactionId, forKey: .transactionId)
        try container.encode(transactionType, forKey: .transactionType)
        try container.encodeIfPresent(logoUrl, forKey: .logoUrl)
        try container.encodeIfPresent(website, forKey: .website)
        try container.encodeIfPresent(authorizedDate, forKey: .authorizedDate)
        try container.encodeIfPresent(authorizedDatetime, forKey: .authorizedDatetime)
        try container.encodeIfPresent(datetime, forKey: .datetime)
        try container.encode(paymentChannel, forKey: .paymentChannel)
        try container.encodeIfPresent(personalFinanceCategory, forKey: .personalFinanceCategory)
        try container.encode(personalFinanceCategoryIconUrl, forKey: .personalFinanceCategoryIconUrl)
        try container.encodeIfPresent(transactionCode, forKey: .transactionCode)
        try container.encodeIfPresent(manuallyEntered, forKey: .manuallyEntered)
        try container.encodeIfPresent(userEnteredAt, forKey: .userEnteredAt)
        try container.encodeIfPresent(userNotes, forKey: .userNotes)
        try container.encodeIfPresent(userCategoryOverride, forKey: .userCategoryOverride)
        try container.encodeIfPresent(userAmendedAmount, forKey: .userAmendedAmount)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.accountOwner = try container.decodeIfPresent(String.self, forKey: .accountOwner)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.isoCurrencyCode = try container.decodeIfPresent(String.self, forKey: .isoCurrencyCode)
        self.unofficialCurrencyCode = try container.decodeIfPresent(String.self, forKey: .unofficialCurrencyCode)
        self.checkNumber = try container.decodeIfPresent(String.self, forKey: .checkNumber)
        self.date = try container.decode(Date.self, forKey: .date)
        self.location = try container.decode(LocationDTO.self, forKey: .location)
        self.name = try container.decode(String.self, forKey: .name)
        self.merchantName = try container.decodeIfPresent(String.self, forKey: .merchantName)
        self.merchantEntityId = try container.decodeIfPresent(String.self, forKey: .merchantEntityId)
        self.originalDescription = try container.decodeIfPresent(String.self, forKey: .originalDescription)
        self.paymentMeta = try container.decode([PaymentMetaDTO].self, forKey: .paymentMeta)
        self.pending = try container.decode(Bool.self, forKey: .pending)
        self.pendingTransactionId = try container.decodeIfPresent(String.self, forKey: .pendingTransactionId)
        self.transactionId = try container.decode(String.self, forKey: .transactionId)
        self.transactionType = try container.decode(String.self, forKey: .transactionType)
        self.logoUrl = try container.decodeIfPresent(String.self, forKey: .logoUrl)
        self.website = try container.decodeIfPresent(String.self, forKey: .website)
        self.authorizedDate = try container.decodeIfPresent(Date.self, forKey: .authorizedDate)
        self.authorizedDatetime = try container.decodeIfPresent(Date.self, forKey: .authorizedDatetime)
        self.datetime = try container.decodeIfPresent(Date.self, forKey: .datetime)
        self.paymentChannel = try container.decode(String.self, forKey: .paymentChannel)
        self.personalFinanceCategory = try container.decodeIfPresent(PersonalFinanceCategoryDTO.self, forKey: .personalFinanceCategory)
        self.personalFinanceCategoryIconUrl = try container.decode(String.self, forKey: .personalFinanceCategoryIconUrl)
        self.transactionCode = try container.decodeIfPresent(String.self, forKey: .transactionCode)
        self.manuallyEntered = try container.decodeIfPresent(Bool.self, forKey: .manuallyEntered)
        self.userEnteredAt = try container.decodeIfPresent(Date.self, forKey: .userEnteredAt)
        self.userNotes = try container.decodeIfPresent(String.self, forKey: .userNotes)
        self.userCategoryOverride = try container.decodeIfPresent(String.self, forKey: .userCategoryOverride)
        self.userAmendedAmount = try container.decodeIfPresent(Double.self, forKey: .userAmendedAmount)
        self.account = nil // parent linkage to be set externally after decoding
    }

    public static func == (lhs: TransactionDTO, rhs: TransactionDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - PersonalFinanceCategoryDTO
public final class PersonalFinanceCategoryDTO: Codable, Hashable {
    public var id: UUID
    public var primary: String
    public var detailed: String
    public var confidenceLevel: String?

    public init(
        id: UUID = UUID(),
        primary: String,
        detailed: String,
        confidenceLevel: String? = nil
    ) {
        self.id = id
        self.primary = primary
        self.detailed = detailed
        self.confidenceLevel = confidenceLevel
    }

    private enum CodingKeys: String, CodingKey { case id, primary, detailed, confidenceLevel }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encode(primary, forKey: .primary); try c.encode(detailed, forKey: .detailed); try c.encodeIfPresent(confidenceLevel, forKey: .confidenceLevel) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.primary = try c.decode(String.self, forKey: .primary); self.detailed = try c.decode(String.self, forKey: .detailed); self.confidenceLevel = try c.decodeIfPresent(String.self, forKey: .confidenceLevel) }
    public static func == (lhs: PersonalFinanceCategoryDTO, rhs: PersonalFinanceCategoryDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - CounterpartiesDTO
public final class CounterpartiesDTO: Codable, Hashable {
    public var id: UUID
    public var name: String
    public var entityId: String?
    public var type: String
    public var webbsite: String?
    public var logoUrl: String?
    public var confidenceLevel: String?
    public var website: String?

    public init(
        id: UUID = UUID(),
        name: String,
        entityId: String? = nil,
        type: String,
        webbsite: String? = nil,
        logoUrl: String? = nil,
        confidenceLevel: String? = nil,
        website: String? = nil
    ) {
        self.id = id
        self.name = name
        self.entityId = entityId
        self.type = type
        self.webbsite = webbsite
        self.logoUrl = logoUrl
        self.confidenceLevel = confidenceLevel
        self.website = website
    }

    private enum CodingKeys: String, CodingKey { case id, name, entityId, type, webbsite, logoUrl, confidenceLevel, website }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encode(name, forKey: .name); try c.encodeIfPresent(entityId, forKey: .entityId); try c.encode(type, forKey: .type); try c.encodeIfPresent(webbsite, forKey: .webbsite); try c.encodeIfPresent(logoUrl, forKey: .logoUrl); try c.encodeIfPresent(confidenceLevel, forKey: .confidenceLevel); try c.encodeIfPresent(website, forKey: .website) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.name = try c.decode(String.self, forKey: .name); self.entityId = try c.decodeIfPresent(String.self, forKey: .entityId); self.type = try c.decode(String.self, forKey: .type); self.webbsite = try c.decodeIfPresent(String.self, forKey: .webbsite); self.logoUrl = try c.decodeIfPresent(String.self, forKey: .logoUrl); self.confidenceLevel = try c.decodeIfPresent(String.self, forKey: .confidenceLevel); self.website = try c.decodeIfPresent(String.self, forKey: .website) }
    public static func == (lhs: CounterpartiesDTO, rhs: CounterpartiesDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - AccountNumbersDTO
public final class AccountNumbersDTO: Codable, Hashable {
    public var id: UUID
    public var bacs: BacsDTO?
    public var routing: String?
    public var international: InternationalDTO?
    public var merchantEntityId: String?

    public init(id: UUID = UUID(), bacs: BacsDTO? = nil, routing: String? = nil, international: InternationalDTO? = nil, merchantEntityId: String? = nil) {
        self.id = id
        self.bacs = bacs
        self.routing = routing
        self.international = international
        self.merchantEntityId = merchantEntityId
    }

    private enum CodingKeys: String, CodingKey { case id, bacs, routing, international, merchantEntityId }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encodeIfPresent(bacs, forKey: .bacs); try c.encodeIfPresent(routing, forKey: .routing); try c.encodeIfPresent(international, forKey: .international); try c.encodeIfPresent(merchantEntityId, forKey: .merchantEntityId) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.bacs = try c.decodeIfPresent(BacsDTO.self, forKey: .bacs); self.routing = try c.decodeIfPresent(String.self, forKey: .routing); self.international = try c.decodeIfPresent(InternationalDTO.self, forKey: .international); self.merchantEntityId = try c.decodeIfPresent(String.self, forKey: .merchantEntityId) }
    public static func == (lhs: AccountNumbersDTO, rhs: AccountNumbersDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - InternationalDTO
public final class InternationalDTO: Codable, Hashable {
    public var id: UUID
    public var iban: String?
    public var bic: String?

    public init(id: UUID = UUID(), iban: String? = nil, bic: String? = nil) {
        self.id = id
        self.iban = iban
        self.bic = bic
    }

    private enum CodingKeys: String, CodingKey { case id, iban, bic }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encodeIfPresent(iban, forKey: .iban); try c.encodeIfPresent(bic, forKey: .bic) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.iban = try c.decodeIfPresent(String.self, forKey: .iban); self.bic = try c.decodeIfPresent(String.self, forKey: .bic) }
    public static func == (lhs: InternationalDTO, rhs: InternationalDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - BacsDTO
public final class BacsDTO: Codable, Hashable {
    public var id: UUID
    public var account: String?
    public var sortCode: String?

    public init(id: UUID = UUID(), account: String? = nil, sortCode: String? = nil) {
        self.id = id
        self.account = account
        self.sortCode = sortCode
    }

    private enum CodingKeys: String, CodingKey { case id, account, sortCode }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encodeIfPresent(account, forKey: .account); try c.encodeIfPresent(sortCode, forKey: .sortCode) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.account = try c.decodeIfPresent(String.self, forKey: .account); self.sortCode = try c.decodeIfPresent(String.self, forKey: .sortCode) }
    public static func == (lhs: BacsDTO, rhs: BacsDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - PaymentMetaDTO
public final class PaymentMetaDTO: Codable, Hashable {
    public var id: UUID
    public var referenceNumber: String?
    public var ppdId: String?
    public var payee: String?
    public var byOrderOf: String?
    public var payer: String?
    public var paymentMethod: String?
    public var paymentProcessor: String?
    public var reason: String?

    public init(
        id: UUID = UUID(),
        referenceNumber: String? = nil,
        ppdId: String? = nil,
        payee: String? = nil,
        byOrderOf: String? = nil,
        payer: String? = nil,
        paymentMethod: String? = nil,
        paymentProcessor: String? = nil,
        reason: String? = nil
    ) {
        self.id = id
        self.referenceNumber = referenceNumber
        self.ppdId = ppdId
        self.payee = payee
        self.byOrderOf = byOrderOf
        self.payer = payer
        self.paymentMethod = paymentMethod
        self.paymentProcessor = paymentProcessor
        self.reason = reason
    }

    private enum CodingKeys: String, CodingKey { case id, referenceNumber, ppdId, payee, byOrderOf, payer, paymentMethod, paymentProcessor, reason }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encodeIfPresent(referenceNumber, forKey: .referenceNumber); try c.encodeIfPresent(ppdId, forKey: .ppdId); try c.encodeIfPresent(payee, forKey: .payee); try c.encodeIfPresent(byOrderOf, forKey: .byOrderOf); try c.encodeIfPresent(payer, forKey: .payer); try c.encodeIfPresent(paymentMethod, forKey: .paymentMethod); try c.encodeIfPresent(paymentProcessor, forKey: .paymentProcessor); try c.encodeIfPresent(reason, forKey: .reason) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.referenceNumber = try c.decodeIfPresent(String.self, forKey: .referenceNumber); self.ppdId = try c.decodeIfPresent(String.self, forKey: .ppdId); self.payee = try c.decodeIfPresent(String.self, forKey: .payee); self.byOrderOf = try c.decodeIfPresent(String.self, forKey: .byOrderOf); self.payer = try c.decodeIfPresent(String.self, forKey: .payer); self.paymentMethod = try c.decodeIfPresent(String.self, forKey: .paymentMethod); self.paymentProcessor = try c.decodeIfPresent(String.self, forKey: .paymentProcessor); self.reason = try c.decodeIfPresent(String.self, forKey: .reason) }
    public static func == (lhs: PaymentMetaDTO, rhs: PaymentMetaDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - LocationDTO
public final class LocationDTO: Codable, Hashable {
    public var id: UUID
    public var address: String?
    public var city: String?
    public var region: String?
    public var postalCode: String?
    public var country: String?
    public var lat: Double?
    public var lon: Double?
    public var storeNumber: String?

    public init(
        id: UUID = UUID(),
        address: String? = nil,
        city: String? = nil,
        region: String? = nil,
        postalCode: String? = nil,
        country: String? = nil,
        lat: Double? = nil,
        lon: Double? = nil,
        storeNumber: String? = nil
    ) {
        self.id = id
        self.address = address
        self.city = city
        self.region = region
        self.postalCode = postalCode
        self.country = country
        self.lat = lat
        self.lon = lon
        self.storeNumber = storeNumber
    }

    private enum CodingKeys: String, CodingKey { case id, address, city, region, postalCode, country, lat, lon, storeNumber }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encodeIfPresent(address, forKey: .address); try c.encodeIfPresent(city, forKey: .city); try c.encodeIfPresent(region, forKey: .region); try c.encodeIfPresent(postalCode, forKey: .postalCode); try c.encodeIfPresent(country, forKey: .country); try c.encodeIfPresent(lat, forKey: .lat); try c.encodeIfPresent(lon, forKey: .lon); try c.encodeIfPresent(storeNumber, forKey: .storeNumber) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.address = try c.decodeIfPresent(String.self, forKey: .address); self.city = try c.decodeIfPresent(String.self, forKey: .city); self.region = try c.decodeIfPresent(String.self, forKey: .region); self.postalCode = try c.decodeIfPresent(String.self, forKey: .postalCode); self.country = try c.decodeIfPresent(String.self, forKey: .country); self.lat = try c.decodeIfPresent(Double.self, forKey: .lat); self.lon = try c.decodeIfPresent(Double.self, forKey: .lon); self.storeNumber = try c.decodeIfPresent(String.self, forKey: .storeNumber) }
    public static func == (lhs: LocationDTO, rhs: LocationDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - AccountDTO
public final class AccountDTO: Codable, Hashable {
    public var id: UUID
    public var accountId: String
    public var balances: AccountBalancesDTO
    public var mask: String?
    public var name: String
    public var officialName: String?
    public var type: String
    public var subtype: String?
    public var verificationStatus: String
    public var verificationName: String
    public var verificationInsights: VerificationInsightsDTO
    public var item: ItemDTO
    public var manualAccount: Bool
    public var reconciledBalance: Double?
    public var lastUpdated: Date?
    // Optional fields to support manually entered accounts
    public var userEnteredAt: Date?
    public var userNotes: String?
    public var userProvidedBalance: Double?
    public var userTags: [String]?
    /// Child transactions belonging to this account
    public var transactions: [TransactionDTO]

    public init(
        id: UUID = UUID(),
        accountId: String,
        balances: AccountBalancesDTO,
        mask: String? = nil,
        name: String,
        officialName: String? = nil,
        type: String,
        subtype: String? = nil,
        verificationStatus: String,
        verificationName: String,
        verificationInsights: VerificationInsightsDTO,
        item: ItemDTO,
        manualAccount: Bool,
        reconciledBalance: Double? = nil,
        lastUpdated: Date? = nil,
        transactions: [TransactionDTO] = []
    ) {
        self.id = id
        self.accountId = accountId
        self.balances = balances
        self.mask = mask
        self.name = name
        self.officialName = officialName
        self.type = type
        self.subtype = subtype
        self.verificationStatus = verificationStatus
        self.verificationName = verificationName
        self.verificationInsights = verificationInsights
        self.item = item
        self.manualAccount = manualAccount
        self.reconciledBalance = reconciledBalance
        self.lastUpdated = lastUpdated
        self.userEnteredAt = nil
        self.userNotes = nil
        self.userProvidedBalance = nil
        self.userTags = nil
        self.transactions = transactions
        // establish back references
        for t in self.transactions { t.account = self }
    }

    private enum CodingKeys: String, CodingKey { case id, accountId, balances, mask, name, officialName, type, subtype, verificationStatus, verificationName, verificationInsights, item, manualAccount, reconciledBalance, lastUpdated, userEnteredAt, userNotes, userProvidedBalance, userTags, transactions }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encode(accountId, forKey: .accountId); try c.encode(balances, forKey: .balances); try c.encodeIfPresent(mask, forKey: .mask); try c.encode(name, forKey: .name); try c.encodeIfPresent(officialName, forKey: .officialName); try c.encode(type, forKey: .type); try c.encodeIfPresent(subtype, forKey: .subtype); try c.encode(verificationStatus, forKey: .verificationStatus); try c.encode(verificationName, forKey: .verificationName); try c.encode(verificationInsights, forKey: .verificationInsights); try c.encode(item, forKey: .item); try c.encode(manualAccount, forKey: .manualAccount); try c.encodeIfPresent(reconciledBalance, forKey: .reconciledBalance); try c.encodeIfPresent(lastUpdated, forKey: .lastUpdated); try c.encodeIfPresent(userEnteredAt, forKey: .userEnteredAt); try c.encodeIfPresent(userNotes, forKey: .userNotes); try c.encodeIfPresent(userProvidedBalance, forKey: .userProvidedBalance); try c.encodeIfPresent(userTags, forKey: .userTags); try c.encode(transactions, forKey: .transactions) }
    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.accountId = try c.decode(String.self, forKey: .accountId)
        self.balances = try c.decode(AccountBalancesDTO.self, forKey: .balances)
        self.mask = try c.decodeIfPresent(String.self, forKey: .mask)
        self.name = try c.decode(String.self, forKey: .name)
        self.officialName = try c.decodeIfPresent(String.self, forKey: .officialName)
        self.type = try c.decode(String.self, forKey: .type)
        self.subtype = try c.decodeIfPresent(String.self, forKey: .subtype)
        self.verificationStatus = try c.decode(String.self, forKey: .verificationStatus)
        self.verificationName = try c.decode(String.self, forKey: .verificationName)
        self.verificationInsights = try c.decode(VerificationInsightsDTO.self, forKey: .verificationInsights)
        self.item = try c.decode(ItemDTO.self, forKey: .item)
        self.manualAccount = try c.decode(Bool.self, forKey: .manualAccount)
        self.reconciledBalance = try c.decodeIfPresent(Double.self, forKey: .reconciledBalance)
        self.lastUpdated = try c.decodeIfPresent(Date.self, forKey: .lastUpdated)
        self.userEnteredAt = try c.decodeIfPresent(Date.self, forKey: .userEnteredAt)
        self.userNotes = try c.decodeIfPresent(String.self, forKey: .userNotes)
        self.userProvidedBalance = try c.decodeIfPresent(Double.self, forKey: .userProvidedBalance)
        self.userTags = try c.decodeIfPresent([String].self, forKey: .userTags)
        self.transactions = try c.decodeIfPresent([TransactionDTO].self, forKey: .transactions) ?? []
        for t in self.transactions { t.account = self }
    }

    public static func == (lhs: AccountDTO, rhs: AccountDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - AccountBalancesDTO
public final class AccountBalancesDTO: Codable, Hashable {
    public var id: UUID
    public var available: Double?
    public var current: Double?
    public var limit: Double?
    public var isoCurrencyCode: String?
    public var unofficialCurrencyCode: String?
    public var lastUpdated: Date?
    public var persistentAccountId: String
    public var holderCategory: String?

    public init(
        id: UUID = UUID(),
        available: Double? = nil,
        current: Double? = nil,
        limit: Double? = nil,
        isoCurrencyCode: String? = nil,
        unofficialCurrencyCode: String? = nil,
        lastUpdated: Date? = nil,
        persistentAccountId: String,
        holderCategory: String? = nil
    ) {
        self.id = id
        self.available = available
        self.current = current
        self.limit = limit
        self.isoCurrencyCode = isoCurrencyCode
        self.unofficialCurrencyCode = unofficialCurrencyCode
        self.lastUpdated = lastUpdated
        self.persistentAccountId = persistentAccountId
        self.holderCategory = holderCategory
    }

    private enum CodingKeys: String, CodingKey { case id, available, current, limit, isoCurrencyCode, unofficialCurrencyCode, lastUpdated, persistentAccountId, holderCategory }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encodeIfPresent(available, forKey: .available); try c.encodeIfPresent(current, forKey: .current); try c.encodeIfPresent(limit, forKey: .limit); try c.encodeIfPresent(isoCurrencyCode, forKey: .isoCurrencyCode); try c.encodeIfPresent(unofficialCurrencyCode, forKey: .unofficialCurrencyCode); try c.encodeIfPresent(lastUpdated, forKey: .lastUpdated); try c.encode(persistentAccountId, forKey: .persistentAccountId); try c.encodeIfPresent(holderCategory, forKey: .holderCategory) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.available = try c.decodeIfPresent(Double.self, forKey: .available); self.current = try c.decodeIfPresent(Double.self, forKey: .current); self.limit = try c.decodeIfPresent(Double.self, forKey: .limit); self.isoCurrencyCode = try c.decodeIfPresent(String.self, forKey: .isoCurrencyCode); self.unofficialCurrencyCode = try c.decodeIfPresent(String.self, forKey: .unofficialCurrencyCode); self.lastUpdated = try c.decodeIfPresent(Date.self, forKey: .lastUpdated); self.persistentAccountId = try c.decode(String.self, forKey: .persistentAccountId); self.holderCategory = try c.decodeIfPresent(String.self, forKey: .holderCategory) }
    public static func == (lhs: AccountBalancesDTO, rhs: AccountBalancesDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - VerificationInsightsDTO
public final class VerificationInsightsDTO: Codable, Hashable {
    public var id: UUID
    public var nameMatchScore: Int?
    public var networkStatus: NetworkStatusDTO
    public var previousReturns: PreviousReturnsDTO
    public var accountNumberFormat: String

    public init(
        id: UUID = UUID(),
        nameMatchScore: Int? = nil,
        networkStatus: NetworkStatusDTO,
        previousReturns: PreviousReturnsDTO,
        accountNumberFormat: String
    ) {
        self.id = id
        self.nameMatchScore = nameMatchScore
        self.networkStatus = networkStatus
        self.previousReturns = previousReturns
        self.accountNumberFormat = accountNumberFormat
    }

    private enum CodingKeys: String, CodingKey { case id, nameMatchScore, networkStatus, previousReturns, accountNumberFormat }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encodeIfPresent(nameMatchScore, forKey: .nameMatchScore); try c.encode(networkStatus, forKey: .networkStatus); try c.encode(previousReturns, forKey: .previousReturns); try c.encode(accountNumberFormat, forKey: .accountNumberFormat) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.nameMatchScore = try c.decodeIfPresent(Int.self, forKey: .nameMatchScore); self.networkStatus = try c.decode(NetworkStatusDTO.self, forKey: .networkStatus); self.previousReturns = try c.decode(PreviousReturnsDTO.self, forKey: .previousReturns); self.accountNumberFormat = try c.decode(String.self, forKey: .accountNumberFormat) }
    public static func == (lhs: VerificationInsightsDTO, rhs: VerificationInsightsDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - NetworkStatusDTO
public final class NetworkStatusDTO: Codable, Hashable {
    public var id: UUID
    public var hasNumbersMatch: Bool
    public var isNumbersMatchVerified: Bool

    public init(id: UUID = UUID(), hasNumbersMatch: Bool, isNumbersMatchVerified: Bool) {
        self.id = id
        self.hasNumbersMatch = hasNumbersMatch
        self.isNumbersMatchVerified = isNumbersMatchVerified
    }

    private enum CodingKeys: String, CodingKey { case id, hasNumbersMatch, isNumbersMatchVerified }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encode(hasNumbersMatch, forKey: .hasNumbersMatch); try c.encode(isNumbersMatchVerified, forKey: .isNumbersMatchVerified) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.hasNumbersMatch = try c.decode(Bool.self, forKey: .hasNumbersMatch); self.isNumbersMatchVerified = try c.decode(Bool.self, forKey: .isNumbersMatchVerified) }
    public static func == (lhs: NetworkStatusDTO, rhs: NetworkStatusDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - PreviousReturnsDTO
public final class PreviousReturnsDTO: Codable, Hashable {
    public var id: UUID
    public var hasPreviousAdministrativeReturns: Bool

    public init(id: UUID = UUID(), hasPreviousAdministrativeReturns: Bool) {
        self.id = id
        self.hasPreviousAdministrativeReturns = hasPreviousAdministrativeReturns
    }

    private enum CodingKeys: String, CodingKey { case id, hasPreviousAdministrativeReturns }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encode(hasPreviousAdministrativeReturns, forKey: .hasPreviousAdministrativeReturns) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.hasPreviousAdministrativeReturns = try c.decode(Bool.self, forKey: .hasPreviousAdministrativeReturns) }
    public static func == (lhs: PreviousReturnsDTO, rhs: PreviousReturnsDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - ItemDTO
public final class ItemDTO: Codable, Hashable {
    public var id: UUID
    public var itemId: String
    public var institutionId: String?
    public var institutionName: String?
    public var webhook: String?
    public var auth_method: String?
    public var error: ItemErrorDTO?
    public var availableProducts: [String]
    public var billedProducts: [String]
    public var products: [String]
    public var consentedProducts: [String]
    public var consentExpirationTime: Date?
    public var updateType: String

    public init(
        id: UUID = UUID(),
        itemId: String,
        institutionId: String? = nil,
        institutionName: String? = nil,
        webhook: String? = nil,
        auth_method: String? = nil,
        error: ItemErrorDTO? = nil,
        availableProducts: [String],
        billedProducts: [String],
        products: [String],
        consentedProducts: [String],
        consentExpirationTime: Date? = nil,
        updateType: String
    ) {
        self.id = id
        self.itemId = itemId
        self.institutionId = institutionId
        self.institutionName = institutionName
        self.webhook = webhook
        self.auth_method = auth_method
        self.error = error
        self.availableProducts = availableProducts
        self.billedProducts = billedProducts
        self.products = products
        self.consentedProducts = consentedProducts
        self.consentExpirationTime = consentExpirationTime
        self.updateType = updateType
    }

    private enum CodingKeys: String, CodingKey { case id, itemId, institutionId, institutionName, webhook, auth_method, error, availableProducts, billedProducts, products, consentedProducts, consentExpirationTime, updateType }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encode(itemId, forKey: .itemId); try c.encodeIfPresent(institutionId, forKey: .institutionId); try c.encodeIfPresent(institutionName, forKey: .institutionName); try c.encodeIfPresent(webhook, forKey: .webhook); try c.encodeIfPresent(auth_method, forKey: .auth_method); try c.encodeIfPresent(error, forKey: .error); try c.encode(availableProducts, forKey: .availableProducts); try c.encode(billedProducts, forKey: .billedProducts); try c.encode(products, forKey: .products); try c.encode(consentedProducts, forKey: .consentedProducts); try c.encodeIfPresent(consentExpirationTime, forKey: .consentExpirationTime); try c.encode(updateType, forKey: .updateType) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.itemId = try c.decode(String.self, forKey: .itemId); self.institutionId = try c.decodeIfPresent(String.self, forKey: .institutionId); self.institutionName = try c.decodeIfPresent(String.self, forKey: .institutionName); self.webhook = try c.decodeIfPresent(String.self, forKey: .webhook); self.auth_method = try c.decodeIfPresent(String.self, forKey: .auth_method); self.error = try c.decodeIfPresent(ItemErrorDTO.self, forKey: .error); self.availableProducts = try c.decode([String].self, forKey: .availableProducts); self.billedProducts = try c.decode([String].self, forKey: .billedProducts); self.products = try c.decode([String].self, forKey: .products); self.consentedProducts = try c.decode([String].self, forKey: .consentedProducts); self.consentExpirationTime = try c.decodeIfPresent(Date.self, forKey: .consentExpirationTime); self.updateType = try c.decode(String.self, forKey: .updateType) }
    public static func == (lhs: ItemDTO, rhs: ItemDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

// MARK: - ItemErrorDTO
public final class ItemErrorDTO: Codable, Hashable {
    public var id: UUID
    public var errorType: String
    public var errorCode: String
    public var errorCodeReason: String?
    public var errorMessage: String
    public var displayMessage: String?
    public var requestId: String
    public var causes: [ItemErrorDTO]
    public var status: Int?
    public var documenationUrl: String
    public var suggestedAction: String?

    public init(
        id: UUID = UUID(),
        errorType: String,
        errorCode: String,
        errorCodeReason: String? = nil,
        errorMessage: String,
        displayMessage: String? = nil,
        requestId: String,
        causes: [ItemErrorDTO],
        status: Int? = nil,
        documenationUrl: String,
        suggestedAction: String? = nil
    ) {
        self.id = id
        self.errorType = errorType
        self.errorCode = errorCode
        self.errorCodeReason = errorCodeReason
        self.errorMessage = errorMessage
        self.displayMessage = displayMessage
        self.requestId = requestId
        self.causes = causes
        self.status = status
        self.documenationUrl = documenationUrl
        self.suggestedAction = suggestedAction
    }

    private enum CodingKeys: String, CodingKey { case id, errorType, errorCode, errorCodeReason, errorMessage, displayMessage, requestId, causes, status, documenationUrl, suggestedAction }
    public func encode(to encoder: Encoder) throws { var c = encoder.container(keyedBy: CodingKeys.self); try c.encode(id, forKey: .id); try c.encode(errorType, forKey: .errorType); try c.encode(errorCode, forKey: .errorCode); try c.encodeIfPresent(errorCodeReason, forKey: .errorCodeReason); try c.encode(errorMessage, forKey: .errorMessage); try c.encodeIfPresent(displayMessage, forKey: .displayMessage); try c.encode(requestId, forKey: .requestId); try c.encode(causes, forKey: .causes); try c.encodeIfPresent(status, forKey: .status); try c.encode(documenationUrl, forKey: .documenationUrl); try c.encodeIfPresent(suggestedAction, forKey: .suggestedAction) }
    public init(from decoder: Decoder) throws { let c = try decoder.container(keyedBy: CodingKeys.self); self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID(); self.errorType = try c.decode(String.self, forKey: .errorType); self.errorCode = try c.decode(String.self, forKey: .errorCode); self.errorCodeReason = try c.decodeIfPresent(String.self, forKey: .errorCodeReason); self.errorMessage = try c.decode(String.self, forKey: .errorMessage); self.displayMessage = try c.decodeIfPresent(String.self, forKey: .displayMessage); self.requestId = try c.decode(String.self, forKey: .requestId); self.causes = try c.decode([ItemErrorDTO].self, forKey: .causes); self.status = try c.decodeIfPresent(Int.self, forKey: .status); self.documenationUrl = try c.decode(String.self, forKey: .documenationUrl); self.suggestedAction = try c.decodeIfPresent(String.self, forKey: .suggestedAction) }
    public static func == (lhs: ItemErrorDTO, rhs: ItemErrorDTO) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
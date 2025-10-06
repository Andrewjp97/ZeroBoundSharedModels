import Foundation

public enum TransactionSource: String, CaseIterable, Codable, Identifiable {
    /// Transactions synchronized from Plaid.
    case linked
    /// Transactions entered manually by the user.
    case manual

    /// Conformance to `Identifiable` for SwiftUI.
    public var id: String { rawValue }
}

public enum AccountManagementType: String, CaseIterable, Codable, Identifiable {
    /// Linked accounts are backed by Plaid data and refreshed automatically.
    case linked
    /// Manual accounts are maintained solely by user input.
    case manual

    /// Conformance to `Identifiable` for SwiftUI collections.
    public var id: String { rawValue }
}

public enum AccountGroup: Equatable {
    /// Represents brokerage and retirement style investment accounts.
    case investment
    /// Represents asset accounts such as checking and savings.
    case asset(AssetCategory)
    /// Represents liabilities such as loans and credit cards.
    case liability(LiabilityCategory)

    /// Specific groupings for asset accounts.
    public enum AssetCategory: String {
        /// Traditional checking or spending accounts.
        case checking
        /// Interest-bearing savings accounts.
        case savings
        /// Asset accounts that do not fall into a specific bucket.
        case other
    }

    /// Specific groupings for liability accounts.
    public enum LiabilityCategory: String {
        /// Student loan style liabilities.
        case student
        /// Mortgage style liabilities.
        case mortgage
        /// Credit card revolving debt.
        case creditCard
        /// Liability accounts that do not fall into a specific bucket.
        case other
    }
}
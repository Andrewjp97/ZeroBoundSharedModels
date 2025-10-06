import Foundation

public struct TransactionDTO: Codable, Hashable {

    public let id: String
    public let externalId: String?
    public let name: String
    public let amount: Double
    public let currencyCode: String
    public let date: Date
    public let postedDate: Date?
    public let authorizedDate: Date?
    public let merchantName: String?
    public let category: String?
    public let memo: String?
    public let isPending: Bool
    public let isTransfer: Bool
    public let sourceRawValue: String
    public let createdAt: Date
    public let updatedAt: Date
    public let account: String?
    public let linkedTransactionId: String?
    public let reconciledAt: Date?
    public let budgetAssignments: [BudgetTransactionAssignmentsDTO]?

}

public struct AccountDTO: Codable, Hashable {

    public let id: String
    public let name: String
    public let institutionName: String?
    public let accountNumber: String?
    public let accountTypeRawValue: String?
    public let subtype: String?
    public let currencyCode: String
    public let currentBalance: Double
    public let availableBalance: Double?
    public let creditLimit: Double?
    public let createdAt: Date
    public let updatedAt: Date
    public let managementTypeRawValue: String
    public let plaidItemId: String?
    public let plaidAccountId: String?
    public let linkedAt: Date?
    public let notes: String?
    public let manualStartingBalance: Double?
    public let liabilityId: String?
    public let isLiabilityOverdue: Bool
    public let lastPaymentAmount: Double?
    public let lastPaymentDate: Date?
    public let lastStatementBalance: Double?
    public let minimumPaymentAmount: Double?
    public let nextPaymentDueDate: Date?
    public let interestRatePercentage: Double?
    public let transactions: [TransactionDTO]?
    

}

public struct BudgetDTO: Codable, Hashable {

    public let id: String
    public let name: String
    public let startDate: Date
    public let currencyCode: String
    public let owner: UserDataDTO?
    public let categories: [BudgetCategoryDTO]?
    public let months: [BudgetMonthDTO]?
    public let updatedAt: Date

}

public struct BudgetCategoryDTO: Codable, Hashable {

    public let id: String
    public let name: String
    public let kindRawValue: String
    public let budget: BudgetDTO?
    public let assignments: [BudgetTransactionAssignmentsDTO]?

}

public struct BudgetMonthDTO: Codable, Hashable {

    public let id: String
    public let monthStart: Date
    public let updatedAt: Date
    public let budget: BudgetDTO?
    public let assignments: [BudgetTransactionAssignmentsDTO]?

}

public struct BudgetTransactionAssignmentsDTO: Codable, Hashable {

    public let id: String
    public let transaction: TransactionDTO?
    public let category: BudgetCategoryDTO
    public let month: BudgetMonthDTO
    public let assignedAmount: Double

}

public struct UserDataDTO: Codable, Hashable {

    public let id: String
    public let userName: String?
    public let email: String?
    public let basePayStoredAmount: Double?
    public let basePayTypeRawValue: String?
    public let basePayCurrencyCode: String?
    public let budgets: [BudgetDTO]?
    public let activeBudgetId: String?

}
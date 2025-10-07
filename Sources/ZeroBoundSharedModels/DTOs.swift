import Foundation

public struct TransactionDTO: Codable, Hashable {

    public let id: String
    public let userId: String
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

    init(id: String, userId: String, externalId: String? = nil, name: String, amount: Double, currencyCode: String, date: Date, postedDate: Date? = nil, authorizedDate: Date? = nil, merchantName: String? = nil, category: String? = nil, memo: String? = nil, isPending: Bool, isTransfer: Bool, sourceRawValue: String, createdAt: Date, updatedAt: Date, account: String? = nil, linkedTransactionId: String? = nil, reconciledAt: Date? = nil, budgetAssignments: [BudgetTransactionAssignmentsDTO]? = nil) {
        self.id = id
        self.userId = userId
        self.externalId = externalId
        self.name = name
        self.amount = amount
        self.currencyCode = currencyCode
        self.date = date
        self.postedDate = postedDate
        self.authorizedDate = authorizedDate
        self.merchantName = merchantName
        self.category = category
        self.memo = memo
        self.isPending = isPending
        self.isTransfer = isTransfer
        self.sourceRawValue = sourceRawValue
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.account = account
        self.linkedTransactionId = linkedTransactionId
        self.reconciledAt = reconciledAt
        self.budgetAssignments = budgetAssignments
    }

}

public struct AccountDTO: Codable, Hashable {

    public let id: String
    public let userId: String
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

    init(id: String, userId: String, name: String, institutionName: String? = nil, accountNumber: String? = nil, accountTypeRawValue: String? = nil, subtype: String? = nil, currencyCode: String, currentBalance: Double, availableBalance: Double? = nil, creditLimit: Double? = nil, createdAt: Date, updatedAt: Date, managementTypeRawValue: String, plaidItemId: String? = nil, plaidAccountId: String? = nil, linkedAt: Date? = nil, notes: String? = nil, manualStartingBalance: Double? = nil, liabilityId: String? = nil, isLiabilityOverdue: Bool = false, lastPaymentAmount: Double? = nil, lastPaymentDate: Date? = nil, lastStatementBalance: Double? = nil, minimumPaymentAmount: Double? = nil, nextPaymentDueDate: Date? = nil, interestRatePercentage: Double? = nil, transactions: [TransactionDTO]? = nil) {
        self.id = id
        self.userId = userId
        self.name = name
        self.institutionName = institutionName
        self.accountNumber = accountNumber
        self.accountTypeRawValue = accountTypeRawValue
        self.subtype = subtype
        self.currencyCode = currencyCode
        self.currentBalance = currentBalance
        self.availableBalance = availableBalance
        self.creditLimit = creditLimit
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.managementTypeRawValue = managementTypeRawValue
        self.plaidItemId = plaidItemId
        self.plaidAccountId = plaidAccountId
        self.linkedAt = linkedAt
        self.notes = notes
        self.manualStartingBalance = manualStartingBalance
        self.liabilityId = liabilityId
        self.isLiabilityOverdue = isLiabilityOverdue
        self.lastPaymentAmount = lastPaymentAmount
        self.lastPaymentDate = lastPaymentDate
        self.lastStatementBalance = lastStatementBalance
        self.minimumPaymentAmount = minimumPaymentAmount
        self.nextPaymentDueDate = nextPaymentDueDate
        self.interestRatePercentage = interestRatePercentage
        self.transactions = transactions
    }

}

public struct BudgetDTO: Codable, Hashable {

    public let id: String
    public let userId: String
    public let name: String
    public let startDate: Date
    public let currencyCode: String
    public let owner: UserDataDTO?
    public let categories: [BudgetCategoryDTO]?
    public let months: [BudgetMonthDTO]?
    public let updatedAt: Date

    init(id: String, userId: String, name: String, startDate: Date, currencyCode: String, owner: UserDataDTO? = nil, categories: [BudgetCategoryDTO]? = nil, months: [BudgetMonthDTO]? = nil, updatedAt: Date) {
        self.id = id
        self.userId = userId
        self.name = name
        self.startDate = startDate
        self.currencyCode = currencyCode
        self.owner = owner
        self.categories = categories
        self.months = months
        self.updatedAt = updatedAt
    }

}

public struct BudgetCategoryDTO: Codable, Hashable {

    public let id: String
    public let userId: String
    public let name: String
    public let kindRawValue: String
    public let budget: BudgetDTO?
    public let assignments: [BudgetTransactionAssignmentsDTO]?

    init(id: String, userId: String, name: String, kindRawValue: String, budget: BudgetDTO? = nil, assignments: [BudgetTransactionAssignmentsDTO]? = nil) {
        self.id = id
        self.userId = userId
        self.name = name
        self.kindRawValue = kindRawValue
        self.budget = budget
        self.assignments = assignments
    }

}

public struct BudgetMonthDTO: Codable, Hashable {

    public let id: String
    public let userId: String
    public let monthStart: Date
    public let updatedAt: Date
    public let budget: BudgetDTO?
    public let assignments: [BudgetTransactionAssignmentsDTO]?

    init(id: String, userId: String, monthStart: Date, updatedAt: Date, budget: BudgetDTO? = nil, assignments: [BudgetTransactionAssignmentsDTO]? = nil) {
        self.id = id
        self.userId = userId
        self.monthStart = monthStart
        self.updatedAt = updatedAt
        self.budget = budget
        self.assignments = assignments
    }

}

public struct BudgetTransactionAssignmentsDTO: Codable, Hashable {

    public let id: String
    public let userId: String
    public let transaction: TransactionDTO?
    public let category: BudgetCategoryDTO
    public let month: BudgetMonthDTO
    public let assignedAmount: Double

    init(id: String, userId: String, transaction: TransactionDTO? = nil, category: BudgetCategoryDTO, month: BudgetMonthDTO, assignedAmount: Double) {
        self.id = id
        self.userId = userId
        self.transaction = transaction
        self.category = category
        self.month = month
        self.assignedAmount = assignedAmount
    }

}

public struct UserDataDTO: Codable, Hashable {

    public let id: String
    public let userId: String
    public let userName: String?
    public let email: String?
    public let basePayStoredAmount: Double?
    public let basePayTypeRawValue: String?
    public let basePayCurrencyCode: String?
    public let budgets: [BudgetDTO]?
    public let activeBudgetId: String?

    init(id: String, userId: String, userName: String? = nil, email: String? = nil, basePayStoredAmount: Double? = nil, basePayTypeRawValue: String? = nil, basePayCurrencyCode: String? = nil, budgets: [BudgetDTO]? = nil, activeBudgetId: String? = nil) {
        self.id = id
        self.userId = userId
        self.userName = userName
        self.email = email
        self.basePayStoredAmount = basePayStoredAmount
        self.basePayTypeRawValue = basePayTypeRawValue
        self.basePayCurrencyCode = basePayCurrencyCode
        self.budgets = budgets
        self.activeBudgetId = activeBudgetId
    }

}
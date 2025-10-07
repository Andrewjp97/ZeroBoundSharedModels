import Foundation

public final class TransactionDTO: Codable, Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(userId)
        hasher.combine(externalId)
        hasher.combine(name)
        hasher.combine(amount)
        hasher.combine(currencyCode)
        hasher.combine(date)
        hasher.combine(postedDate)
        hasher.combine(authorizedDate)
        hasher.combine(merchantName)
        hasher.combine(category)
        hasher.combine(memo)
        hasher.combine(isPending)
        hasher.combine(isTransfer)
        hasher.combine(sourceRawValue)
        hasher.combine(createdAt)
        hasher.combine(updatedAt)
        hasher.combine(account)
        hasher.combine(linkedTransactionId)
        hasher.combine(reconciledAt)
        hasher.combine(budgetAssignments)
    }

    public static func == (lhs: TransactionDTO, rhs: TransactionDTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.userId == rhs.userId &&
            lhs.externalId == rhs.externalId &&
            lhs.name == rhs.name &&
            lhs.amount == rhs.amount &&
            lhs.currencyCode == rhs.currencyCode &&
            lhs.date == rhs.date &&
            lhs.postedDate == rhs.postedDate &&
            lhs.authorizedDate == rhs.authorizedDate &&
            lhs.merchantName == rhs.merchantName &&
            lhs.category == rhs.category &&
            lhs.memo == rhs.memo &&
            lhs.isPending == rhs.isPending &&
            lhs.isTransfer == rhs.isTransfer &&
            lhs.sourceRawValue == rhs.sourceRawValue &&
            lhs.createdAt == rhs.createdAt &&
            lhs.updatedAt == rhs.updatedAt &&
            lhs.account == rhs.account &&
            lhs.linkedTransactionId == rhs.linkedTransactionId &&
            lhs.reconciledAt == rhs.reconciledAt &&
            lhs.budgetAssignments == rhs.budgetAssignments
    }

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

public final class AccountDTO: Codable, Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(userId)
        hasher.combine(name)
        hasher.combine(institutionName)
        hasher.combine(accountNumber)
        hasher.combine(accountTypeRawValue)
        hasher.combine(subtype)
        hasher.combine(currencyCode)
        hasher.combine(currentBalance)
        hasher.combine(availableBalance)
        hasher.combine(creditLimit)
        hasher.combine(createdAt)
        hasher.combine(updatedAt)
        hasher.combine(managementTypeRawValue)
        hasher.combine(plaidItemId)
        hasher.combine(plaidAccountId)
        hasher.combine(linkedAt)
        hasher.combine(notes)
        hasher.combine(manualStartingBalance)
        hasher.combine(liabilityId)
        hasher.combine(isLiabilityOverdue)
        hasher.combine(lastPaymentAmount)
        hasher.combine(lastPaymentDate)
        hasher.combine(lastStatementBalance)
        hasher.combine(minimumPaymentAmount)
        hasher.combine(nextPaymentDueDate)
        hasher.combine(interestRatePercentage)
        hasher.combine(transactions)
    }

    public static func == (lhs: AccountDTO, rhs: AccountDTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.userId == rhs.userId &&
            lhs.name == rhs.name &&
            lhs.institutionName == rhs.institutionName &&
            lhs.accountNumber == rhs.accountNumber &&
            lhs.accountTypeRawValue == rhs.accountTypeRawValue &&
            lhs.subtype == rhs.subtype &&
            lhs.currencyCode == rhs.currencyCode &&
            lhs.currentBalance == rhs.currentBalance &&
            lhs.availableBalance == rhs.availableBalance &&
            lhs.creditLimit == rhs.creditLimit &&
            lhs.createdAt == rhs.createdAt &&
            lhs.updatedAt == rhs.updatedAt &&
            lhs.managementTypeRawValue == rhs.managementTypeRawValue &&
            lhs.plaidItemId == rhs.plaidItemId &&
            lhs.plaidAccountId == rhs.plaidAccountId &&
            lhs.linkedAt == rhs.linkedAt &&
            lhs.notes == rhs.notes &&
            lhs.manualStartingBalance == rhs.manualStartingBalance &&
            lhs.liabilityId == rhs.liabilityId &&
            lhs.isLiabilityOverdue == rhs.isLiabilityOverdue &&
            lhs.lastPaymentAmount == rhs.lastPaymentAmount &&
            lhs.lastPaymentDate == rhs.lastPaymentDate &&
            lhs.lastStatementBalance == rhs.lastStatementBalance &&
            lhs.minimumPaymentAmount == rhs.minimumPaymentAmount &&
            lhs.nextPaymentDueDate == rhs.nextPaymentDueDate &&
            lhs.interestRatePercentage == rhs.interestRatePercentage &&
            lhs.transactions == rhs.transactions
    }

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

public final class BudgetDTO: Codable, Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(userId)
        hasher.combine(name)
        hasher.combine(startDate)
        hasher.combine(currencyCode)
        hasher.combine(owner)
        hasher.combine(categories)
        hasher.combine(months)
        hasher.combine(updatedAt)
    }

    public static func == (lhs: BudgetDTO, rhs: BudgetDTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.userId == rhs.userId &&
            lhs.name == rhs.name &&
            lhs.startDate == rhs.startDate &&
            lhs.currencyCode == rhs.currencyCode &&
            lhs.owner == rhs.owner &&
            lhs.categories == rhs.categories &&
            lhs.months == rhs.months &&
            lhs.updatedAt == rhs.updatedAt
    }

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

public final class BudgetCategoryDTO: Codable, Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(userId)
        hasher.combine(name)
        hasher.combine(kindRawValue)
        hasher.combine(budget)
        hasher.combine(assignments)
    }

    public static func == (lhs: BudgetCategoryDTO, rhs: BudgetCategoryDTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.userId == rhs.userId &&
            lhs.name == rhs.name &&
            lhs.kindRawValue == rhs.kindRawValue &&
            lhs.budget == rhs.budget &&
            lhs.assignments == rhs.assignments
    }

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

public final class BudgetMonthDTO: Codable, Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(userId)
        hasher.combine(monthStart)
        hasher.combine(updatedAt)
        hasher.combine(budget)
        hasher.combine(assignments)
    }

    public static func == (lhs: BudgetMonthDTO, rhs: BudgetMonthDTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.userId == rhs.userId &&
            lhs.monthStart == rhs.monthStart &&
            lhs.updatedAt == rhs.updatedAt &&
            lhs.budget == rhs.budget &&
            lhs.assignments == rhs.assignments
    }

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

public final class BudgetTransactionAssignmentsDTO: Codable, Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(userId)
        hasher.combine(transaction)
        hasher.combine(category)
        hasher.combine(month)
        hasher.combine(assignedAmount)
    }

    public static func == (lhs: BudgetTransactionAssignmentsDTO, rhs: BudgetTransactionAssignmentsDTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.userId == rhs.userId &&
            lhs.transaction == rhs.transaction &&
            lhs.category == rhs.category &&
            lhs.month == rhs.month &&
            lhs.assignedAmount == rhs.assignedAmount
    }

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

public final class UserDataDTO: Codable, Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(userId)
        hasher.combine(userName)
        hasher.combine(email)
        hasher.combine(basePayStoredAmount)
        hasher.combine(basePayTypeRawValue)
        hasher.combine(basePayCurrencyCode)
        hasher.combine(budgets)
        hasher.combine(activeBudgetId)
    }

    public static func == (lhs: UserDataDTO, rhs: UserDataDTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.userId == rhs.userId &&
            lhs.userName == rhs.userName &&
            lhs.email == rhs.email &&
            lhs.basePayStoredAmount == rhs.basePayStoredAmount &&
            lhs.basePayTypeRawValue == rhs.basePayTypeRawValue &&
            lhs.basePayCurrencyCode == rhs.basePayCurrencyCode &&
            lhs.budgets == rhs.budgets &&
            lhs.activeBudgetId == rhs.activeBudgetId
    }

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
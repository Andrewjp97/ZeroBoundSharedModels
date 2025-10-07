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

    public var id: String
    public var userId: String
    public var externalId: String?
    public var name: String
    public var amount: Double
    public var currencyCode: String
    public var date: Date
    public var postedDate: Date?
    public var authorizedDate: Date?
    public var merchantName: String?
    public var category: String?
    public var memo: String?
    public var isPending: Bool
    public var isTransfer: Bool
    public var sourceRawValue: String
    public var createdAt: Date
    public var updatedAt: Date
    public var account: String?
    public var linkedTransactionId: String?
    public var reconciledAt: Date?
    public var budgetAssignments: [BudgetTransactionAssignmentsDTO]?

    public convenience init(id: String, userId: String, externalId: String? = nil, name: String, amount: Double, currencyCode: String, date: Date, postedDate: Date? = nil, authorizedDate: Date? = nil, merchantName: String? = nil, category: String? = nil, memo: String? = nil, isPending: Bool, isTransfer: Bool, sourceRawValue: String, createdAt: Date, updatedAt: Date, account: String? = nil, linkedTransactionId: String? = nil, reconciledAt: Date? = nil, budgetAssignments: [BudgetTransactionAssignmentsDTO]? = nil) {
       self.init()
       
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

    init() {
        self.id = ""
        self.userId = ""
        self.externalId = nil
        self.name = ""
        self.amount = 0.0
        self.currencyCode = ""
        self.date = Date()
        self.postedDate = nil
        self.authorizedDate = nil
        self.merchantName = nil
        self.category = nil
        self.memo = nil
        self.isPending = false
        self.isTransfer = false
        self.sourceRawValue = ""
        self.createdAt = Date()
        self.updatedAt = Date()
        self.account = nil
        self.linkedTransactionId = nil
        self.reconciledAt = nil
        self.budgetAssignments = nil
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

    public var id: String
    public var userId: String
    public var name: String
    public var institutionName: String?
    public var accountNumber: String?
    public var accountTypeRawValue: String?
    public var subtype: String?
    public var currencyCode: String
    public var currentBalance: Double
    public var availableBalance: Double?
    public var creditLimit: Double?
    public var createdAt: Date
    public var updatedAt: Date
    public var managementTypeRawValue: String
    public var plaidItemId: String?
    public var plaidAccountId: String?
    public var linkedAt: Date?
    public var notes: String?
    public var manualStartingBalance: Double?
    public var liabilityId: String?
    public var isLiabilityOverdue: Bool
    public var lastPaymentAmount: Double?
    public var lastPaymentDate: Date?
    public var lastStatementBalance: Double?
    public var minimumPaymentAmount: Double?
    public var nextPaymentDueDate: Date?
    public var interestRatePercentage: Double?
    public var transactions: [TransactionDTO]?

    public convenience init(id: String, userId: String, name: String, institutionName: String? = nil, accountNumber: String? = nil, accountTypeRawValue: String? = nil, subtype: String? = nil, currencyCode: String, currentBalance: Double, availableBalance: Double? = nil, creditLimit: Double? = nil, createdAt: Date, updatedAt: Date, managementTypeRawValue: String, plaidItemId: String? = nil, plaidAccountId: String? = nil, linkedAt: Date? = nil, notes: String? = nil, manualStartingBalance: Double? = nil, liabilityId: String? = nil, isLiabilityOverdue: Bool = false, lastPaymentAmount: Double? = nil, lastPaymentDate: Date? = nil, lastStatementBalance: Double? = nil, minimumPaymentAmount: Double? = nil, nextPaymentDueDate: Date? = nil, interestRatePercentage: Double? = nil, transactions: [TransactionDTO]? = nil) {
        self.init()
        
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

    init() {
        self.id = ""
        self.userId = ""
        self.name = ""
        self.institutionName = nil
        self.accountNumber = nil
        self.accountTypeRawValue = nil
        self.subtype = nil
        self.currencyCode = ""
        self.currentBalance = 0.0
        self.availableBalance = nil
        self.creditLimit = nil
        self.createdAt = Date()
        self.updatedAt = Date()
        self.managementTypeRawValue = ""
        self.plaidItemId = nil
        self.plaidAccountId = nil
        self.linkedAt = nil
        self.notes = nil
        self.manualStartingBalance = nil
        self.liabilityId = nil
        self.isLiabilityOverdue = false
        self.lastPaymentAmount = nil
        self.lastPaymentDate = nil
        self.lastStatementBalance = nil
        self.minimumPaymentAmount = nil
        self.nextPaymentDueDate = nil
        self.interestRatePercentage = nil
        self.transactions = nil
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

    public var id: String
    public var userId: String
    public var name: String
    public var startDate: Date
    public var currencyCode: String
    public var owner: UserDataDTO?
    public var categories: [BudgetCategoryDTO]?
    public var months: [BudgetMonthDTO]?
    public var updatedAt: Date

    public convenience init(id: String, userId: String, name: String, startDate: Date, currencyCode: String, owner: UserDataDTO? = nil, categories: [BudgetCategoryDTO]? = nil, months: [BudgetMonthDTO]? = nil, updatedAt: Date) {
        self.init()

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

    init() {
        self.id = ""
        self.userId = ""
        self.name = ""
        self.startDate = Date()
        self.currencyCode = ""
        self.owner = nil
        self.categories = nil
        self.months = nil
        self.updatedAt = Date()
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

    public var id: String
    public var userId: String
    public var name: String
    public var kindRawValue: String
    public var budget: BudgetDTO?
    public var assignments: [BudgetTransactionAssignmentsDTO]?

    public convenience init(id: String, userId: String, name: String, kindRawValue: String, budget: BudgetDTO? = nil, assignments: [BudgetTransactionAssignmentsDTO]? = nil) {
        self.init()

        self.id = id
        self.userId = userId
        self.name = name
        self.kindRawValue = kindRawValue
        self.budget = budget
        self.assignments = assignments
    }

    init() {
        self.id = ""
        self.userId = ""
        self.name = ""
        self.kindRawValue = ""
        self.budget = nil
        self.assignments = nil
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

    public var id: String
    public var userId: String
    public var monthStart: Date
    public var updatedAt: Date
    public var budget: BudgetDTO?
    public var assignments: [BudgetTransactionAssignmentsDTO]?

    public convenience init(id: String, userId: String, monthStart: Date, updatedAt: Date, budget: BudgetDTO? = nil, assignments: [BudgetTransactionAssignmentsDTO]? = nil) {
        self.init()

        self.id = id
        self.userId = userId
        self.monthStart = monthStart
        self.updatedAt = updatedAt
        self.budget = budget
        self.assignments = assignments
    }

    init() {
        self.id = ""
        self.userId = ""
        self.monthStart = Date()
        self.updatedAt = Date()
        self.budget = nil
        self.assignments = nil
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

    public var id: String
    public var userId: String
    public var transaction: TransactionDTO?
    public var category: BudgetCategoryDTO
    public var month: BudgetMonthDTO
    public var assignedAmount: Double

    public convenience init(id: String, userId: String, transaction: TransactionDTO? = nil, category: BudgetCategoryDTO, month: BudgetMonthDTO, assignedAmount: Double) {
        self.init()

        self.id = id
        self.userId = userId
        self.transaction = transaction
        self.category = category
        self.month = month
        self.assignedAmount = assignedAmount
    }

    init() {
        self.id = ""
        self.userId = ""
        self.transaction = nil
        self.category = BudgetCategoryDTO(id: "", userId: "", name: "", kindRawValue: "")
        self.month = BudgetMonthDTO(id: "", userId: "", monthStart: Date(), updatedAt: Date())
        self.assignedAmount = 0.0
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

    public var id: String
    public var userId: String
    public var userName: String?
    public var email: String?
    public var basePayStoredAmount: Double?
    public var basePayTypeRawValue: String?
    public var basePayCurrencyCode: String?
    public var budgets: [BudgetDTO]?
    public var activeBudgetId: String?

    public convenience init(id: String, userId: String, userName: String? = nil, email: String? = nil, basePayStoredAmount: Double? = nil, basePayTypeRawValue: String? = nil, basePayCurrencyCode: String? = nil, budgets: [BudgetDTO]? = nil, activeBudgetId: String? = nil) {
       
        self.init()

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

    init(){
        self.id = ""
        self.userId = ""
        self.userName = nil
        self.email = nil
        self.basePayStoredAmount = nil
        self.basePayTypeRawValue = nil
        self.basePayCurrencyCode = nil
        self.budgets = nil
        self.activeBudgetId = nil
    }

}
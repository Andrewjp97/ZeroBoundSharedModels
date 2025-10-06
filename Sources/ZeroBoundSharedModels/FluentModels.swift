#if canImport(FluentKit)
import Foundation
import FluentKit

// MARK: - Conversion Support

/// Errors that may occur when converting Fluent models into DTO representations.
public enum ModelConversionError: Error, LocalizedError {
    case missingIdentifier(model: String)

    public var errorDescription: String? {
        switch self {
        case .missingIdentifier(let model):
            return "The model \(model) is missing a value for its identifier."
        }
    }
}

// MARK: - Transaction

public final class TransactionModel: Model, @unchecked Sendable {
    public static let schema = "transactions"

    enum FieldKeys {
        static let id: FieldKey = "id"
        static let externalId: FieldKey = "external_id"
        static let name: FieldKey = "name"
        static let amount: FieldKey = "amount"
        static let currencyCode: FieldKey = "currency_code"
        static let date: FieldKey = "date"
        static let postedDate: FieldKey = "posted_date"
        static let authorizedDate: FieldKey = "authorized_date"
        static let merchantName: FieldKey = "merchant_name"
        static let category: FieldKey = "category"
        static let memo: FieldKey = "memo"
        static let isPending: FieldKey = "is_pending"
        static let isTransfer: FieldKey = "is_transfer"
        static let sourceRawValue: FieldKey = "source_raw_value"
        static let createdAt: FieldKey = "created_at"
        static let updatedAt: FieldKey = "updated_at"
        static let accountId: FieldKey = "account_id"
        static let linkedTransactionId: FieldKey = "linked_transaction_id"
        static let reconciledAt: FieldKey = "reconciled_at"
    }

    @ID(custom: FieldKeys.id, generatedBy: .user)
    public var id: String?

    @OptionalField(key: FieldKeys.externalId)
    public var externalId: String?

    @Field(key: FieldKeys.name)
    public var name: String

    @Field(key: FieldKeys.amount)
    public var amount: Double

    @Field(key: FieldKeys.currencyCode)
    public var currencyCode: String

    @Field(key: FieldKeys.date)
    public var date: Date

    @OptionalField(key: FieldKeys.postedDate)
    public var postedDate: Date?

    @OptionalField(key: FieldKeys.authorizedDate)
    public var authorizedDate: Date?

    @OptionalField(key: FieldKeys.merchantName)
    public var merchantName: String?

    @OptionalField(key: FieldKeys.category)
    public var category: String?

    @OptionalField(key: FieldKeys.memo)
    public var memo: String?

    @Field(key: FieldKeys.isPending)
    public var isPending: Bool

    @Field(key: FieldKeys.isTransfer)
    public var isTransfer: Bool

    @Field(key: FieldKeys.sourceRawValue)
    public var sourceRawValue: String

    @Field(key: FieldKeys.createdAt)
    public var createdAt: Date

    @Field(key: FieldKeys.updatedAt)
    public var updatedAt: Date

    @OptionalParent(key: FieldKeys.accountId)
    public var account: AccountModel?

    @OptionalField(key: FieldKeys.linkedTransactionId)
    public var linkedTransactionId: String?

    @OptionalField(key: FieldKeys.reconciledAt)
    public var reconciledAt: Date?

    @Children(for: \.$transaction)
    public var budgetAssignments: [BudgetTransactionAssignmentModel]

    public init() { }

    public convenience init(from dto: TransactionDTO) {
        self.init()
        self.id = dto.id
        self.externalId = dto.externalId
        self.name = dto.name
        self.amount = dto.amount
        self.currencyCode = dto.currencyCode
        self.date = dto.date
        self.postedDate = dto.postedDate
        self.authorizedDate = dto.authorizedDate
        self.merchantName = dto.merchantName
        self.category = dto.category
        self.memo = dto.memo
        self.isPending = dto.isPending
        self.isTransfer = dto.isTransfer
        self.sourceRawValue = dto.sourceRawValue
        self.createdAt = dto.createdAt
        self.updatedAt = dto.updatedAt
        self.$account.id = dto.account
        self.linkedTransactionId = dto.linkedTransactionId
        self.reconciledAt = dto.reconciledAt
    }

    public func toDTO(
        account: String? = nil,
        linkedTransaction: String? = nil,
        budgetAssignments: [BudgetTransactionAssignmentsDTO]? = nil,
        includeAssignments: Bool = true
    ) throws -> TransactionDTO {
        guard let id = self.id else {
            throw ModelConversionError.missingIdentifier(model: "TransactionModel")
        }

        let resolvedAssignments: [BudgetTransactionAssignmentsDTO]?
        if let providedAssignments = budgetAssignments {
            resolvedAssignments = providedAssignments
        } else if includeAssignments, let loadedAssignments = self.$budgetAssignments.value {
            resolvedAssignments = try loadedAssignments.map { try $0.toDTO() }
        } else {
            resolvedAssignments = nil
        }

        return TransactionDTO(
            id: id,
            externalId: externalId,
            name: name,
            amount: amount,
            currencyCode: currencyCode,
            date: date,
            postedDate: postedDate,
            authorizedDate: authorizedDate,
            merchantName: merchantName,
            category: category,
            memo: memo,
            isPending: isPending,
            isTransfer: isTransfer,
            sourceRawValue: sourceRawValue,
            createdAt: createdAt,
            updatedAt: updatedAt,
            account: account ?? self.$account.id,
            linkedTransactionId: linkedTransaction ?? linkedTransactionId,
            reconciledAt: reconciledAt,
            budgetAssignments: resolvedAssignments
        )
    }
}

// MARK: - Account

public final class AccountModel: Model, @unchecked Sendable {
    public static let schema = "accounts"

    enum FieldKeys {
        static let id: FieldKey = "id"
        static let name: FieldKey = "name"
        static let institutionName: FieldKey = "institution_name"
        static let accountNumber: FieldKey = "account_number"
        static let accountTypeRawValue: FieldKey = "account_type_raw_value"
        static let subtype: FieldKey = "subtype"
        static let currencyCode: FieldKey = "currency_code"
        static let currentBalance: FieldKey = "current_balance"
        static let availableBalance: FieldKey = "available_balance"
        static let creditLimit: FieldKey = "credit_limit"
        static let createdAt: FieldKey = "created_at"
        static let updatedAt: FieldKey = "updated_at"
        static let managementTypeRawValue: FieldKey = "management_type_raw_value"
        static let plaidItemId: FieldKey = "plaid_item_id"
        static let plaidAccountId: FieldKey = "plaid_account_id"
        static let linkedAt: FieldKey = "linked_at"
        static let notes: FieldKey = "notes"
        static let manualStartingBalance: FieldKey = "manual_starting_balance"
        static let liabilityId: FieldKey = "liability_id"
        static let isLiabilityOverdue: FieldKey = "is_liability_overdue"
        static let lastPaymentAmount: FieldKey = "last_payment_amount"
        static let lastPaymentDate: FieldKey = "last_payment_date"
        static let lastStatementBalance: FieldKey = "last_statement_balance"
        static let minimumPaymentAmount: FieldKey = "minimum_payment_amount"
        static let nextPaymentDueDate: FieldKey = "next_payment_due_date"
        static let interestRatePercentage: FieldKey = "interest_rate_percentage"
    }

    @ID(custom: FieldKeys.id, generatedBy: .user)
    public var id: String?

    @Field(key: FieldKeys.name)
    public var name: String

    @OptionalField(key: FieldKeys.institutionName)
    public var institutionName: String?

    @OptionalField(key: FieldKeys.accountNumber)
    public var accountNumber: String?

    @OptionalField(key: FieldKeys.accountTypeRawValue)
    public var accountTypeRawValue: String?

    @OptionalField(key: FieldKeys.subtype)
    public var subtype: String?

    @Field(key: FieldKeys.currencyCode)
    public var currencyCode: String

    @Field(key: FieldKeys.currentBalance)
    public var currentBalance: Double

    @OptionalField(key: FieldKeys.availableBalance)
    public var availableBalance: Double?

    @OptionalField(key: FieldKeys.creditLimit)
    public var creditLimit: Double?

    @Field(key: FieldKeys.createdAt)
    public var createdAt: Date

    @Field(key: FieldKeys.updatedAt)
    public var updatedAt: Date

    @Field(key: FieldKeys.managementTypeRawValue)
    public var managementTypeRawValue: String

    @OptionalField(key: FieldKeys.plaidItemId)
    public var plaidItemId: String?

    @OptionalField(key: FieldKeys.plaidAccountId)
    public var plaidAccountId: String?

    @OptionalField(key: FieldKeys.linkedAt)
    public var linkedAt: Date?

    @OptionalField(key: FieldKeys.notes)
    public var notes: String?

    @OptionalField(key: FieldKeys.manualStartingBalance)
    public var manualStartingBalance: Double?

    @OptionalField(key: FieldKeys.liabilityId)
    public var liabilityId: String?

    @Field(key: FieldKeys.isLiabilityOverdue)
    public var isLiabilityOverdue: Bool

    @OptionalField(key: FieldKeys.lastPaymentAmount)
    public var lastPaymentAmount: Double?

    @OptionalField(key: FieldKeys.lastPaymentDate)
    public var lastPaymentDate: Date?

    @OptionalField(key: FieldKeys.lastStatementBalance)
    public var lastStatementBalance: Double?

    @OptionalField(key: FieldKeys.minimumPaymentAmount)
    public var minimumPaymentAmount: Double?

    @OptionalField(key: FieldKeys.nextPaymentDueDate)
    public var nextPaymentDueDate: Date?

    @OptionalField(key: FieldKeys.interestRatePercentage)
    public var interestRatePercentage: Double?

    @Children(for: \.$account)
    public var transactions: [TransactionModel]

    public init() { }

    public convenience init(from dto: AccountDTO) {
        self.init()
        self.id = dto.id
        self.name = dto.name
        self.institutionName = dto.institutionName
        self.accountNumber = dto.accountNumber
        self.accountTypeRawValue = dto.accountTypeRawValue
        self.subtype = dto.subtype
        self.currencyCode = dto.currencyCode
        self.currentBalance = dto.currentBalance
        self.availableBalance = dto.availableBalance
        self.creditLimit = dto.creditLimit
        self.createdAt = dto.createdAt
        self.updatedAt = dto.updatedAt
        self.managementTypeRawValue = dto.managementTypeRawValue
        self.plaidItemId = dto.plaidItemId
        self.plaidAccountId = dto.plaidAccountId
        self.linkedAt = dto.linkedAt
        self.notes = dto.notes
        self.manualStartingBalance = dto.manualStartingBalance
        self.liabilityId = dto.liabilityId
        self.isLiabilityOverdue = dto.isLiabilityOverdue
        self.lastPaymentAmount = dto.lastPaymentAmount
        self.lastPaymentDate = dto.lastPaymentDate
        self.lastStatementBalance = dto.lastStatementBalance
        self.minimumPaymentAmount = dto.minimumPaymentAmount
        self.nextPaymentDueDate = dto.nextPaymentDueDate
        self.interestRatePercentage = dto.interestRatePercentage
    }

    public func toDTO(
        transactions: [TransactionDTO]? = nil,
        includeTransactions: Bool = true
    ) throws -> AccountDTO {
        guard let id = self.id else {
            throw ModelConversionError.missingIdentifier(model: "AccountModel")
        }

        let resolvedTransactions: [TransactionDTO]?
        if let providedTransactions = transactions {
            resolvedTransactions = providedTransactions
        } else if includeTransactions, let loadedTransactions = self.$transactions.value {
            resolvedTransactions = try loadedTransactions.map { try $0.toDTO(includeAssignments: false) }
        } else {
            resolvedTransactions = nil
        }

        return AccountDTO(
            id: id,
            name: name,
            institutionName: institutionName,
            accountNumber: accountNumber,
            accountTypeRawValue: accountTypeRawValue,
            subtype: subtype,
            currencyCode: currencyCode,
            currentBalance: currentBalance,
            availableBalance: availableBalance,
            creditLimit: creditLimit,
            createdAt: createdAt,
            updatedAt: updatedAt,
            managementTypeRawValue: managementTypeRawValue,
            plaidItemId: plaidItemId,
            plaidAccountId: plaidAccountId,
            linkedAt: linkedAt,
            notes: notes,
            manualStartingBalance: manualStartingBalance,
            liabilityId: liabilityId,
            isLiabilityOverdue: isLiabilityOverdue,
            lastPaymentAmount: lastPaymentAmount,
            lastPaymentDate: lastPaymentDate,
            lastStatementBalance: lastStatementBalance,
            minimumPaymentAmount: minimumPaymentAmount,
            nextPaymentDueDate: nextPaymentDueDate,
            interestRatePercentage: interestRatePercentage,
            transactions: resolvedTransactions
        )
    }
}

// MARK: - Budget

public final class BudgetModel: Model, @unchecked Sendable {
    public static let schema = "budgets"

    enum FieldKeys {
        static let id: FieldKey = "id"
        static let name: FieldKey = "name"
        static let startDate: FieldKey = "start_date"
        static let currencyCode: FieldKey = "currency_code"
        static let updatedAt: FieldKey = "updated_at"
        static let ownerId: FieldKey = "owner_id"
    }

    @ID(custom: FieldKeys.id, generatedBy: .user)
    public var id: String?

    @Field(key: FieldKeys.name)
    public var name: String

    @Field(key: FieldKeys.startDate)
    public var startDate: Date

    @Field(key: FieldKeys.currencyCode)
    public var currencyCode: String

    @Field(key: FieldKeys.updatedAt)
    public var updatedAt: Date

    @OptionalParent(key: FieldKeys.ownerId)
    public var owner: UserDataModel?

    @Children(for: \.$budget)
    public var categories: [BudgetCategoryModel]

    @Children(for: \.$budget)
    public var months: [BudgetMonthModel]

    public init() { }

    public convenience init(from dto: BudgetDTO) {
        self.init()
        self.id = dto.id
        self.name = dto.name
        self.startDate = dto.startDate
        self.currencyCode = dto.currencyCode
        self.updatedAt = dto.updatedAt
        self.$owner.id = dto.owner?.id
    }

    public func toDTO(
        owner: UserDataDTO? = nil,
        categories: [BudgetCategoryDTO]? = nil,
        months: [BudgetMonthDTO]? = nil,
        includeCategories: Bool = true,
        includeMonths: Bool = true
    ) throws -> BudgetDTO {
        guard let id = self.id else {
            throw ModelConversionError.missingIdentifier(model: "BudgetModel")
        }

        let resolvedCategories: [BudgetCategoryDTO]?
        if let providedCategories = categories {
            resolvedCategories = providedCategories
        } else if includeCategories, let loadedCategories = self.$categories.value {
            resolvedCategories = try loadedCategories.map { try $0.toDTO(includeAssignments: false) }
        } else {
            resolvedCategories = nil
        }

        let resolvedMonths: [BudgetMonthDTO]?
        if let providedMonths = months {
            resolvedMonths = providedMonths
        } else if includeMonths, let loadedMonths = self.$months.value {
            resolvedMonths = try loadedMonths.map { try $0.toDTO(includeAssignments: false) }
        } else {
            resolvedMonths = nil
        }

        let resolvedOwner: UserDataDTO?
        if let owner {
            resolvedOwner = owner
        } else if let loadedOwner = self.$owner.value, let ownerModel = loadedOwner {
            resolvedOwner = try ownerModel.toDTO(includeBudgets: false)
        } else {
            resolvedOwner = nil
        }

        return BudgetDTO(
            id: id,
            name: name,
            startDate: startDate,
            currencyCode: currencyCode,
            owner: resolvedOwner,
            categories: resolvedCategories,
            months: resolvedMonths,
            updatedAt: updatedAt
        )
    }
}

// MARK: - Budget Category

public final class BudgetCategoryModel: Model, @unchecked Sendable {
    public static let schema = "budget_categories"

    enum FieldKeys {
        static let id: FieldKey = "id"
        static let name: FieldKey = "name"
        static let kindRawValue: FieldKey = "kind_raw_value"
        static let budgetId: FieldKey = "budget_id"
    }

    @ID(custom: FieldKeys.id, generatedBy: .user)
    public var id: String?

    @Field(key: FieldKeys.name)
    public var name: String

    @Field(key: FieldKeys.kindRawValue)
    public var kindRawValue: String

    @OptionalParent(key: FieldKeys.budgetId)
    public var budget: BudgetModel?

    @Children(for: \.$category)
    public var assignments: [BudgetTransactionAssignmentModel]

    public init() { }

    public convenience init(from dto: BudgetCategoryDTO) {
        self.init()
        self.id = dto.id
        self.name = dto.name
        self.kindRawValue = dto.kindRawValue
        self.$budget.id = dto.budget?.id
    }

    public func toDTO(
        budget: BudgetDTO? = nil,
        assignments: [BudgetTransactionAssignmentsDTO]? = nil,
        includeAssignments: Bool = true
    ) throws -> BudgetCategoryDTO {
        guard let id = self.id else {
            throw ModelConversionError.missingIdentifier(model: "BudgetCategoryModel")
        }

        let resolvedAssignments: [BudgetTransactionAssignmentsDTO]?
        if let providedAssignments = assignments {
            resolvedAssignments = providedAssignments
        } else if includeAssignments, let loadedAssignments = self.$assignments.value {
            resolvedAssignments = try loadedAssignments.map { try $0.toDTO(category: nil, month: nil) }
        } else {
            resolvedAssignments = nil
        }

        let resolvedBudget: BudgetDTO?
        if let budget {
            resolvedBudget = budget
        } else if let loadedBudget = self.$budget.value, let budgetModel = loadedBudget {
            resolvedBudget = try budgetModel.toDTO(includeCategories: false, includeMonths: false)
        } else {
            resolvedBudget = nil
        }

        return BudgetCategoryDTO(
            id: id,
            name: name,
            kindRawValue: kindRawValue,
            budget: resolvedBudget,
            assignments: resolvedAssignments
        )
    }
}

// MARK: - Budget Month

public final class BudgetMonthModel: Model, @unchecked Sendable {
    public static let schema = "budget_months"

    enum FieldKeys {
        static let id: FieldKey = "id"
        static let monthStart: FieldKey = "month_start"
        static let updatedAt: FieldKey = "updated_at"
        static let budgetId: FieldKey = "budget_id"
    }

    @ID(custom: FieldKeys.id, generatedBy: .user)
    public var id: String?

    @Field(key: FieldKeys.monthStart)
    public var monthStart: Date

    @Field(key: FieldKeys.updatedAt)
    public var updatedAt: Date

    @OptionalParent(key: FieldKeys.budgetId)
    public var budget: BudgetModel?

    @Children(for: \.$month)
    public var assignments: [BudgetTransactionAssignmentModel]

    public init() { }

    public convenience init(from dto: BudgetMonthDTO) {
        self.init()
        self.id = dto.id
        self.monthStart = dto.monthStart
        self.updatedAt = dto.updatedAt
        self.$budget.id = dto.budget?.id
    }

    public func toDTO(
        budget: BudgetDTO? = nil,
        assignments: [BudgetTransactionAssignmentsDTO]? = nil,
        includeAssignments: Bool = true
    ) throws -> BudgetMonthDTO {
        guard let id = self.id else {
            throw ModelConversionError.missingIdentifier(model: "BudgetMonthModel")
        }

        let resolvedAssignments: [BudgetTransactionAssignmentsDTO]?
        if let providedAssignments = assignments {
            resolvedAssignments = providedAssignments
        } else if includeAssignments, let loadedAssignments = self.$assignments.value {
            resolvedAssignments = try loadedAssignments.map { try $0.toDTO(month: nil) }
        } else {
            resolvedAssignments = nil
        }

        let resolvedBudget: BudgetDTO?
        if let budget {
            resolvedBudget = budget
        } else if let loadedBudget = self.$budget.value, let budgetModel = loadedBudget {
            resolvedBudget = try budgetModel.toDTO(includeCategories: false, includeMonths: false)
        } else {
            resolvedBudget = nil
        }

        return BudgetMonthDTO(
            id: id,
            monthStart: monthStart,
            updatedAt: updatedAt,
            budget: resolvedBudget,
            assignments: resolvedAssignments
        )
    }
}

// MARK: - Budget Transaction Assignment

public final class BudgetTransactionAssignmentModel: Model, @unchecked Sendable {
    public static let schema = "budget_transaction_assignments"

    enum FieldKeys {
        static let id: FieldKey = "id"
        static let transactionId: FieldKey = "transaction_id"
        static let categoryId: FieldKey = "category_id"
        static let monthId: FieldKey = "month_id"
        static let assignedAmount: FieldKey = "assigned_amount"
    }

    @ID(custom: FieldKeys.id, generatedBy: .user)
    public var id: String?

    @OptionalParent(key: FieldKeys.transactionId)
    public var transaction: TransactionModel?

    @Parent(key: FieldKeys.categoryId)
    public var category: BudgetCategoryModel

    @Parent(key: FieldKeys.monthId)
    public var month: BudgetMonthModel

    @Field(key: FieldKeys.assignedAmount)
    public var assignedAmount: Double

    public init() { }

    public convenience init(from dto: BudgetTransactionAssignmentsDTO) {
        self.init()
        self.id = dto.id
        self.$transaction.id = dto.transaction?.id
        self.$category.id = dto.category.id
        self.$month.id = dto.month.id
        self.assignedAmount = dto.assignedAmount
    }

    public func toDTO(
        transaction: TransactionDTO? = nil,
        category: BudgetCategoryDTO? = nil,
        month: BudgetMonthDTO? = nil
    ) throws -> BudgetTransactionAssignmentsDTO {
        guard let id = self.id else {
            throw ModelConversionError.missingIdentifier(model: "BudgetTransactionAssignmentModel")
        }

        let transactionDTO: TransactionDTO?
        if let transaction {
            transactionDTO = transaction
        } else if let loadedTransaction = self.$transaction.value, let transactionModel = loadedTransaction {
            transactionDTO = try transactionModel.toDTO(includeAssignments: false)
        } else {
            transactionDTO = nil
        }

        let categoryDTO: BudgetCategoryDTO?
        if let category {
            categoryDTO = category
        } else if let loadedCategory = self.$category.value {
            categoryDTO = try loadedCategory.toDTO(includeAssignments: false)
        } else {
            categoryDTO = nil
        }

        let monthDTO: BudgetMonthDTO?
        if let month {
            monthDTO = month
        } else if let loadedMonth = self.$month.value {
            monthDTO = try loadedMonth.toDTO(includeAssignments: false)
        } else {
            monthDTO = nil
        }

        guard let resolvedCategory = categoryDTO, let resolvedMonth = monthDTO else {
            throw ModelConversionError.missingIdentifier(model: "BudgetTransactionAssignmentModel.Relationships")
        }

        return BudgetTransactionAssignmentsDTO(
            id: id,
            transaction: transactionDTO,
            category: resolvedCategory,
            month: resolvedMonth,
            assignedAmount: assignedAmount
        )
    }
}

// MARK: - User Data

public final class UserDataModel: Model, @unchecked Sendable {
    public static let schema = "users"

    enum FieldKeys {
        static let id: FieldKey = "id"
        static let userName: FieldKey = "user_name"
        static let email: FieldKey = "email"
        static let basePayStoredAmount: FieldKey = "base_pay_stored_amount"
        static let basePayTypeRawValue: FieldKey = "base_pay_type_raw_value"
        static let basePayCurrencyCode: FieldKey = "base_pay_currency_code"
        static let activeBudgetId: FieldKey = "active_budget_id"
    }

    @ID(custom: FieldKeys.id, generatedBy: .user)
    public var id: String?

    @OptionalField(key: FieldKeys.userName)
    public var userName: String?

    @OptionalField(key: FieldKeys.email)
    public var email: String?

    @OptionalField(key: FieldKeys.basePayStoredAmount)
    public var basePayStoredAmount: Double?

    @OptionalField(key: FieldKeys.basePayTypeRawValue)
    public var basePayTypeRawValue: String?

    @OptionalField(key: FieldKeys.basePayCurrencyCode)
    public var basePayCurrencyCode: String?

    @OptionalField(key: FieldKeys.activeBudgetId)
    public var activeBudgetId: String?

    @Children(for: \.$owner)
    public var budgets: [BudgetModel]

    public init() { }

    public convenience init(from dto: UserDataDTO) {
        self.init()
        self.id = dto.id
        self.userName = dto.userName
        self.email = dto.email
        self.basePayStoredAmount = dto.basePayStoredAmount
        self.basePayTypeRawValue = dto.basePayTypeRawValue
        self.basePayCurrencyCode = dto.basePayCurrencyCode
        self.activeBudgetId = dto.activeBudgetId
    }

    public func toDTO(
        budgets: [BudgetDTO]? = nil,
        includeBudgets: Bool = true
    ) throws -> UserDataDTO {
        guard let id = self.id else {
            throw ModelConversionError.missingIdentifier(model: "UserDataModel")
        }

        let resolvedBudgets: [BudgetDTO]?
        if let providedBudgets = budgets {
            resolvedBudgets = providedBudgets
        } else if includeBudgets, let loadedBudgets = self.$budgets.value {
            resolvedBudgets = try loadedBudgets.map { try $0.toDTO(includeCategories: false, includeMonths: false) }
        } else {
            resolvedBudgets = nil
        }

        return UserDataDTO(
            id: id,
            userName: userName,
            email: email,
            basePayStoredAmount: basePayStoredAmount,
            basePayTypeRawValue: basePayTypeRawValue,
            basePayCurrencyCode: basePayCurrencyCode,
            budgets: resolvedBudgets,
            activeBudgetId: activeBudgetId
        )
    }
}
#endif

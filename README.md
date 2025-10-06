# ZeroBoundSharedModels

A Swift package providing shared data models and DTOs for the ZeroBound financial platform.

## Overview

ZeroBoundSharedModels contains the core data structures used across ZeroBound applications, including transaction models, account management types, and other shared entities. This package ensures consistency and type safety across different components of the ZeroBound ecosystem.

## Features

- **Transaction Models**: Comprehensive DTOs for financial transactions
- **Account Management**: Enums for different account types (linked vs manual)
- **Type Safety**: All models are strongly typed with Swift's type system
- **Codable Support**: Full JSON encoding/decoding support
- **SwiftUI Integration**: Models conform to `Identifiable` for seamless SwiftUI usage

## Requirements

- Swift 6.1 or later
- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+

## Installation

### Swift Package Manager

Add this package to your project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/ZeroBoundSharedModels.git", from: "1.0.0")
]
```

Then add it to your target dependencies:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["ZeroBoundSharedModels"]
    )
]
```

## Usage

### Importing the Package

```swift
import ZeroBoundSharedModels
```

### Working with Transaction Models

```swift
// Create a transaction DTO
let transaction = TransactionDTO(
    id: "txn_123",
    externalId: "ext_456",
    name: "Coffee Shop Purchase",
    amount: -4.99,
    currencyCode: "USD",
    date: Date(),
    postedDate: Date(),
    authorizedDate: nil,
    merchantName: "Local Coffee Shop",
    category: "Food & Drink",
    memo: "Morning coffee",
    isPending: false,
    isTransfer: false,
    sourceRawValue: TransactionSource.linked.rawValue,
    createdAt: Date(),
    updatedAt: Date()
)
```

### Using Transaction Sources

```swift
// Work with transaction sources
let linkedSource = TransactionSource.linked
let manualSource = TransactionSource.manual

// Iterate through all sources
for source in TransactionSource.allCases {
    print("Source: \(source.rawValue)")
}
```

### Account Management Types

```swift
// Define account management types
let linkedAccount = AccountManagementType.linked
let manualAccount = AccountManagementType.manual

// Use in SwiftUI (thanks to Identifiable conformance)
ForEach(AccountManagementType.allCases) { type in
    Text(type.rawValue.capitalized)
}
```

## Models

### TransactionDTO

A comprehensive model representing financial transactions with the following properties:

- `id`: Unique transaction identifier
- `externalId`: External system identifier (optional)
- `name`: Transaction description
- `amount`: Transaction amount (negative for debits, positive for credits)
- `currencyCode`: ISO currency code
- `date`: Transaction date
- `postedDate`: Date when transaction was posted (optional)
- `authorizedDate`: Date when transaction was authorized (optional)
- `merchantName`: Name of the merchant (optional)
- `category`: Transaction category (optional)
- `memo`: Additional notes (optional)
- `isPending`: Whether the transaction is still pending
- `isTransfer`: Whether this is a transfer transaction
- `sourceRawValue`: Source of the transaction data
- `createdAt`: Record creation timestamp
- `updatedAt`: Record last update timestamp

### TransactionSource

Enum defining the source of transaction data:
- `.linked`: Transactions from external providers (e.g., Plaid)
- `.manual`: User-entered transactions

### AccountManagementType

Enum defining how accounts are managed:
- `.linked`: Automatically synced accounts
- `.manual`: User-maintained accounts

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License


## Support

For questions or issues, please open an issue on the GitHub repository.
# Fungible-Token-Project

This repository hosts a Flow blockchain project that incorporates a custom Fungible Token contract along with associated transactions and scripts. The project is structured into multiple segments, each addressing specific facets of token management and interactions.

## Part 1

### Contract

The custom Fungible Token contract is implemented in the `FlowToken` contract. It includes the following key features:

- Minting functionality controlled by the contract owner.
- Vault resource for storing token balances.
- Various transactions and scripts to manage tokens.

### Code Walk-Through

Within the `Vault` resource, the `deposit` function resets the balance of an incoming vault before its destruction. This safeguards against double counting and ensures a seamless transfer of tokens to the new vault, preventing any loss during the transition.

## Part 2

### Transactions

- **MINT:** Mints tokens to a recipient.
- **SETUP:** Sets up a vault inside a user's account storage.
- **TRANSFER:** Allows a user to transfer tokens to a different address.

### Scripts

- **READ BALANCE:** Retrieves the balance of a user's vault.
- **SETUP CORRECTLY?:** Verifies if a user's vault is correctly set up.
- **TOTAL SUPPLY:** Displays the total supply of tokens in existence.

## Part 3

### Transactions and Scripts Modification

Adjustments to existing transactions and scripts include:

- **SETUP**: Identifying and rectifying poorly set up vaults.
- **READ BALANCE**: Works with poorly set up vaults temporarily to ensure balance retrieval, utilizing resource identifiers and capabilities for validation.

## Part 4

### Contract Modification

The `Admin` is granted the ability to withdraw tokens from a user's vault and deposit equivalent $FLOW tokens.

### Transactions

- **Admin Withdraw and Deposit:** Allows the Admin to withdraw tokens and deposit $FLOW tokens.

## Part 5

### Scripts

- **Balance Summary:** Returns the balance of the user's $FLOW vault and custom vault.
- **Vault Overview:** Returns information about all official Fungible Token vaults in the user's account storage.

## Part 6

### Swap Contract

The `Swap` contract facilitates users in depositing $FLOW tokens to receive custom tokens in return. The received amount is determined based on the time elapsed since their last swap.

## Conclusion

This Flow Token project showcases how we've created a customized Fungible Token contract with various features. In the repository, you'll find clear contracts, transactions, and scripts for handling tokens, setting up vaults, transferring tokens, and swapping tokens. We've organized the project into different sections to make it easier to understand and manage.

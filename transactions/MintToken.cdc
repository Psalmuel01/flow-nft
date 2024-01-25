import FungibleToken from 0x01
import SamuelToken from 0x01

transaction (receiver: Address, amount: UFix64) {

    prepare (signer: AuthAccount) {
        // Borrow the SamuelToken admin reference
        let minter = signer.borrow<&SamuelToken.Admin>(from: SamuelToken.AdminStorage)
        ?? panic("You are not the SamuelToken admin")

        // Borrow the receiver's SamuelToken Vault capability
        let receiverVault = getAccount(receiver)
            .getCapability<&SamuelToken.Vault{FungibleToken.Receiver}>(/public/Vault)
            .borrow()
        ?? panic("Error: Check your SamuelToken Vault status")
    }

    execute {
        // Mint SamuelTokens using the admin minter reference
        let mintedTokens <- minter.mint(amount: amount)

        // Deposit minted tokens into the receiver's SamuelToken Vault
        receiverVault.deposit(from: <-mintedTokens)

        log("Minted and deposited Samuel tokens successfully")
        log(amount.toString().concat(" Tokens minted and deposited"))
    }
}

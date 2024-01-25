import FungibleToken from 0x01
import SamuelToken from 0x01

transaction(receiverAccount: Address, amount: UFix64) {

    // Define references
    let signerVault: &SamuelToken.Vault
    let receiverVault: &SamuelToken.Vault{FungibleToken.Receiver}

    prepare(acct: AuthAccount) {
        // Borrow references and handle errors
        self.signerVault = acct.borrow<&SamuelToken.Vault>(from: /storage/VaultStorage)
            ?? panic("Vault not found in senderAccount")

        self.receiverVault = getAccount(receiverAccount)
            .getCapability(/public/Vault)
            .borrow<&SamuelToken.Vault{FungibleToken.Receiver}>()
            ?? panic("Vault not found in receiverAccount")
    }

    execute {
        // Withdraw tokens from signer's vault and deposit into receiver's vault
        self.receiverVault.deposit(from: <-self.signerVault.withdraw(amount: amount))
        log("Tokens transferred")
    }
}

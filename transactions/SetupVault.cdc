import FungibleToken from 0x01
import SamuelToken from 0x01

transaction() {

    // Define references
    let userVault: &SamuelToken.Vault{FungibleToken.Balance, FungibleToken.Provider, FungibleToken.Receiver, SamuelToken.CollectionPublic}?
    let account: AuthAccount

    prepare(acct: AuthAccount) {

        // Borrow vault capability and set account reference
        self.userVault = acct.getCapability(/public/Vault)
            .borrow<&SamuelToken.Vault{FungibleToken.Balance, FungibleToken.Provider, FungibleToken.Receiver, SamuelToken.CollectionPublic}>()

        self.account = acct
    }

    execute {
        if self.userVault == nil {
            // Create and link an empty vault if none exists
            let emptyVault <- SamuelToken.createEmptyVault()
            self.account.save(<-emptyVault, to: /storage/VaultStorage)
            self.account.link<&SamuelToken.Vault{FungibleToken.Balance, FungibleToken.Provider, FungibleToken.Receiver, SamuelToken.CollectionPublic}>(/public/Vault, target: /storage/VaultStorage)
            log("Empty vault created and linked")
        } else {
            log("Vault already exists and is properly linked")
        }
    }
}

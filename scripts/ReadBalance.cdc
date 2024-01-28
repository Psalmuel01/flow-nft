import FungibleToken from 0x01
import SamuelToken from 0x01

pub fun main(account: Address) {

    // Attempt to borrow PublicVault capability
    let publicVault: &SamuelToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, SamuelToken.CollectionPublic}? =
        getAccount(account).getCapability(/public/Vault)
            .borrow<&SamuelToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, SamuelToken.CollectionPublic}>()

    if (publicVault == nil) {
        // Create and link an empty vault if capability is not present
        let newVault <- SamuelToken.createEmptyVault()
        getAuthAccount(account).save(<-newVault, to: /storage/VaultStorage)
        getAuthAccount(account).link<&SamuelToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, SamuelToken.CollectionPublic}>(
            /public/Vault,
            target: /storage/VaultStorage
        )
        log("Empty vault created")
        
        // Borrow the vault capability again to display its balance
        let retrievedVault: &SamuelToken.Vault{FungibleToken.Balance}? =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&SamuelToken.Vault{FungibleToken.Balance}>()
        log(retrievedVault?.balance)
    } else {
        log("Vault already exists and is properly linked")
        
        // Borrow the vault capability for further checks
        let checkVault: &SamuelToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, SamuelToken.CollectionPublic} =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&SamuelToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, SamuelToken.CollectionPublic}>()
                ?? panic("Vault capability not found")
        
        // Check if the vault's UUID is in the list of vaults
        if SamuelToken.vaults.contains(checkVault.uuid) {
            log(publicVault?.balance)
            log("This is a SamuelToken vault")
        } else {
            log("This is not a SamuelToken vault")
        }
    }
}

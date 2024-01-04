import CryptoPoops from 0x05
import NonFungibleToken from 0x05

transaction(recipient: Address) {

  // Let's assume the `signer` was the one who deployed the contract, since only they have the `Minter` resource
  prepare(signer: AuthAccount) {
    // Get a reference to the `Minter`
    let minter = signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)
                    ?? panic("This signer is not the one who deployed the contract.")

    // Get a reference to the `recipient`s public Collection
    let recipientsCollection = getAccount(recipient).getCapability(/public/MyCollection)
                                  .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>
                                  ?? panic("The recipient does not have a Collection.")


    // mint the NFT using the reference to the `Minter`
    let nft <- minter.createNFT()

    // deposit the NFT in the recipient's Collection
    recipientsCollection.deposit(token: <- nft)
  }

}

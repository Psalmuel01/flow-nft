import CryptoPoops from 0x05
import NonFungibleToken from 0x05

pub fun main(address: Address, id: UInt64) {
  let publicCollection = getAccount(address).getCapability(/public/MyCollection)
              .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
              ?? panic("The address does not have a Collection.")
  
  let nftRef: &NonFungibleToken.NFT = publicCollection.borrowNFT(id: id)
  
  log(nftRef.name)
  log(nftRef.favouriteFood)
  log(nftRef.luckyNumber)
}

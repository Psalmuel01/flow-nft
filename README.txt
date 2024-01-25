Final Challenge
Complete each part of the final challenge. Then submit your final project with a code-walkthrough video to be graded by our team. Think of each part as a checkpoint. Don’t be afraid to ask for help in Discord.

Part 1
a) Write your own Fungible Token contract that implements the FungibleToken standard on Flow. Name the contract whatever you want. Note: It is okay to find an example implementation online, but be careful. That implementation may over-complicate the solution.

b) Inside the contract, define a resource that handles minting. Make it so that only the contract owner can mint tokens.

c) You will find that inside your deposit function inside the Vault resource you have to set the incoming vault's balance to 0.0 before destroying it. Explain why in your code walk-through video.

Part 2
a) Write the following transactions:

MINT: Mint tokens to a recipient.
SETUP: Properly sets up a vault inside a user's account storage.
TRANSFER: Allows a user to transfer tokens to a different address.
b) Write the following scripts:

READ BALANCE: Reads the balance of a user's vault.
SETUP CORRECTLY?: Returns true if the user's vault is set up correctly and false if it's not.
TOTAL SUPPLY: Returns the total supply of tokens in existence.
Part 3
Modify your transactions/scripts from Part 2 as such:

SETUP: Ensure that this transaction identifies if the user's vault is already set up poorly, and subsequently fix it if so. If it's not already set up, then simply set it up.
READ BALANCE: Ensure that your script work with vaults that are not set up correctly, and subsequently (temporarily) fix them so that it will always return a balance without fail.
Make sure that the balance returned is from a vault guaranteed to be your token's type and not some random vault that implements the FungibleToken interface.

Using comments in the script, explain two ways you can guarantee that the above requirement is true. One method must be using resource identifiers.

Part 4
a) Modify your token contract so that the Admin is allowed to withdraw tokens from a user's Vault at any time. Then in the same function, deposit them an equivalent amount of $FLOW tokens.

HINT: This will require more than simply adding a function.

b) Write a transaction (that is only signed by the Admin) that executes section a).

Part 5
a) Write a script that returns the balance of the user's $FLOW vault and your custom vault. Make it organized so the client can easily read it.

b) Write a script that neatly returns (at a minimum) the resource identifier and balance of all the (official) Fungible Token vaults that the user has in their account storage. You can be creative in whatever other information you want to return.

Part 6
a) Write a second contract, Swap, that allows users to deposit $FLOW and receive your custom token in return. The amount of tokens the user should get in return is 2*(THE TIME SINCE THEY LAST SWAPPED).

b) In the swapping function, make sure to prove who the person is that is attempting a swap. In other words, make sure someone can't swap for you. You must implement this function in two ways:

Using a custom resource you define to represent identity and passing in a @FlowToken.Vault as an argument for the payment. Using a reference to the user's Flow Token vault that proves only they could pass such a reference in, and subsequently getting the owner's address from that reference.

Part 7
a) Ensure all transactions are correctly architected, as seen in our course.

Conclusion
That's it, folks! Do a little happy dance and pat yourself on the back.

FLOW PROOF: Intermediate
Final Challenge Requirements
Assessment Requirements

Your project must provide the following to be successfully completed: Functionality

FungibleToken standard on Flow is correctly used
The Admin is allowed to withdraw tokens from a user's Vault at any time and deposit them an equivalent amount of $FLOW tokens
Your smart contract returns the balance of the user's $FLOW vault and your custom vault
Users should be able to deposit $FLOW and receive your custom token in return
All transactions are correctly architected
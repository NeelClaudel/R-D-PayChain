Variables:

owner: Stores the address of the contract owner (presumably the employer).
hasWithdrawn: Mapping to keep track of which employees have already withdrawn their Ethereum.
Modifiers:

onlyOwner: Ensures that only the owner can call certain functions.
canWithdrawOnce: Ensures that an employee can withdraw only once.
Functions:

deposit(): Allows the owner to deposit Ethereum into the contract.
setEmployeeAsWithdrawn(): Allows the owner to manually set an employee as having withdrawn (useful if there are manual adjustments or disputes).
withdraw(): Allows an employee to withdraw a specified amount of Ethereum, but only once.
checkBalance(): Allows anyone to check the balance of Ethereum in the vault.
Please note:

This is a basic contract for illustrative purposes only. Do not feet to production environment.
Gas costs and optimizations have not been considered in this sample.
The withdrawal function lets the employee decide the amount, but you could modify it to set specific amounts if necessary.

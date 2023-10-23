// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
    address public owner;
    mapping(address => bool) public hasWithdrawn;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier canWithdrawOnce(address _employee) {
        require(!hasWithdrawn[_employee], "Employee has already withdrawn");
        _;
    }

    function deposit() external payable onlyOwner {
        // The owner can deposit Ethereum into the contract
    }

    function setEmployeeAsWithdrawn(address _employee) external onlyOwner {
        // The owner can set an employee as having withdrawn (useful in case of manual adjustments)
        hasWithdrawn[_employee] = true;
    }

    function withdraw(uint256 _amount) external canWithdrawOnce(msg.sender) {
        require(
            address(this).balance >= _amount,
            "Insufficient funds in the vault"
        );

        // Mark the employee as having withdrawn
        hasWithdrawn[msg.sender] = true;

        // Transfer the specified amount of Ethereum to the employee
        payable(msg.sender).transfer(_amount);
    }

    function checkBalance() external view returns (uint256) {
        return address(this).balance;
    }
}

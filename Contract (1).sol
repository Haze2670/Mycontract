// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract HandlingContract {
    uint public contractBalance;
    address public contractOwner;

    constructor() {
        contractOwner = msg.sender;
    }

    modifier onlyOwner() {
        require(contractOwner == msg.sender, "Unauthorized");
        _;
    }

    function depositFunds() public payable onlyOwner {
        contractBalance += msg.value;
    }

    function withdrawFunds(uint amount) public onlyOwner {
        require(contractBalance >= amount, "Insufficient balance");
        contractBalance -= amount;
        payable(contractOwner).transfer(amount);
    }
}
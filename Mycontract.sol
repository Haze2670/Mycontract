// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract PCopenContract {
    address public owner;
    bool public PCopen;

    constructor() {
        owner = msg.sender;  
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    function openPC() public onlyOwner {
        require(!PCopen, "PC is already on.");
        PCopen = true;
    }

    function closePC() public onlyOwner {
        require(PCopen, "PC is already off.");
        PCopen = false;
    }

    function checkPCStatus() public view returns (bool) {
        return PCopen;
    }

    function assertPC() public view onlyOwner {
        assert(!PCopen);
    }

    function revertPC() public onlyOwner {
        if (PCopen) {
            PCopen = false;
            revert("PC was on. Automatically powered off.");
        }
    }
}

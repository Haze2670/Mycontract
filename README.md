*MyContract*
This Solidity contract, named ErrorHandlingContract, contains methods for setting a value and performing division with basic error handling to ensure correct input and behavior. It uses checks to make sure the input values meet specific conditions before proceeding with operations. 
If an input doesn't meet the condition, the contract prevents further execution and provides an error message explaining the issue.

*Description*
This Solidity contract, HandlingContract, allows the owner to deposit and withdraw funds, ensuring that only the contract owner can perform these actions through the onlyOwner modifier. The contract maintains a balance that can be adjusted with deposits and withdrawals by the owner.

Getting Started
Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

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

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "HelloWorld" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the sayHello function. Click on the "HelloWorld" contract in the left-hand sidebar, and then click on the "sayHello" function. Finally, click on the "transact" button to execute the function and retrieve the "Hello World!" message.



*Authors*
Raymark G. Tomas

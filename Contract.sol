//Smart Contract Project
//For this project, write a smart contract that implements the require(), assert() and revert() statements.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract HandlingContract {
    uint public value;

    function setValue(uint _value) public {
        //aquire
        require(_value > 0, "Value must be greater than 0.");
        //assert
        require(_value != value, "New value must be different from the current value.");

        value = _value;
    }

    function performDivision(uint _numerator, uint _denominator) public pure returns (uint) {
        require(_denominator != 0, "Cannot divide by zero.");
        //revert
        require(_numerator % _denominator == 0, "Numerator must be divisible by denominator.");

        return _numerator / _denominator;
    }
}
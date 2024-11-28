// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FundMe {

    uint256 public minimumUsd = 50;

    function fund() public payable{ 
        
        //number = 5;
        require(msg.value >= minimumUsd, "not enough eth");
    } 

    function getPrice() public{

    }

    function getConversionRate() public {
        // ABI
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306

        
    }

    //function withdraw() { }
}
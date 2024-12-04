// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18;

    address public owner;

    constructor () {
        owner = msg.sender;
    }

    modifier OnlyOwner() {
        require(msg.sender == owner);
        _;
    }

    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;

    function fund() public payable{ 
        require(msg.value.getConversionRate() >= minimumUsd, "not enough eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    } 

    function withdrawAll() public OnlyOwner {
        // require(msg.sender == owner, "Sender is not owner");
        address funder;
        for(uint i = 0; i < funders.length; i++){
            funder = funders[i];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);

        // //transfer ETH from function caller to THIS contract
        // payable(msg.sender).transfer(address(this).balance);

        // //send transfer ETH from function caller to THIS contract
        // bool sendSucess = payable(msg.sender).send(address(this).balance);
        // require(sendSucess, "Failed to send");

        //call -- lower level command
        (bool callsuccess, /*bytes memory dataReturned*/ ) =payable(msg.sender).call{value: address(this).balance}("");
        require(callsuccess, "Failed to call");

    }
} 
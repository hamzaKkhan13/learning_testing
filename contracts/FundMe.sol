// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./PriceConverter.sol";

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINUMUM_USD = 50 * 1e18;

    address public immutable i_owner;

    constructor () {
        i_owner = msg.sender;
    }

    modifier OnlyOwner() {
        // require(msg.sender == i_owner,"Caller not owner");
        if (msg.sender != i_owner) {
            revert NotOwner();
        }
        _;
    }

    modifier AmountIsGreater(uint256 _amount) {
        require (_amount >= i_owner.balance, "Cannot withdraw more than avbilable");
        _;
    }

    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;

    receive() external payable { 
        fund();
    }

    fallback() external payable { 
        fund();
    }

    function fund() public payable{ 

        require(msg.value.getConversionRate() >= MINUMUM_USD, "Not Enough Eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    } 

    //withdraw specific ammount
    function withdrawAmount(uint256 _amount) public OnlyOwner AmountIsGreater(_amount) {

        (bool callsuccess, /*bytes memory dataReturned*/ ) = payable (msg.sender).call{value: _amount}("");
        require (callsuccess, "Failed to call");
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

// inital gas --        830803 
// immutable gas --     792470
// single const gas --  781233 
//
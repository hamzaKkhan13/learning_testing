// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 50 * 1e18;

    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;

    function fund() public payable{ 
        require(getConversionRate(msg.value) >= minimumUsd, "not enough eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    } 

    function getPrice() public view returns (uint256) {
        // ABI
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        //gets price of ETH in USD
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 _ethAmount) view public returns (uint256) {
        uint256 ethPrice = getPrice();
        // uint256 ethAmountInUSD = (ethPrice * _ethAmount) / 1e18 
        return ((ethPrice * _ethAmount) / 1e18) ;
    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
   }

    //function withdraw() { }
}
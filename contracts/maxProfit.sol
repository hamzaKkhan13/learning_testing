// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MaxProfit {

    uint[] public list = [7, 1, 5, 3, 6, 4];
    
    function maxProfit() public view returns (uint256) {
        require(list.length > 0, "Array length can't be 0");
        uint256 profit = 0;

        // Loop through the prices array
        for (uint256 i = 1; i < list.length; i++) {
            // If the price on the next day is higher than the current day, buy and sell
            if (list[i] > list[i - 1]) {
                profit += list[i] - list[i - 1];
            }
        }

        return profit;
    }
    
}
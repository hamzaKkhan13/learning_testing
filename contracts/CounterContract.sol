// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter{
    uint public count;

    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }
}

contract SimpleOperations {
    
    function calculateAverage(uint256 a, uint256 b) public pure returns (uint256){
        return (a+b)/2;
    }

}
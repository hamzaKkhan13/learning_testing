// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract revertCheck{

    // uint256 public sum;

    function rev(uint256 _num1, uint256 _num2) pure public returns (string memory, uint) {
        uint sum = _num1 + _num2;
        if(sum < 0 || sum > 255){
            revert("Overflow Exists");
        }
        return ("No overflow", sum);
    }
}
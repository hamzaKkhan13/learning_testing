// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MaxNumberContract {

    string public str;

    constructor(){
        str = "asd";
    }

    function getStr() public view returns (string memory){
        return str;
    }

    function reverseDigit(uint256 n) public pure returns (uint256){
        uint256 j = ;

                 while (num > 0) { 
                j = j  * 10 + n % 10; 
                n = n / 10; 
            } 

        }
        return j;
    }


    /*function findMaxNumber(uint256[] memory numbers) external pure returns (uint256) {
        
        require(numbers.length > 0, "Array cannot be empty");

            uint256 maxNumber = numbers[0]; // Assume the first element is the max initially

            // Loop through the array to compare each number
            for (uint256 i = 1; i < numbers.length; i++) {
                if (numbers[i] > maxNumber) {
                    maxNumber = numbers[i]; // Update maxNumber if a larger number is found
                }
            }
    }     
    */               
}

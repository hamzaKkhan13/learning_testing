// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Require{

    bool result;
    
    function checkInput(uint256 _input) public pure returns(string memory){
        
        // 715 -- Gas
        require(_input >= 0, "invalid uint");
        require(_input <= 255, "invalid uint");

        // 930 -- Gas
        // if(_input < 0 || _input > 255){
        //     return "Input Invalid";
        // }

        return "Input is uint";
    }

    function checkOdd(uint256 _input) public pure returns (bool){

        require(_input %2 != 0);
        return true;
    }

    function assertStatement(uint _num1, uint _num2) public{
        uint sum = _num1 + _num2;
        assert(sum < 255);
        result = true;
    }

    function checkResult() public view returns (string memory) {

        if(result == true){
            return "No overflow";
        }

        return "Overflow";
    }

}
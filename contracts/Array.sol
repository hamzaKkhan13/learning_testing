// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Array{

    uint[] public arr1;
    uint[] public arr2 = [1,2,3];
    uint[10] public fixArr;

    function get1(uint _i) public view returns (uint){
        return arr1[_i];
    }
    function get2(uint _i) public view returns (uint){
        return arr2[_i];
    }
    function get3(uint _i) public view returns (uint){
        return fixArr[_i];
    }
}

contract removeByShifting {

    uint[] public arr;

    mapping(uint => uint) public checkIndex;

    function removeByIndex(uint _index) public {
        require(_index < arr.length || _index > 0, "Index Invalid" );

        for (uint i = _index; i < arr.length - 1; i++){
            arr[i] = arr[i+1];
        }
        arr.pop();
    }

    function test() external {

        arr = [1,2,3,4,5];
        removeByIndex(2);

        assert (arr.length == 4);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);

    }

    function add(uint256 _i) public {
        arr.push(_i);
    }

    function getArr() public view returns (uint256 [] memory){
        // _arr = arr;
        return arr;
    }

    // function checkIndex(uint _index) public view returns (uint){
    //     return checkIndex;
    // }

    function removeFromEnd(uint _index) public {
        require(_index > arr.length, "Index invalid");
        arr[_index] = arr[arr.length -1];
    }
}
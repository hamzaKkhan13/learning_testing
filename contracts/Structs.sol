// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


struct Todo{
        string name;
        bool completed;
}

contract StructData{
    

    Todo[] public itemList;

    //Pushes a new item on the array of 'Todo'
    function addTodo (string memory _name) public {
        
        // Push Initalize
        itemList.push(Todo(_name, false));

        // //Key Value Initalize
        // itemList.push(Todo({name: _name, completed: false}));

        // // Empty new temp Initalize
        // Todo memory temp;

        // temp.name = _name;
        // temp.completed = false;

        // itemList.push(temp);
    }

    // Returns Todo at the given index
    function getTodo(uint _index) public view returns (string memory _name, bool _completed){
        Todo memory temp = itemList[_index];
        return (temp.name, temp.completed);
    }


    // Sets a new string at the given index
    function setAtIndex(string memory _name, uint _index) public view{
        Todo memory temp = itemList[_index];
        temp.name = _name;
    }

    // Toggles the completed function at given index
    function toogleCompleted(uint _index) public view{
        Todo memory temp = itemList[_index];
        temp.completed != temp.completed;
    }
    
}
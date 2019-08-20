pragma solidity ^0.5.0;

contract Owned {
  address public creator;  
  
  constructor() internal {
        creator = msg.sender;
    }
  
  modifier onlyOwner() {
        require(msg.sender == creator);
        _;
    }  
}

contract Instructor is Owned {
    string name;
    uint age;
    
    function setInstructor(string memory _name, uint _age) public onlyOwner {
        name = _name;
        age = _age;
    }
    
    function getInstructor() view public returns(string memory, uint) {
        return (name, age);
    }
} 
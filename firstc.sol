// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";
contract ownable{
address public owner;

constructor(){
   owner=msg.sender;
}
 modifier onlyOwner(){
    require(msg.sender == owner,"not owner");
    _;
 }
 function setOwner(address _newOwner) public onlyOwner{
     require(_newOwner != address(0),"invalid");
     owner = _newOwner;

 }
 function onlyAccessOwner() public onlyOwner{
    /// console.log("owner accessed",);
 }
  function anyOneAccess() public{
   ///  console.log("other user accessed");
 }


}
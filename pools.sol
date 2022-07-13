// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract pools{

    address public admin;
    address payable[] public players;

    constructor(){
        admin=msg.sender;
    }

    function alreadyEntered() view private  returns(bool){
        for(uint i=0;i<players.length;i++){
            if(players[i]==msg.sender)
            return true;
        }
        return false;

    }

    function entery() payable public{
        require(msg.sender != admin,"Admin cannot enter in this pool");
        require(alreadyEntered() == false,"Player already entered");
        require(msg.value >= 1 ether,"Minimum ammount must be entered");
        players.push(payable(msg.sender));
    }

    function random() view private returns(uint){
      return  uint(sha256(abi.encodePacked(block.difficulty,block.number,players)));
    }

    function selectWinner() public{
        require(msg.sender == admin,"Only admin pick the winner");
        uint index = random()%players.length;
        address contractAddress = address(this);
        players[index].transfer(contractAddress.balance);
        players = new address payable[](0);
    }

    function showPlayers() view public returns(address payable[] memory){
        return players;
    }
    


}
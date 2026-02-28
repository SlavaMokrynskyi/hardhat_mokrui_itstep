// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public owner;
    address[] public players;

    constructor() {
        owner = msg.sender;
    }

    function enter() public payable {
        require(msg.value == 2 ether, "Please pay 2 ETH to enter!");
        players.push(msg.sender);
    }

    // Випадковий переможець (тільки власник може викликати)
    function pickWinner() public {
        require(msg.sender == owner, "You are not the owner!");
        require(players.length > 0, "No players!");

        uint index = random() % players.length;
        address winner = players[index];

        // Відправити весь баланс переможцю
        payable(winner).transfer(address(this).balance);

        // Скинути гравців
        players = new address[](0);
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Проста функція рандому (не для продакшну!)
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, players)));
    }
}
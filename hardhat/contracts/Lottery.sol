// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    int256 public count;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function increment() public {
        count += 1;
    }

    function decrement() public {
        require(count > 0, "Count cannot be less than zero!");
        count -= 1;
    }

    function getCount() public view returns (int256) {
        return count;
    }

    function reset() public payable {
        require(msg.sender == owner, "You are not the owner!");
        require(msg.value == 2 ether, "Please pay 2 ETH for reset counter!");
        count = 0;
    }
}
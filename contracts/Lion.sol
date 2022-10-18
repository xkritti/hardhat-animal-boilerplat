// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./Animal.sol";

contract Lion is Animal {
    uint public timehunting;

    constructor(string memory name_) {
        energy = 10;
        name = name_;
        owner = msg.sender;
    }

    modifier isBusy() {
        require(timehunting < block.timestamp, "Hunting time !!");
        _;
    }

    function feedsome(uint _cal) public isBusy {
        energy += _cal;
    }

    function hunting() public isBusy {
        require(energy >= 10, "Energynot enough !!");
        energy += 100;
        timehunting += block.timestamp + 30 seconds;
    }
}

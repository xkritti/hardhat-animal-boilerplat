// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Animal {
    string public name;
    uint public energy;
    address public owner;

    modifier isOnwer() {
        require(owner == msg.sender, " You'r ont Onwer !!");
        _;
    }

    function eat(uint cal) public {
        energy += cal;
    }

    function drink() public {
        energy += 1;
    }

    function brunenergy() public {
        energy -= 10;
        if (energy < 0) {
            energy = 0;
        }
    }
}

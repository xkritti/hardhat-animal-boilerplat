// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./Animal.sol";

contract Cat is Animal {
    bool public sleep;
    uint public timesleep;

    constructor(string memory name_) {
        energy = 10;
        name = name_;
        owner = msg.sender;
        sleep = false;
        timesleep = 0;
    }

    event Wakeup(string name, bool sleep);

    modifier isSleep() {
        require(timesleep < block.timestamp, "Resting time !!");
        require(sleep != true, "The cat is resting !!");
        _;
    }

    function resting(uint _seconds) public {
        energy += _seconds;
        timesleep = block.timestamp + _seconds;
        sleep = true;
    }

    function catchrat() public isSleep {
        energy -= 10;
    }

    function wakeup() public isOnwer {
        sleep = false;
        emit Wakeup(name, sleep);
    }
}

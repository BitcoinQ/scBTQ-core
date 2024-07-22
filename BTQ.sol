// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

/// @custom:security-contact dev@bitcoinq.xyz
contract BitcoinQuantum is ERC20, ERC20Permit {
    constructor() ERC20("Bitcoin Quantum", "BTQ") ERC20Permit("Bitcoin Quantum") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
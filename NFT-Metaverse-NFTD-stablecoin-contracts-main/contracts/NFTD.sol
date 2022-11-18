// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract NFTDollar is ERC20, ERC20Burnable {
    address  payable public owner;
    address public minter;

    constructor() ERC20("NFT Dollar", "NFTD") {
        owner =payable(msg.sender);
        minter=msg.sender;
    }

        modifier onlyOwner {
        require(msg.sender==owner);
        _;
    }

            modifier onlyMinter {
        require(msg.sender==minter);
        _;
    }

    function mint(address to, uint256 amount, uint decimalsOfInput) external  {
        _mint(to, amount*10**(18-decimalsOfInput));      //accepts an additional decimals parameter so that tokens with decimals different than 18, could be used to properly mint NFTD (which is 18 decimals)
    }


    function transferOwnership (address payable newOwner) external onlyOwner {
        owner = newOwner;
    }

    function setMinter (address newMinter) external onlyOwner {
        minter = newMinter ;

    }

}
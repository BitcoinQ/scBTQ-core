// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BTQICO is Ownable {
    IERC20 public btqToken;
    IERC20 public usdtToken;
    uint256 public pricePerBTQ = 4 * 10 ** 6; // Assuming USDT has 6 decimals

    event TokenPurchase(address indexed buyer, string btqAddress, uint256 btqAmount);

    struct PurchaseInfo {
        address bscAddress;
        string btqAddress; // Store BTQ address as string
        uint256 btqAmount;
        uint256 usdtAmount;
    }

    mapping(address => PurchaseInfo) public purchaseRecords;
    address[] public buyers;
    uint256 public totalUSDT;

    constructor(address _btqTokenAddress, address _usdtTokenAddress, address initialOwner) Ownable(initialOwner) {
        btqToken = IERC20(_btqTokenAddress);
        usdtToken = IERC20(_usdtTokenAddress);
    }

    function setPriceBuyToken(uint256 _pricePerBTQ) external onlyOwner {
        pricePerBTQ = _pricePerBTQ;
    }

    function updateAddressBTQToken(address _btqTokenAddress) external onlyOwner {
        btqToken = IERC20(_btqTokenAddress);
    }

    function buyBTQ(uint256 _btqAmount, string memory _btqAddress) external {
        uint256 usdtAmount = _btqAmount * pricePerBTQ;

        require(usdtToken.transferFrom(msg.sender, address(this), usdtAmount), "USDT transfer failed");

        if (bytes(purchaseRecords[msg.sender].btqAddress).length == 0) {
            buyers.push(msg.sender);
        }

        purchaseRecords[msg.sender] = PurchaseInfo({
            bscAddress: msg.sender,
            btqAddress: _btqAddress,
            btqAmount: _btqAmount,
            usdtAmount: usdtAmount
        });

        totalUSDT += usdtAmount;

        emit TokenPurchase(msg.sender, _btqAddress, _btqAmount);
    }

    function getPurchaseInfo(address buyer) external view returns (address, string memory, uint256, uint256) {
        PurchaseInfo memory info = purchaseRecords[buyer];
        return (info.bscAddress, info.btqAddress, info.btqAmount, info.usdtAmount);
    }

    function getAllPurchaseInfo() external view returns (PurchaseInfo[] memory) {
        PurchaseInfo[] memory allInfo = new PurchaseInfo[](buyers.length);
        for (uint256 i = 0; i < buyers.length; i++) {
            allInfo[i] = purchaseRecords[buyers[i]];
        }
        return allInfo;
    }

    function getTotalBuyers() external view returns (uint256) {
        return buyers.length;
    }

    function getTotalUSDT() external view returns (uint256) {
        return totalUSDT;
    }

    function withdrawFunds(address _to, uint256 _amount) external onlyOwner {
        require(usdtToken.transfer(_to, _amount), "USDT withdrawal failed");
    }

    function withdrawBTQ(address _to, uint256 _amount) external onlyOwner {
        require(btqToken.transfer(_to, _amount), "BTQ withdrawal failed");
    }
}
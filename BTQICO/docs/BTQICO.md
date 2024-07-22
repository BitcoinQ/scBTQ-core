# Solidity API

## BTQICO

### Contract
BTQICO : contracts/BTQICO.sol

 --- 
### Functions:
### constructor

```solidity
constructor(address _btqTokenAddress, address _usdtTokenAddress, address initialOwner) public
```

### setPriceBuyToken

```solidity
function setPriceBuyToken(uint256 _pricePerBTQ) external
```

### updateAddressBTQToken

```solidity
function updateAddressBTQToken(address _btqTokenAddress) external
```

### buyBTQ

```solidity
function buyBTQ(uint256 _btqAmount, string _btqAddress) external
```

### getPurchaseInfo

```solidity
function getPurchaseInfo(address buyer) external view returns (address, string, uint256, uint256)
```

### getAllPurchaseInfo

```solidity
function getAllPurchaseInfo() external view returns (struct BTQICO.PurchaseInfo[])
```

### getTotalBuyers

```solidity
function getTotalBuyers() external view returns (uint256)
```

### getTotalUSDT

```solidity
function getTotalUSDT() external view returns (uint256)
```

### withdrawFunds

```solidity
function withdrawFunds(address _to, uint256 _amount) external
```

### withdrawBTQ

```solidity
function withdrawBTQ(address _to, uint256 _amount) external
```

inherits Ownable:
### owner

```solidity
function owner() public view virtual returns (address)
```

_Returns the address of the current owner._

### _checkOwner

```solidity
function _checkOwner() internal view virtual
```

_Throws if the sender is not the owner._

### renounceOwnership

```solidity
function renounceOwnership() public virtual
```

_Leaves the contract without owner. It will not be possible to call
`onlyOwner` functions. Can only be called by the current owner.

NOTE: Renouncing ownership will leave the contract without an owner,
thereby disabling any functionality that is only available to the owner._

### transferOwnership

```solidity
function transferOwnership(address newOwner) public virtual
```

_Transfers ownership of the contract to a new account (`newOwner`).
Can only be called by the current owner._

### _transferOwnership

```solidity
function _transferOwnership(address newOwner) internal virtual
```

_Transfers ownership of the contract to a new account (`newOwner`).
Internal function without access restriction._

 --- 
### Events:
### TokenPurchase

```solidity
event TokenPurchase(address buyer, string btqAddress, uint256 btqAmount)
```

inherits Ownable:
### OwnershipTransferred

```solidity
event OwnershipTransferred(address previousOwner, address newOwner)
```


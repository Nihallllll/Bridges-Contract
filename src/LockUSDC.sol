// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.28;

import {IERC20} from  "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract LockUSDC {
  address private usdcAddress;
  mapping(address => uint256) public balances;
  constructor(address _usdcAddress) {
    usdcAddress = _usdcAddress;
  }

  function deposite(address _from, uint256 _amount) public{
     require(IERC20(usdcAddress).allowance(msg.sender, address(this)) >= _amount, "Not enough allowance");
     IERC20(usdcAddress).transferFrom(_from, address(this), _amount);

  }
  function withdraw() public{    
   uint256 amount =balances[msg.sender];
   IERC20(usdcAddress).transfer(msg.sender, amount);
   balances[msg.sender] = 0;
  }

}
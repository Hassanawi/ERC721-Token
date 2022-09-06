// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


/* IEC Contract mints the IEC nft tokens when the public sale is active
 * @notice public sale can only be activated and deactivated by owner of funtion
 * Any one can mint the token when public sale is active
 */

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract IEC is ERC721, Ownable {

    /* @notice publicSale stores bool to check whether the public sale is active or not
     */

    bool public publicSale;

    constructor() ERC721("IEC", "iec") {}

    /* @dev activatePublicSale activates the public sale
     * @dev activatePublicSale can only be accessed by owner of contract
     */
    function activatePublicSale() public onlyOwner {
        publicSale = true;
    }

    /* @dev deactivatePublicSale activates the public sale
     * @dev deactivatePublicSale can only be accessed by owner of contract
     */
    function deactivatePublicSale() public onlyOwner {
        publicSale = false;
    }


    /* @dev mint mints the IEC NFT
     * @dev require publicSale to be active to mint the NFT
     * @param to is the address on which the nft is minted on 
     * @param tokenId is the is the id of erc721 to be minted
     */
    function mint(address to, uint256 tokenId) public  {
        require( publicSale == true, "public Sale is not activated");
        _safeMint(to, tokenId);
    }


}

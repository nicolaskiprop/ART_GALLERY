//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4; 


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract Artwork is ERC721 {

    uint256 public tokenCounter;
    //mapping
    //this will store all the token Ids with their respective token URI
    mapping (uint256 => string) private _tokenURIs;



    constructor(
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) {
        //Defining the token counter...always set to 0 in the constructor
        tokenCounter = 0;
    }
        //mint function
        function mint(string memory _tokenURI) public {
            _safeMint(msg.sender, tokenCounter);
            _setTokenURI(tokenCounter, _tokenURI);

            tokenCounter++;
        }   
            
        //_setTokenURI function
        function _setTokenURI(uint256 _tokenId, string memory _tokenURI) internal virtual {
            require(
                _exists(_tokenId),
                "ERC721Metadata: URI set of nonexistent token"
            );
            //checks if the token exists
            _tokenURIs[_tokenId] = _tokenURI;
        }

        //tokenURI function
        function tokenURI(uint256 _tokenId) public view virtual override returns(string memory) {
            require(
                _exists(_tokenId),
                "ERC&@!Metadata: URI set of nonexestent token"
            );

            return _tokenURIs[_tokenId];
        }
    


        
        
    
}
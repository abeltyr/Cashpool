

// SPDX-License-Identifier: MIT
 

pragma solidity ^0.8.13;

// File: contracts/GalaxyNftContract.sol
import "./05.AknetERC721A.sol";


contract CashPool1Contract is AknetERC721A {
    constructor() AknetERC721A("Cash Pool #1", "CP1"){}

    function contractURI() public pure returns (string memory) {
      return "https://gateway.pinata.cloud/ipfs/QmfXkZsYJiUruYFXC8La9thr3NJq7TLrjBySV6ujCtFKus";
    }
}

//*********************************************************************//
//*********************************************************************//  
//                                                                                                                                                                                                       
//                                                                                                                                  
//                AAA               KKKKKKKKK    KKKKKKKNNNNNNNN        NNNNNNNN        EEEEEEEEEEEEEEEEEEEEEETTTTTTTTTTTTTTTTTTTTTTT
//               A:::A              K:::::::K    K:::::KN:::::::N       N::::::N        E::::::::::::::::::::ET:::::::::::::::::::::T
//              A:::::A             K:::::::K    K:::::KN::::::::N      N::::::N        E::::::::::::::::::::ET:::::::::::::::::::::T
//             A:::::::A            K:::::::K   K::::::KN:::::::::N     N::::::N        EE::::::EEEEEEEEE::::ET:::::TT:::::::TT:::::T
//            A:::::::::A           KK::::::K  K:::::KKKN::::::::::N    N::::::N          E:::::E       EEEEEETTTTTT  T:::::T  TTTTTT
//           A:::::A:::::A            K:::::K K:::::K   N:::::::::::N   N::::::N          E:::::E                     T:::::T        
//          A:::::A A:::::A           K::::::K:::::K    N:::::::N::::N  N::::::N          E::::::EEEEEEEEEE           T:::::T        
//         A:::::A   A:::::A          K:::::::::::K     N::::::N N::::N N::::::N          E:::::::::::::::E           T:::::T        
//        A:::::A     A:::::A         K:::::::::::K     N::::::N  N::::N:::::::N          E:::::::::::::::E           T:::::T        
//       A:::::AAAAAAAAA:::::A        K::::::K:::::K    N::::::N   N:::::::::::N          E::::::EEEEEEEEEE           T:::::T        
//      A:::::::::::::::::::::A       K:::::K K:::::K   N::::::N    N::::::::::N          E:::::E                     T:::::T        
//     A:::::AAAAAAAAAAAAA:::::A    KK::::::K  K:::::KKKN::::::N     N:::::::::N          E:::::E       EEEEEE        T:::::T        
//    A:::::A             A:::::A   K:::::::K   K::::::KN::::::N      N::::::::N        EE::::::EEEEEEEE:::::E      TT:::::::TT      
//   A:::::A               A:::::A  K:::::::K    K:::::KN::::::N       N:::::::N ...... E::::::::::::::::::::E      T:::::::::T      
//  A:::::A                 A:::::A K:::::::K    K:::::KN::::::N        N::::::N .::::. E::::::::::::::::::::E      T:::::::::T      
// AAAAAAA                   AAAAAAAKKKKKKKKK    KKKKKKKNNNNNNNN         NNNNNNN ...... EEEEEEEEEEEEEEEEEEEEEE      TTTTTTTTTTT     
//
//                                                                                                                               
//  V1.0.0
//
//         Habesha Cash Pool is moden age lottery that is on the block chain 
//                      that is set using a smart contract.
//             This project was done under the development agaencie Aknet. 
//
//*********************************************************************//                                                     
//*********************************************************************// 



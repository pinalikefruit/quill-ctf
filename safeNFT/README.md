
<a name="readme-top"></a>

[![LinkedIn][linkedin-shield]][linkedin-url]


<br />
<div align="center">
  <h1 align="center">safeNFT   [SOLUTION]</h3>

  <p align="center">
    🍍Hi  here you can found one of the solution for the challenge safeNFT !
  </p>
</div>

## Challenge
- Claim multiple NFTs for the price of one.

> Solution: 
    Check `test/safeNFT.t.sol`

## Complementary information to solve the challenge
* [Reentrancy](https://github.com/kadenzipfel/smart-contract-vulnerabilities/blob/master/vulnerabilities/reentrancy.md)
* [OZ erc721 implementation](https://docs.openzeppelin.com/contracts/4.x/erc721)

<!-- ## Extra help -->


# Getting Started

## Requirements

- Download Foundry with the command:
`curl -L https://foundry.paradigm.xyz | bash`
- Run the `foundryup` command 
- Verify the installation of the three most important Foundry tools (`forge`, `cast` and `chisel`) by running the commands:
```
forge --version
> forge 0.2.0 

chisel --version
> chisel 0.1.1 

cast --version
> cast 0.2.0
```

## Setup

Clone this repo

```
git clone pinalikefruit/quill-ctf

cd safeNFT

```

Then install dependencies

```
forge install
```


### Run Solution 

 - `forge test -v`



### Preventative Techniques
> Use the [ReentrancyGuard](https://docs.openzeppelin.com/contracts/4.x/api/security#ReentrancyGuard) library of OpenZeppelin

## License

Distributed under the WTFPL License. See `LICENSE.txt` for more information.



## Contact

Piña - [@pinalikefruit](https://twitter.com/pinalikefruit) - josepina@pinalikefruit.com




[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/pinalikefruit
#Code Example: "Buy me a coffe dapp using Vyper & Brownie"
##Complementary code from Python MTY meet-up
###Conference Title
- [ESP] : "Python y la elaboración de contratos inteligentes (Web 3.0)"
- [ENG] : "Python and developing smart contracts (Web 3.0)"
- [FR] : "Python et la création des contrats intelligents (Web 3.0)"
---
##Intro
In this example we'll cover how to develope a basic EVM compatible smart contract using Vyper and eth-brownie for developing, compiling, testing and deploying a smart contract.

---
##Code layout
By using the command `brownie init buy-me-a-coffee-dapp` we'll create and empty smart contract project where will have the following folders:

- **contracts/**: where the project's smart contracts reside. **Note**: Brownie supports contracts written in Soliity as well as Vyper.
  - In this case we have only one contract called `BuyMeACoffee.vy`
- **interfaces/**: where interfaces used by the project's smart contracts reside. An interface is a file that can be used to interact with a contract but doesn't contain enough information to deploy it.
  - In this case we're not going to use any interfaces but feel free to implement anything that comes to mind for enhancing the `BuyMeACoffee.vy`
- **scripts/**: where Python scripts used by the project reside. Such scripts are used for deployment and interaction with the project.
  - In this case one will find the following 3 line script `buy_me_a_coffee.py`, which has the logic to deploy our smart contract. To a given target chain through brownie API.
- **tests/**: where the proyect's unit tests are stored. Brownie uses the pytest framework for testing.
  - In this case one can find a single test file which yield a 100% testing coverage of `BuyMeACoffee.vy`
---
##How to run the project's dev-env ?
For portability and simplicity sake the developement enviornment was packaged as a docker images through a Dockerfile which can be found at the root of the project's directory.

The Docker image contains all dependencies needed to develop smart contracts using vyper, has all brownie dependencies and even has ganach-cli for local smart contract testing.

Execute the following command to build the dev-env docker image at the same level as to where the Dockerfile resides:

`docker build -t dev-env:v1 .`

Once the image is built execute the following docker command to have the dev-env running on background as a container.

`docker run --name dev-env --rm -d -it -v $(pwd):/dapp dev-env:v1`

In order to interact with the container execute the following docker command to have an interactive terminal:

`docker  docker exec -it dev-env bash`

---
##How to compile example code?
Once an interactive terminal is activated position the terminal to the `buy-me-a-coffee-dapp`
folder the absolute path should be as follows `/dapp/buy-me-a-coffee-dapp`

from set directory execute the following command to compile the `BuyMeACoffee.vy` contract: `brownie compile`

---

##How to run smart contract's test suite?

Just like the compile process, once position on `/dapp/buy-me-a-coffee-dapp` execute the following command:

`brownie test` or `brownie test --coverage` in case test coverage needs to be inspected.

---

##How to deploy smart contract to ganache-cli local blockchain?

Move to `/dapp/buy-me-a-coffee-dapp` and execute the following command:

`brownie run buy_me_a_coffe`
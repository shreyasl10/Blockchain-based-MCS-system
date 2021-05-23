# Blockchain-based-MCS-system

This is a decentralized blockchain based Mobile crowdsensing system that works on the basis of Blockchain oracles. The entire idea of this application is to isolate the worker from being part of the blockchain in order to take part in a transaction. This prevents the system from being vulnerable to attacks like [Eclipse attacks](https://academy.binance.com/en/articles/what-is-an-eclipse-attack) and [Sybil attacks](https://academy.binance.com/en/articles/sybil-attacks-explained).

To make sure that the worker remains of the chain during the transaction process, blockchain oracles are employed that push data from an external source , into the chain. It does this by extracting data from a public API where the worker data is stored and pushes it to the public chain. We have gone with a decentralized Oracle framework, [Chainlink](https://chain.link). This enables the system to be a lot more privacy preserving and secure when compared to a conventional blockchain based system. Further information regarding the overall working of Chainlink can be found [here](https://www.gemini.com/cryptopedia/what-is-chainlink-and-how-does-it-work).

## Components

<ins>Client</ins>: This is the public API written on Flask . It works on a context-aware method where data is fed automatically into the API based on a particular context, in this case, time interval. The API is also made secure by safely removing the data present in it after a particular time interval to make the API inaccessible to anyone until the next stream of data arrives.

<ins>Requester Portal</ins>: This is the frontend portal for the requester to make a request for the worker data. This request is transferred through the smart contract, and the response is retrieved from the API and transferred back to the public chain.

<ins>Smart Contract</ins>: The smart contract here is the agreement between the requester and the chainlink portal(which essentially connects with the public API) which initiates the transaction for the data and thereby , also pushing it to the requester's block in the chain. The smart contract has been written on Remix IDE using Solidity.

## Screenshots

### Data in API
[!Screenshot](screenshots/api.png)

### Requester makes request for data
[!Screenshot](screenshots/req1.png)

### Confirmation of transaction by Metamask
[!Screenshot](screenshots/req2.png)

### Data received upon successful transaction
[!Screenshot](screenshots/req3.png)

At an average, the entire transaction takes 55 seconds.

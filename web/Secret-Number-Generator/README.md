# Secret Number Generator

_fork and clone your own fork of this repo, then push to your own github account._

Gets a random number between 0 and 1000000 (inclusive).  
Gets that same random number every time the functon is invoked  


### Goal

Create a module that returns a function that will return a random number.  
work on the `secret_number.js` file.  
make tests pass


### Example usage

```
var secretNumberGenerator = require('./secret_number');

var secretNumber = secretNumberGenerator();
console.log( secretNumber() ); // 611160.138156265
console.log( secretNumber() ); // 611160.138156265 (the same number)

var anotherSecretNumber = secretNumberGenerator();
console.log( anotherSecretNumber() ); // 2899.987591230
console.log( anotherSecretNumber() ); // 2899.987591230 (the same number)
```

## Install dependencies

```
npm install
```

## Run the tests

```
npm test
```

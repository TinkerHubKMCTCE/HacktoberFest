var chai = require('chai');
var should = chai.should();
var expect = chai.expect;

describe('Secret Number', function() {

  var secretNumberGenerator = require('../secret_number');
  var secretNumber;

  beforeEach(function() {
    secretNumber = secretNumberGenerator();
  });

  it('should return a random number between 0 and 1000000(inclusive)', function() {
    var generatedNumber = secretNumber();
    generatedNumber.should.be.above(-1);
    generatedNumber.should.be.below(1000001);
  });

  it('should return a different random number by different generators', function() {
    var generatedNumber1 = secretNumberGenerator()();
    var generatedNumber2 = secretNumberGenerator()();
    var generatedNumber3 = secretNumberGenerator()();
    [ generatedNumber1, generatedNumber2 ].should.not.contain( generatedNumber3 );
  });

  it('should return the same number every time it is invoked', function() {
    var originalNumber = secretNumber();
    secretNumber().should.be.equal( originalNumber );
    secretNumber().should.be.equal( originalNumber );
    secretNumber().should.be.equal( originalNumber );
    secretNumber().should.be.equal( originalNumber );
  });

});

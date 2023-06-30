pragma circom 2.0.0;

template SimpleCoinFlip() {
    // Declaration of signals.  
   signal input expected;  
   signal input flip;
   signal output success;
   
    // Constraints
   expected === flip;
   success <== expected;
}

 component main {public [expected]} = SimpleCoinFlip();
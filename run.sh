
# one time setup
rm witness.wtns;
circom coinflip.circom --r1cs --wasm -o out
cd out/coinflip_js;
node generate_witness.js coinflip.wasm ../../input.json ../../witness.wtns
cd ..;
snarkjs plonk setup coinflip.r1cs ../keys/pot14_final.ptau ../keys/circuit_final.zkey
cd ../;
# create verifier contract
snarkjs zkey export solidityverifier keys/circuit_final.zkey verifier.sol
# create proof
snarkjs plonk prove keys/circuit_final.zkey witness.wtns proof.json public.json
# verify local
snarkjs plonk verify keys/verification_key.json public.json proof.json
# get calldata
snarkjs zkey export soliditycalldata public.json proof.json
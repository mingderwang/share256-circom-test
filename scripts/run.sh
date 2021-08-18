circom sha256_test.circom --r1cs --wasm --sym
snarkjs r1cs info sha256_test.r1cs
//snarkjs printconstraints  --help
snarkjs r1cs info sha256_test.r1cs
//snarkjs r1cs print sha256_test.r1cs sha256_test.sym
//snarkjs groth16 prove --help 
// mkdir snarkjs_example && cd snarkjs_example
snarkjs powersoftau new bn128 12 pot12_0000.ptau -v

snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v

snarkjs powersoftau contribute pot12_0001.ptau pot12_0002.ptau --name="Second contribution" -v -e="some random text"
snarkjs powersoftau export challenge pot12_0002.ptau challenge_0003

snarkjs powersoftau challenge contribute bn128 challenge_0003 response_0003 -e="some random text"
snarkjs powersoftau import response pot12_0002.ptau response_0003 pot12_0003.ptau -n="Third contribution name"

snarkjs powersoftau verify pot12_0003.ptau
snarkjs powersoftau beacon pot12_0003.ptau pot12_beacon.ptau 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon"
snarkjs powersoftau prepare phase2 pot12_beacon.ptau pot12_final.ptau -v
//
cd ../snarkjs_example
snarkjs powersoftau verify pot12_0003.ptau
//snarkjs powersoftau contribute pot12_0001.ptau pot12_0002.ptau --name="Second contribution" -v -e="some random text"\n
// Start a new zkey and make a contribution

snarkjs zkey new sha256_test.r1cs pot12_final.ptau sha256_test.zkey
// [ERROR] snarkJS: circuit too big for this power of tau ceremony. 59051*2 > 2**12




snarkjs zkey contribute sha256_test.zkey sha256_test.zkey --name="1st Contributor Name" -v
snarkjs zkey export verificationkey sha256_test.zkey verification_key.json
snarkjs powersoftau verify pot12_final.ptau
snarkjs zkey verify sha256_test.r1cs pot12_final.ptau sha256_test.zkey
//
snarkjs r1cs info sha256_test.r1cs
//
snarkjs zkey verify
// input.json is {"a": 3, "b": 11}
snarkjs wtns calculate sha256_test.wasm input.json witness.wtns
snarkjs groth16 prove sha256_test.zkey witness.wtns proof.json public.json
snarkjs groth16 verify verification_key.json public.json proof.json
snarkjs zkey export solidityverifier sha256_test.zkey verifier22.sol
snarkjs generatecall

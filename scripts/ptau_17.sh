snarkjs powersoftau new bn128 17 pot17_0000.ptau -v

snarkjs powersoftau contribute pot17_0000.ptau pot17_0001.ptau --name="First contribution" -v

snarkjs powersoftau contribute pot17_0001.ptau pot17_0002.ptau --name="Second contribution" -v -e="some random text"
snarkjs powersoftau export challenge pot17_0002.ptau challenge_0003

snarkjs powersoftau challenge contribute bn128 challenge_0003 response_0003 -e="some random text"
snarkjs powersoftau import response pot17_0002.ptau response_0003 pot17_0003.ptau -n="Third contribution name"

snarkjs powersoftau verify pot17_0003.ptau
snarkjs powersoftau beacon pot17_0003.ptau pot17_beacon.ptau 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 17 -n="Final Beacon"
snarkjs powersoftau prepare phase2 pot17_beacon.ptau pot17_final.ptau -v
// verify
snarkjs powersoftau verify pot17_final.ptau
// create key
snarkjs zkey new sha256_test.r1cs pot17_final.ptau sha256_test.zkey
snarkjs zkey contribute sha256_test.zkey sha256_test.zkey --name="1st Ming-der Wang" -v
snarkjs zkey export verificationkey sha256_test.zkey verification_key.json
snarkjs zkey verify sha256_test.r1cs pot17_final.ptau sha256_test.zkey
// witness
snarkjs wtns calculate sha256_test.wasm input.json witness.wtns
snarkjs groth16 prove sha256_test.zkey witness.wtns proof.json public.json
snarkjs zkey export solidityverifier sha256_test.zkey verifier22.sol
snarkjs generatecall

# FUZZ STETH

Check upward and downward changes


## Run
`forge test -vvv `


## Output

Running 3 tests for test/SampleContract.t.sol:ReadTest
[PASS] test_downwardDepeg() (gas: 60374)
Logs:
  price_old 77550108325988984
  price_new 62734438481365675

[PASS] test_normalBehaviour() (gas: 39411)
Logs:
  price_old 69795097493390085
  price_new 69704931645961861

[PASS] test_upwardDepeg() (gas: 60260)
Logs:
  price_old 63450088630354623
  price_new 76675424810558047
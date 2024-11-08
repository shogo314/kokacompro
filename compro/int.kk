module compro/int

pub fun gcd(a: int, b: int) : <div> int
    if b == 0 then return a
    gcd(b, a % b)

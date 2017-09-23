package eulerMethods

import "testing"

type palindrome struct {
	pal   string
	valid bool
}

var even_paldindromes = []palindrome{

	palindrome{"334433", true},
	palindrome{"", true},
	palindrome{"nil", false},
}

var odd_paldindromes = []palindrome{

	{"121", true},
	{"1", true},
	{"33433", true},
	{"123", false},
}

func Test_even_paldindrome(test *testing.T) {

	for _, p := range even_paldindromes {
		if p.valid != isPalindrome(&(p.pal)) {

			test.Error("For", p.pal, "excpected", p.valid, "got", isPalindrome(&p.pal))

		}
	}
}

func Test_off_paldindrome(test *testing.T) {
	for i, _ := range odd_paldindromes {

		p := odd_paldindromes[i]
		if p.valid != isPalindrome(&p.pal) {
			test.Error("For", p.pal, "excpected", p.valid, "got", isPalindrome(&p.pal))
		}

	}
}

type prime struct {
	val   int64
	valid bool
}

var primes = []prime{
	{-1, false},
	{1, false},
	{2, true},
	{3, true},
	{4, false},
	{91, false},
	{9901, true},
	{101, true},
	{56346335, false},
}

func Test_standard_prime_function(t *testing.T) {
	for i := 0; i < len(primes); i++ {
		if isPrime(primes[i].val) != primes[i].valid {
			t.Error(primes[i].val, "slipped through the net..")
		}
	}
}

func TestDigitAtIndex(t *testing.T) {
	type pair struct {
		num   int
		i     int
		digit int
	}
	pairs := []pair{

		{1234, 0, 4},
		{1234, 3, 1},
		{101, 1, 0},
		{1234, 1, 3},
		{0, 0, 0},
	}

	for _, p := range pairs {
		if digitAtIndex(p.num, p.i) != p.digit {
			t.Error(p.num, p.i, p.digit, digitAtIndex(p.num, p.i), "slipped through the net")
		}
	}

}

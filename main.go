package main

import (
	"bc_sign_boris/chores/c_go"
	"fmt"
)

func main() {
	for _, x := range []float64{1, 2, 4.5, 5, 6} {
		fmt.Printf("%v -> %v\n", x, c_go.InInterval(2.0, x, 5.0))
	}
}

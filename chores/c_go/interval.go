package c_go

func InInterval(minor float64, x float64, major float64) bool {
	return x >= minor && x <= major
}

package raindrops

import (
	"sort"
	"strconv"
)

// Convert an integer into a raindrops
func Convert(n int) string {
	res := ""
	rains := map[int]string{3: "Pling", 5: "Plang", 7: "Plong"}
	keys := make([]int, len(rains))
	i := 0
	for k, _ := range rains {
		keys[i] = k
		i++
	}
	sort.Ints(keys)
	for _, k := range keys {
		if n%k == 0 {
			res += rains[k]
		}
	}

	if res == "" {
		return strconv.Itoa(n)
	} else {
		return res
	}
}

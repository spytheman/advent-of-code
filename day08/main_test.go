package main

import (
    "testing"
)

func TestPart1(t *testing.T) {
	result := Part1()
	t.Log(" Part 1:", result)
    if result != 355 {
        t.Errorf("part 1 failing")
    }
}

func TestPart2(t *testing.T) {
	result := Part2()
	t.Log(" Part 2:", result)
    if result != 983030 {
        t.Errorf("part 2 failing")
    }
}

package main

import (
	"fmt"
	"net/http"
	"testing"
)

type Handler interface {
	doThing(val int) int
}

type RefAccumulator struct {
	total          *int
	all            *[]int
	externalClient *http.Client
}

func (accum *RefAccumulator) doThing(val int) int {
	*(accum.total) += val
	var newAll = append(*(accum.all), val)
	accum.all = &newAll
	return *(accum.total)
}

type DirectAccumulator struct {
	total  int
	all    []int
	client http.Client
}

func (accum *DirectAccumulator) doThing(val int) int {
	accum.total += val
	accum.all = append(accum.all, val)
	return accum.total
}

func NewRefAccumulator(client *http.Client) Handler {
	var a int
	var b []int
	return &RefAccumulator{&a, &b, client}
}

func NewDirectAccumulator(client http.Client) Handler {
	var a []int
	fmt.Printf("Direct client: %p\n", &client)
	return &DirectAccumulator{0, a, client}
}

func TestSum(t *testing.T) {
	client := &http.Client{}
	fmt.Printf("Starting client: %p  deref %p\n", client, &(*client))

	var accums = make(map[string]Handler)
	accums["ref"] = NewRefAccumulator(client)
	accums["orig"] = NewDirectAccumulator(*client)
	for i := 1; i <= 10; i++ {
		fmt.Printf("Ref: %d, orig: %d  Ref.c: %p orig.c: %p\n",
			accums["ref"].doThing(i),
			accums["orig"].doThing(i),
			accums["ref"].(*RefAccumulator).externalClient,
			&(accums["orig"].(*DirectAccumulator).client))
	}

	var orig *DirectAccumulator = accums["orig"].(*DirectAccumulator)
	if orig.doThing(0) != 55 {
		t.Error("Original value was not what was expected")
	}
	fmt.Println(orig.all)
	if len((*orig).all) != 11 {
		t.Error("Original size was not what was expected")
	}

	ref := accums["ref"].(*RefAccumulator)
	if ref.doThing(0) != 55 {
		t.Error("Ref value was not what was expected")
	}
	fmt.Println(*(ref.all))
	if len(*(*ref).all) != 11 {
		t.Error("Ref size was not what was expected")
	}

}

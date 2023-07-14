package main

import (
	"context"
	"encoding/json"
	"fmt"
	"io/ioutil"

	"github.com/open-policy-agent/opa/rego"
)

func main() {
	r := rego.New(
		rego.Query("x = data.example.allow"),
		//rego.Query("data.example.violation"),
		rego.Load([]string{"./example.rego"}, nil))

	ctx := context.Background()
	query, err := r.PrepareForEval(ctx)
	if err != nil {
		// handle error
	}


	bs, err := ioutil.ReadFile("./input.json")
	if err != nil {
		// handle error
	}

	var input interface{}

	if err := json.Unmarshal(bs, &input); err != nil {
		// handle error
	}

	rs, err := query.Eval(ctx, rego.EvalInput(input))
	if err != nil {
		// handle error
	}

	// In this example we expect a single result (stored in the variable 'x').
	fmt.Println("Result:", rs, rs[0].Bindings["x"])

}

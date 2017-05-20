package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandlerFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hi There!")
}

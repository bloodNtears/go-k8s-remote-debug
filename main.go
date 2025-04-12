package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		name := r.URL.Query().Get("name")
		if name == "" {
			name = "debugger"
		}

		fmt.Printf("Received request with name: %s\n", name)

		fmt.Fprintf(w, "Hello, %s!\n", name)
	})

	port := ":8080"
	fmt.Println("Server is running on http://localhost" + port)
	if err := http.ListenAndServe(port, nil); err != nil {
		log.Fatalf("Server failed to start: %v", err)
	}
}

package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
)

func main() {
	handler := http.NewServeMux()
	handler.HandleFunc("/", Hello)
	handler.HandleFunc("/heavy", HeavyTask)

	log.Fatal(http.ListenAndServe("0.0.0.0:8080", handler))
}

func Hello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, `Hello World`)
}

func HeavyTask(w http.ResponseWriter, r *http.Request) {
	time.Sleep(5 * time.Second)
	fmt.Fprintln(w, "completed heavy task")
}

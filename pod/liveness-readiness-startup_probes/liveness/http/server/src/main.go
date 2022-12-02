package main

import (
	"log"
	"net/http"
	"os"
	"strconv"
	"time"
)

var from time.Time

func init() {
	from = time.Now()
}

func main() {
	t, err := strconv.Atoi(os.Getenv("CRASH_AFTER"))
	if err != nil {
		panic(err)
	}

	http.HandleFunc("/ping", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "text/plain")
		if time.Now().Before(from.Add(time.Duration(t))) {
			w.WriteHeader(http.StatusOK)
			w.Write([]byte("pong\n"))
		} else {
			w.WriteHeader(http.StatusInternalServerError)
			w.Write([]byte("error answering\n"))
		}
	})

	log.Fatal(http.ListenAndServe(":"+os.Getenv("PORT"), nil))
}

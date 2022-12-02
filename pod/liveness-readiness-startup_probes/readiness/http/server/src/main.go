package main

import (
	"log"
	"math/rand"
	"net/http"
	"os"
	"strconv"
	"time"
)

var (
	from  time.Time
	crash bool
)

func init() {
	from = time.Now()
	crash = rand.Intn(10) >= 5
}

func main() {
	t, err := strconv.Atoi(os.Getenv("CRASH_AFTER"))
	if err != nil {
		panic(err)
	}

	log.Println("Is this instance going to crash? ", crash)

	http.HandleFunc("/ping", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "text/plain")
		if !crash || time.Now().Before(from.Add(time.Duration(t))) {
			w.WriteHeader(http.StatusOK)
			w.Write([]byte("pong\n"))
		} else {
			w.WriteHeader(http.StatusInternalServerError)
			w.Write([]byte("error answering\n"))
		}
	})

	log.Fatal(http.ListenAndServe(":"+os.Getenv("PORT"), nil))
}

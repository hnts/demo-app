package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestHello(t *testing.T) {
	req := httptest.NewRequest(http.MethodGet, "/api/hello", nil)
	got := httptest.NewRecorder()
	Hello(got, req)

	want := "Hello World"
	if got := got.Body.String(); got != want {
		t.Errorf("want %s, but %s", want, got)
	}
}

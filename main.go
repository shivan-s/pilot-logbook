// Create a page to show logbook with dummy data

package main

import (
	"html/template"
	"log"
	"net/http"
	"os"
)

type Page struct {
	Title string
	Body  []byte
}

func loadPage(title string) (*Page, error) {
	filename := title + ".html"
	body, err := os.ReadFile("./web/templates/" + filename)
	if err != nil {
		return nil, err
	}
	return &Page{Title: title, Body: body}, nil
}

func renderTemplate(w http.ResponseWriter, tmpl string, p *Page) {
	t, _ := template.ParseFiles("./web/templates/" + tmpl + ".html")
	t.Execute(w, p)
}

func handler(w http.ResponseWriter, r *http.Request) {
	title := "Home"
	p, err := loadPage("index")
	if err != nil {
		p = &Page{Title: title}
	}
	renderTemplate(w, "index", p)
}

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8081", nil))
}

package main

import (
	"database/sql"
	"log"
	_ "github.com/mattn/go-sqlite3"
	"os"
)

func main() {
	db := InitDB()
	CreateTables(db)
}

func InitDB() *sql.DB {

	db, err := sql.Open("sqlite3", "omni.db")
	if err != nil {
		log.Fatal(err)
	}

	return db 

}

func CreateTables(db *sql.DB) {

	content, err := os.ReadFile("schema.sql")
	if err != nil {
		log.Fatal(err)
	}

	_, err = db.Exec(string(content))

	if err != nil {
		log.Fatal(err)
	}
}
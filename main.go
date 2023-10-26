package main

import (
	"fmt"
	"net/http"
)

func main() {

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, World!") // 返回一个简单的响应
	})

	fmt.Println("Listening on port 8080...")
	http.ListenAndServe(":8080", nil) //监听端口并处理请求
}

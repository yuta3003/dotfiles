package main

import (
	"errors"
	"fmt"
	"github.com/PuerkitoBio/goquery"
	"github.com/urfave/cli"
	"io/ioutil"
	"net/http"
	"os"
	"time"
)

func main() {
	app := cli.NewApp()
	app.Name = "gip"
	app.Usage = "This is cli tool to get your global ip address in use."
	app.Version = "0.0.1"
	app.Action = action
	app.Run(os.Args)
}

func action(c *cli.Context) error {
	ip := make(chan string, 1)

	// ゴルーチンで並列化
	go getFromCman(ip)
	go getFromInet(ip)
	go getFromMyglobalip(ip)
	go timeOut(ip)

	r := <-ip
	if r == "timeout" {
		em := "Getting global ip address is timeout."
		fmt.Println(em)
		return errors.New(em)
	}
	fmt.Println(r)
	return nil
}

func getFromCman(ip chan string) {
	doc, err := goquery.NewDocument("https://www.cman.jp/network/support/go_access.cgi")
	if err != nil {
		return
	}
	ip <- doc.Find("div.inArea > div.outIp").Text()
	close(ip)
}

func getFromInet(ip chan string) {
	client := &http.Client{}
	req, err := http.NewRequest("GET", "http://inet-ip.info/", nil)
	if err != nil {
		return
	}
	req.Header.Set("User-Agent", `curl/7.58.0`)
	if err != nil {
		return
	}
	res, err := client.Do(req)
	if err != nil {
		return
	}
	b, err := ioutil.ReadAll(res.Body)
	if err != nil {
		return
	}
	ip <- string(b[:len(b)-2])
	close(ip)
}

func getFromMyglobalip(ip chan string) {
	doc, err := goquery.NewDocument("https://www.myglobalip.com/")
	if err != nil {
		return
	}
	ip <- doc.Find("h3#default > span.ip").Text()
	close(ip)
}

// timeout it 60 seconds
func timeOut(ip chan string) {
	time.Sleep(time.Second * 60)
	ip <- "timeout"
	close(ip)
}
import "phoenix_html"
import "tinymce"
import $ from "jquery"

// import socket from "./socket"


$(() => {
    let body = $("form #body");

    if (body) {
        tinymce.init({
            selector: "#body"
        })
    }
})

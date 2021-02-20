var scriptElement = document.createElement("script");
scriptElement.setAttribute("type", "text/javascript");
scriptElement.setAttribute("src", "/eel.js");
document.querySelector("body").appendChild(scriptElement);

document.querySelector("#koth-ip").onchange = function () {
    updateIp(this.innerHTML)(function (err, data) {
        console.warn(err);
        console.log(data);
    });
}
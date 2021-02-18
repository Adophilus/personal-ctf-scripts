document.querySelector("#koth-ip").onchange = function () {
    $.ajax({
        url: "http://10.2.45.121:11000/update-ip.php",
        data: {
            "ip": document.querySelector("#koth-ip").innerHTML
        },
        type: "POST",
        success: function (data) {
            alert("Local IP hostname has been changed (hopefully)");
        },
        error: function (e) {
            console.warn(e);
        }
    });
}
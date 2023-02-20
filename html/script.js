window.addEventListener("message", (e) => {
    const item = e.data;
    switch(item.type) {
        case "show":
            $("#ghostmaneName").show();
            $("#id #playerID").html("ID: " + item.data.id);
            $("#playersOnline #playerList").html("Nearby: " + item.data.playersActive);
            break;
        case "update":
            $("#id #playerID").html("ID: " + item.data.id);
            $("#playersOnline #playerList").html("Nearby: " + item.data.playersActive);

    }
})
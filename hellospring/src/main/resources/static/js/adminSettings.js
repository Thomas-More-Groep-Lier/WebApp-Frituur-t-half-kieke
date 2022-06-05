var day;
var from;
var nextHoursForm;
var nextMinutesForm;

function changeDay() {
    day = document.getElementById('dayOfTheWeek').value;
}

function changeHours(e) {
    if (e.id == "fromHours") {
        nextHoursForm = document.getElementById("untilHours");
        nextMinutesForm = document.getElementById("untilMinutes");
        enableOptions(nextHoursForm, null);
        disableOptions(e, nextHoursForm, null);
        nextMinutesForm.attributes.removeNamedItem("disabled");
        document.getElementById(e.id).namedItem(Number(e.value)).setAttribute("selected", "selected");
    }
    if (e.id === "untilHours") {
        nextHoursForm = document.getElementById("fromHoursSecond");
        nextMinutesForm = document.getElementById("fromMinutesSecond");
        enableOptions(nextHoursForm, "_Second");
        disableOptions(e, nextHoursForm, "_Second");
        nextMinutesForm.attributes.removeNamedItem("disabled");
        document.getElementById("untilHoursSecond").value = nextHoursForm.value;
        document.getElementById('fromHours').disabled = true;
        document.getElementById('fromMinutes').disabled = true;
    }
    if (e.id === "fromHoursSecond") {
        nextHoursForm = document.getElementById("untilHoursSecond");
        nextMinutesForm = document.getElementById("untilMinutesSecond");
        enableOptions(nextHoursForm, "_Second");
        disableOptions(e, nextHoursForm, "_Second");
        nextMinutesForm.attributes.removeNamedItem("disabled");

        document.getElementById('untilHours').disabled = true;
        document.getElementById('untilMinutes').disabled = true;
    }
    if (e.id === "untilHoursSecond") {
        document.getElementById('fromHoursSecond').disabled = true;
        document.getElementById('fromMinutesSecond').disabled = true;
    }
    if (testBigger(e.id)) {
        alert('Controleer uw openingsuren ... ')
    }
}

function testBigger(select) {
    const fromHours = document.getElementById('fromHours').value;
    const untilHours = document.getElementById('untilHours').value;
    const fromHoursSecond = document.getElementById('fromHoursSecond').value;
    const untilHoursSecond = document.getElementById('untilHoursSecond').value;
    switch (select) {
        // case "fromHours":
        //     if (fromHours > untilHours) {
        //         return "foute ingave bij openingsuur 1ste openingsmoment... \n";
        //     }
        //     break;
        case "untilHours":
            if (untilHours < fromHours || fromHoursSecond < untilHours) {
                return  "foute ingave bij sluitingsuur 1ste openingsmoment... \n";;
            }
            return "";
            break;
        case "fromHoursSecond":
            if (fromHoursSecond < untilHours || fromHoursSecond > untilHoursSecond) {
                return  "foute ingave bij openingsuur 2de openingsmoment... \n";
            }
            return "";
            break;
        // case "untilHoursSecond":
        //     if (untilHoursSecond < fromHoursSecond || untilHoursSecond < untilHours || untilHoursSecond < fromHours) {
        //         return  "foute ingave bij sluitingssuur 2de openingsmoment... \n";
        //     }
        //     break;
        default:
            ;
    }
}

function enableOptions(select, idAddition) {
    for (let x = 23; x >= 10; x--) {
        console.log(select.namedItem(x));
        if (idAddition != null) {
            const disabled = select.namedItem(x + idAddition).attributes.getNamedItem("disabled");
            if (disabled != null) {
                select.namedItem(x + idAddition).attributes.removeNamedItem("disabled");
            }
        } else {
            const disabled = select.namedItem(x).attributes.getNamedItem("disabled");
            if (disabled != null) {
                select.namedItem(x).attributes.removeNamedItem("disabled");
            }
        }

    }
}

function disableOptions(e, select, idAddition) {
    for (let x = e.value; x >= 10; x--) {
        if (idAddition != null) {
            select.namedItem(x + idAddition).setAttribute("disabled", "disabled");
            if (e.id == "untilHours") {
                if (select.namedItem(Number(e.value) + idAddition).getAttribute("disabled") != null){
                    select.namedItem(Number(e.value) + idAddition).attributes.removeNamedItem("disabled")
                }
                select.namedItem(Number(e.value) + idAddition).setAttribute("selected", "selected");
            } else {
                select.namedItem((Number(e.value) + 1) + idAddition).setAttribute("selected", "selected");
            }
        } else {
            select.namedItem(Number(e.value) + 1).setAttribute("selected", "selected");
            select.namedItem(x).setAttribute("disabled", "disabled");
        }
    }
    select.attributes.removeNamedItem("disabled");
}

function updateOpeningHours() {

    let formIds = ["untilHours","fromHoursSecond"]
    let fouten = "";

    for(let x = 0; x < formIds.length; x++){
        fouten += testBigger(formIds[x]);
    }
    if (fouten === ""){
        document.getElementById('fromHours').disabled = false;
        document.getElementById('fromMinutes').disabled = false;
        document.getElementById('untilHours').disabled = false;
        document.getElementById('untilMinutes').disabled = false;
        document.getElementById('fromHoursSecond').disabled = false;
        document.getElementById('fromMinutesSecond').disabled = false;
        document.getElementById('untilHoursSecond').disabled = false;
        document.getElementById('untilMinutesSecond').disabled = false;
        document.getElementById('openingHours').submit();
    }
    else {
        alert(fouten);
    }

}

function vacationDatesAreValid() {
    let startDate = document.getElementById('from').value;
    let endDate = document.getElementById('untill').value;
    console.log(startDate, endDate);
    if (startDate == '' || endDate == '') {
        alert('geen start en/of einddatum geselecteerd voor de vakantie');
    }
    if (endDate < startDate) {
        return false;
    } else {
        return true;
    }

}

function submitTimeOff() {
    if (vacationDatesAreValid()) {
        document.getElementById('vakantiePlanning').submit();
    } else {
        alert('Start datum moet voor einddatum liggen')
    }
}
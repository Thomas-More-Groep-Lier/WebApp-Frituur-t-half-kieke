function submitTimeOff() {
    document.getElementById('vakantiePlanning').submit();
}

function updateOpeningHours() {
    document.getElementById('openingHours').submit();
}

function interactivOpeningHoursForm(day) {
    var from;
    var from2;
    var until;
    var until2;
    switch (day) {
        case 'mon':
            from = document.getElementById('mondayFrom').value;
            document.getElementById('mondayFrom').value = roundMinutes(from);
            until = document.getElementById('mondayUntil').value;
            document.getElementById('mondayUntil').value = roundMinutes(until);
            from2 = document.getElementById('mondayFrom2').value;
            document.getElementById('mondayFrom2').value = roundMinutes(from2);
            until2 = document.getElementById('mondayUntil2').value;
            document.getElementById('mondayUntil2').value = roundMinutes(until2);
            if (from != "" && until != "") {
                document.getElementById('mondayFrom2').classList.remove('d-none');
                document.getElementById('mondayUntil2').classList.remove('d-none');
            }
            break;
        case 'tue':
            from = document.getElementById('tuesdayFrom').value;
            document.getElementById('tuesdayFrom').value = roundMinutes(from);
            until = document.getElementById('tuesdayUntil').value;
            document.getElementById('tuesdayUntil').value = roundMinutes(until);
            from2 = document.getElementById('tuesdayFrom2').value;
            document.getElementById('tuesdayFrom2').value = roundMinutes(from2);
            until2 = document.getElementById('tuesdayUntil2').value;
            document.getElementById('tuesdayUntil2').value = roundMinutes(until2);
            if (from != "" && until != "") {
                document.getElementById('tuesdayFrom2').classList.remove('d-none');
                document.getElementById('tuesdayUntil2').classList.remove('d-none');
            }
            break;
        case 'wed':
            from = document.getElementById('wednesdayFrom').value;
            document.getElementById('wednesdayFrom').value = roundMinutes(from);
            until = document.getElementById('wednesdayUntil').value;
            document.getElementById('wednesdayUntil').value = roundMinutes(until);
            from2 = document.getElementById('wednesdayFrom2').value;
            document.getElementById('wednesdayFrom2').value = roundMinutes(from2);
            until2 = document.getElementById('wednesdayUntil2').value;
            document.getElementById('wednesdayUntil2').value = roundMinutes(until2);
            if (from != "" && until != "") {
                document.getElementById('wednesdayFrom2').classList.remove('d-none');
                document.getElementById('wednesdayUntil2').classList.remove('d-none');
            }
            break;
        case 'thu':
            from = document.getElementById('thursdayFrom').value;
            document.getElementById('thursdayFrom').value = roundMinutes(from);
            until = document.getElementById('thursdayUntil').value;
            document.getElementById('thursdayUntil').value = roundMinutes(until);
            from2 = document.getElementById('thursdayFrom2').value;
            document.getElementById('thursdayFrom2').value = roundMinutes(from2);
            until2 = document.getElementById('thursdayUntil2').value;
            document.getElementById('thursdayUntil2').value = roundMinutes(until2);
            if (from != "" && until != "") {
                document.getElementById('thursdayFrom2').classList.remove('d-none');
                document.getElementById('thursdayUntil2').classList.remove('d-none');
            }
            break;
        case 'fri':
            from = document.getElementById('fridayFrom').value;
            document.getElementById('fridayFrom').value = roundMinutes(from);
            until = document.getElementById('fridayUntil').value;
            document.getElementById('fridayUntil').value = roundMinutes(until);
            from2 = document.getElementById('fridayFrom2').value;
            document.getElementById('fridayFrom2').value = roundMinutes(from2);
            until2 = document.getElementById('fridayUntil2').value;
            document.getElementById('fridayUntil2').value = roundMinutes(until2);
            if (from != "" && until != "") {
                document.getElementById('fridayFrom2').classList.remove('d-none');
                document.getElementById('fridayUntil2').classList.remove('d-none');
            }
            break;
        case 'sat':
            from = document.getElementById('saturdayFrom').value;
            document.getElementById('saturdayFrom').value = roundMinutes(from);
            until = document.getElementById('saturdayUntil').value;
            document.getElementById('saturdayUntil').value = roundMinutes(until);
            from2 = document.getElementById('saturdayFrom2').value;
            document.getElementById('saturdayFrom2').value = roundMinutes(from2);
            until2 = document.getElementById('saturdayUntil2').value;
            document.getElementById('saturdayUntil2').value = roundMinutes(until2);
            if (from != "" && until != "") {
                document.getElementById('saturdayFrom2').classList.remove('d-none');
                document.getElementById('saturdayUntil2').classList.remove('d-none');
            }
            break;
        case 'sun':
            from = document.getElementById('sundayFrom').value;
            document.getElementById('sundayFrom').value = roundMinutes(from);
            until = document.getElementById('sundayUntil').value;
            document.getElementById('sundayUntil').value = roundMinutes(until);
            from2 = document.getElementById('sundayFrom2').value;
            document.getElementById('sundayFrom2').value = roundMinutes(from2);
            until2 = document.getElementById('sundayUntil2').value;
            document.getElementById('sundayUntil2').value = roundMinutes(until2);
            if (from != "" && until != "") {
                document.getElementById('sundayFrom2').classList.remove('d-none');
                document.getElementById('sundayUntil2').classList.remove('d-none');
            }
            break;
        default:
            break;
    }
}
function roundMinutes(selected){
    let hours = selected.substring(0,2);
    let minutes = selected.substring(3);
    if (Number(hours) < 10){
        hours = 10;
    }
    if (minutes >= 0 && minutes <= 7 )
    {
        return  (Number(hours) + ':00');
    }
    else if (minutes >= 8 && minutes <= 22 )
    {
        return  (Number(hours) + ':15');
    }
    else if (minutes >= 23 && minutes <= 37 )
    {
        return  (Number(hours) + ':30');
    }
    else if (minutes >= 38 && minutes <= 52 )
    {
        return  (Number(hours) + ':45');
    }
    else {
        return  (Number(hours) + 1 + ':00');
    }
}
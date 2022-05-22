    var id;
    var weekday;
    var maxNrOfOrders;
    var isActive;

    function submitDefault() {
    const form = document.getElementById('default')
    form.submit();
}
    function selectedTimeSlot(i, wday, active, max) {
    id = i;
    weekday = wday;
    isActive = active;
    maxNrOfOrders = max;
    const select = document.getElementById('maxNumberOfOrders');
    select.value = maxNrOfOrders;
    const checkbox = document.getElementById('activeOrDeactivated');
    checkbox.checked = isActive;
}

    function changeActive(){
    const checkbox = document.getElementById('activeOrDeactivated');
    isActive = checkbox.checked;
    console.log(isActive);
}

    function changeMax(){
    const checkbox = document.getElementById('activeOrDeactivated');
    const select = document.getElementById('maxNumberOfOrders');
    maxNrOfOrders = select.value;
    if (maxNrOfOrders === "0"){
    isActive = false;
    checkbox.checked = false;
    console.log(checkbox, checkbox.checked);
} else {
    isActive = true;
    checkbox.checked = true;
    console.log(checkbox, checkbox.checked);
}
}

    function testSubmit(){
    const form = document.getElementById('timeSlotSpecsForm');
    document.getElementById('timeSlotId').value = id;
    document.getElementById('isActive').value = isActive;
    document.getElementById('nrOfOrders').value = maxNrOfOrders;
    form.submit();
}
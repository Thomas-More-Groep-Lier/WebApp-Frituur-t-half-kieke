function plus(id) {
    let current = document.getElementById(id).value;
    if (Number(current) < 100) {
        document.getElementById(id).value = Number(current) + 1;
    }
}

function min(id) {
    let current = document.getElementById(id).value;
    if (Number(current) > 0) {
        document.getElementById(id).value = Number(current)-1;
    }
}
function submitForm() {
    let form = document.getElementById('orderForm');
    form.submit();
}
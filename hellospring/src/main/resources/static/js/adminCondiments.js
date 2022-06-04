    function confirmDelete(id){
    const ok = confirm("Weet je zeker dat je dit artikel wenst te verwijderen?")
    if (ok) {
    window.location.href = `/Admin/Products/Condiments/Delete?id=${id}`;
}
}
    function addNew(id) {
    if (id !== undefined && id !== null) {
    let price = document.getElementById(`condimentPrice_` + id).innerText.replace("€", "");
    let select = document.getElementById('category');
    document.getElementById('condimentId').value = id;
    document.getElementById('btnAdd').classList.add('d-none');
    document.getElementById('btnEdit').classList.remove('d-none');
    document.getElementById('btnClear').classList.remove('d-none');
    document.getElementById('condimentPrice').value = Number(price.replace(/,/g, '.'));
    document.getElementById('condimentName').value = document.getElementById(`condimentName_` + id).innerText;
    document.getElementById('condimentCategory').value = select.options[select.selectedIndex].value;
} else {
    document.getElementById('condimentId').value = id;
    document.getElementById('btnAdd').classList.remove('d-none');
    document.getElementById('btnClear').classList.add('d-none');
    document.getElementById('btnEdit').classList.add('d-none');
    document.getElementById('condimentPrice').value = "";
    document.getElementById('condimentName').value = "";
    document.getElementById('condimentCategory').value = "";
}
}
    function clearId() {
    addNew();


}
    function validateAndSubmit(){
        let price = document.getElementById('condimentPrice').value;
        let condimentName = document.getElementById('condimentName').value;
        let faultmessage = '';
        console.log("validation script run");
        console.log(price);
        if(price =='') {
            faultmessage = "prijs is een verplicht veld\n";
        }
        if(condimentName == ''){
            faultmessage +='naam is een verplicht veld\n';
        }
        console.log(faultmessage);
        if(faultmessage != ''){
            alert(faultmessage);
        }
        else{
            document.getElementById('new_edit_form').submit()
        }


    }
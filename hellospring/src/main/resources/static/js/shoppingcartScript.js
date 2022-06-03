var selectedProducts = [];
var product = {};
var newQuantity = 0;
var newPrice = 0;
var str = localStorage.getItem("array");
var parsedArr = JSON.parse(str);

fillInput();
updateCartPreview();

function fillInput() {
    if (parsedArr !== null) {
        parsedArr = parsedArr.filter(p => p.quantity !== 0);
        if (parsedArr.length > 0) {
            for (let i = 0; i < parsedArr.length; i++) {
                var product = parsedArr[i];
                if (parsedArr[i].condimentName == null) {
                    condimentName = '';
                } else {
                    condimentName = "(" + parsedArr[i].condimentName + ")";
                }
                document.getElementById('orderSummary').innerHTML += (
                    '<input type="hidden" name="products[]" value="' + parsedArr[i].id + '">' +
                    '<input type="hidden" name="condiments[]" value="' + parsedArr[i].condiment + '">' +
                    '<div class="row mb-3 product" id="product_' + parsedArr[i].guid + '">' +
                    '<div class="col-6 text-start" id="name_' + parsedArr[i].id + '"><b>' + parsedArr[i].name +
                    ' </b>' + condimentName + '</div>' +
                    '<div class="col-4">' +
                    '<button type="button" class="btnMinus" onclick="return x(\'' + parsedArr[i].guid + '\', \'min\')" style="color: red; background-color: pink; border: 2px solid red;"><i class="bi bi-dash-lg"></i></button>' +
                    '<input type="number" id="' + parsedArr[i].guid + '" name="quantity[]" min="0" max="100" value="' + parsedArr[i].quantity + '" class="quantityInput" style="width: 40px; text-align: center;"/>' +
                    '<button type="button" class="btnPlus" onclick="return x(\'' + parsedArr[i].guid + '\', \'plus\')" style="color: darkgreen; background-color: palegreen; border: 2px solid darkgreen;"><i class="bi bi-plus-lg"></i></button>' +
                    '</div>' +
                    '<div class="d-none" id="price_' + parsedArr[i].id + '">' + parsedArr[i].price + '</div>' +
                    '<div class="col-2 text-end" id="totalprice_' + parsedArr[i].id + '"> &euro; ' + Number(parsedArr[i].price).toFixed(2) + '</div>' +
                    '</div>');
            }
        }
        selectedProducts = parsedArr;
    }
}

function x(g, type) {
    console.log(g, type);
    let t = parsedArr.filter(x => x.guid === g);
    let product = t[0];
    let guid = product.guid;
    let price = Number(product.price) / Number(product.quantity);
    let input = document.getElementById(guid);

    switch (type) {
        case "plus":
            if (Number(input.value) < 100) {
                newQuantity = Number(input.value) + 1;
                newPrice = price * newQuantity;
                saveProduct(product, newQuantity, newPrice);
            }
            break;
        case "min":
            if (Number(input.value) > 0) {
                newQuantity = Number(input.value) - 1;
                newPrice = price * newQuantity;
                saveProduct(product, newQuantity, newPrice);
            } else {
                document.getElementById(guid).style.cssText = "display: none;";
                localStorage.setItem("array", JSON.stringify(selectedProducts.filter(p => p.guid !== guid)));
            }
            break;
        default:
            break;
    }
}

function saveProduct(product, newQuantity, newPrice) {
    product.quantity = newQuantity;
    product.price = newPrice;

    let index = keepProductListUpdate(product);
    if (index === -1 || index === undefined) {
        selectedProducts.push(product);
        console.log("product added!");
    } else {
        selectedProducts[index].price = product.price;
        selectedProducts[index].quantity = product.quantity;
        console.log("product updated!");
    }
    saveInLocaleStorage(selectedProducts);
}

function keepProductListUpdate(product) {
    if (selectedProducts.length > 0) {
        const indexOfTheProduct = selectedProducts.findIndex((obj) => {
            if (obj.id === product.id && product.condiment === obj.condiment) {
                obj.quantity = product.quantity;
                return true;
            }
            return false;
        });
        return indexOfTheProduct;
    }
}

function submitForm() {
    let timeslot = document.getElementById('inTimeSlot').value;
    let firstname = document.getElementById('firstName').value;
    let lastname = document.getElementById('lastName').value;
    let email = document.getElementById('email').value;
    let tel = document.getElementById('tel').value;
    let voorwaarden = document.getElementById('voorwaarden').checked;
    let fouten = "";

    /*console.log("timeslot:" +timeslot);
    console.log("voornaam:" +firstname);
    console.log("achternaam:" +lastname);
    console.log("email:" +email);*/
    console.log("telnr:" +tel);
    console.log("voorwaarden goedgekeurd:" +voorwaarden);

    if (firstname === "" || lastname === "" || email === "" || !voorwaarden || timeslot === "" || tel === "" || parsedArr === null) {
        if (parsedArr === null)
            fouten += "Wil je niets eten? Dan kan je ook niets bestellen ... \n";

        if (firstname === "")
            fouten += "Voornaam is een verplicht veld ... \n";

        if (lastname === "")
            fouten += "Achternaam is een verplicht veld ... \n";

        if (email === "")
            fouten += "Email is een verplicht veld ... \n";

        if (tel === "")
            fouten += "Telefoonnummer is een verplicht veld ... \n";

        if (timeslot === "")
            fouten += "Het is verplicht een tijdslot te selecteren ... \n";

        if (!voorwaarden)
            fouten += "Gelieve akkoord te gaan met de algemene voorwaarden ... \n";

    }
     else {
        if (firstname.length < 2 && containsSpecialChars(firstname))
            fouten += "Een voornaam bestaat uit minimaal 2 (alfanumerieke) karakters.\n";

        if (lastname.length < 5 && containsSpecialChars(lastname))
            fouten += "Een achternaam bestaat uit minimaal 5 (alfanumerieke) karakters.\n";

        if (email.length < 8 ) {
            fouten += "Een email adres bestaat uit minimaal 8 (alfanumerieke) karakters.\n";
        }

        else{
            fouten += validateEmail(email);
            fouten += validatePhone(tel);
        }
    }
    if (fouten === "") {
        console.log('geen fouten gevonden');
        //document.getElementById('final').submit();
    } else {
        alert(fouten);
    }
}

function updateCartPreview() {
    let nrOfProducts = 0;
    let totalPrice = 0;
    if (selectedProducts !== null && selectedProducts.length > 0) {
        for (let x = 0; x < selectedProducts.length; x++) {
            nrOfProducts = Number(nrOfProducts) + Number(selectedProducts[x].quantity);
            totalPrice = Number(totalPrice) + Number(selectedProducts[x].price);
        }
    }
    document.getElementById('cartQuantity').innerText = nrOfProducts.toString();
    document.getElementById('cartTotalPrice').innerText = Number(totalPrice).toFixed(2);
}

function selectedTimeSlot(id) {
    const slots = document.getElementsByClassName('timeslot');
    for (let i = 0; i < slots.length; i++) {
        if (slots[i].classList.contains('bg-info')) {
            slots[i].classList.remove('bg-info');
        }
    }
    document.getElementById(id).classList.add('bg-info');
    document.getElementById('inTimeSlot').value = id;
}

function containsSpecialChars(str) {
    const specialChars = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
    return specialChars.test(str);
}

function validateEmail(inputText) {
    //controleer samenstelling email adres (aangepaste versie van https://www.w3resource.com/javascript/form/email-validation.php)
    //zoeken naar @ symbool en mail adres in gebruiker en domein verdelen op basis van @ symbool
        let heeftAtSymbool = inputText.indexOf("@");
        let mailpartGebruiker, mailpartDomein;
        let faultmessage = '';
        if (heeftAtSymbool == -1) { faultmessage +="een email adres moet een @ bevatten\n";  }
        else {
            mailpartGebruiker = inputText.slice(0, heeftAtSymbool);
            mailpartDomein = inputText.slice(heeftAtSymbool + 1);
            //controle van gebruikerdeel
            //nakijken of minstens 1 teken lang
            if (mailpartGebruiker.length < 1) {
                faultmessage+="de gebruikersnaam van het email adres moet minstens 1 teken zijn\n";
            }
            //nakijken of niet begint met punt of koppelteken
            if (mailpartGebruiker.indexOf(".") == 0 || mailpartGebruiker.indexOf("-") == 0)
            { faultmessage +="de gebruikersnaam van een email adres mag niet beginnen met een . of - teken\n" }
            //nakijken of enkel letters, nummers, underscores punten of koppeltekens bevat
            let bevatFouteTekens = mailpartGebruiker.search(/[^a-z^A-Z^0-9^.^-^_^-]/);

            if (bevatFouteTekens != -1) {
                faultmessage +="gebruikersnaam van email adres mag enkel letters,cijfers, punten, koppeltekens of underscores bevatten\n";
            }

            //controle van domeindeel
            if (mailpartDomein.length < 3) {
                faultmessage += "de domeinnaam van het email adres moet minstens uit 3 teken bestaan.\n";
            }
            //nakijken of start met letter of nummer
            let begintMetLetterOfNummer = mailpartDomein.slice(0,1);
            console.log(begintMetLetterOfNummer);
            if (begintMetLetterOfNummer.search(/[a-zA-Z0-9]/)) {
                faultmessage += "de domeinnaam van het email adres moet beginnen met een letter of cijfer.\n";
            }
            //nakijken of punt aanwezig is voor domein af te scheiden van extensie
            if (mailpartDomein.indexOf(".") == -1) {
                faultmessage += "domeinnaam moet een . bevatten om domein van extentie te scheiden\n";
            }
            //nakijken of het enkel letters,nummers,punten en koppeltekens bevat
            bevatFouteTekens = mailpartDomein.search(/[^a-z^A-Z^0-9^.^-^-]/);

            if (bevatFouteTekens != -1) {
                faultmessage += "domeinnaam van email adres mag enkel letters,cijfers, punten, of koppeltekens bevatten\n";
            }
            return faultmessage;

        }

  /*  const mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    console.log(mailformat);
    console.log(inputText);
    console.log(!!inputText.value.match(mailformat));
    return !!inputText.value.match(mailformat);*/
}

function validatePhone(inputText) {
    let faultmessage ='';
    const phoneformat = /^[0-9]+$/;
        //^(((\+|00)32[ ]?(?:\(0\)[ ]?)?)|0){1}(4(60|[789]\d)\/?(\s?\d{2}\.?){2}(\s?\d{2})|(\d\/?\s?\d{3}|\d{2}\/?\s?\d{2})(\.?\s?\d{2}){2})$/;

    if(!(inputText.match(phoneformat))){
        faultmessage += "telefoonnummer mag enkel cijfers bevatten\n";
    }
    if(inputText.length <9 || inputText.length>10){
        faultmessage += "telefoonnummer moet 9 of 10 cijfers lang zijn.\n";
    }
    console.log('tel foutboodschap: '+ faultmessage);
    return faultmessage;

    /*const phoneformat = /^(((\+|00)32[ ]?(?:\(0\)[ ]?)?)|0){1}(4(60|[789]\d)\/?(\s?\d{2}\.?){2}(\s?\d{2})|(\d\/?\s?\d{3}|\d{2}\/?\s?\d{2})(\.?\s?\d{2}){2})$/;
    console.log(phoneformat);
    console.log(inputText);*/
    //return !!inputText.value.match(phoneformat);
}

function saveInLocaleStorage(value) {
    // Timeout en reload nodig om het dom manipulatie niet te blokkeren ...
    // Zonder gebruik, bestaat de kans dat de locale storage niet up-to-date is ten opzichte van de verwachting.
    setTimeout(() => {
        localStorage.setItem("array", JSON.stringify(value));
        location.reload();
    }, 150);
}
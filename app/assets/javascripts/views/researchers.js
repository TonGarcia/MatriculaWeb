// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
const proReady = function() {
    const currentURL = location.href;
    const researcherURL = currentURL.indexOf('researchers') < 0;
    const rootURL = /(\/)/mig.exec(location.href);

    let m;
    const rootRegex = /(\/+)/mig;
    while ((m = rootRegex.exec(currentURL)) !== null) if (m.index === rootRegex.lastIndex) rootRegex.lastIndex++;

    if(!researcherURL && !rootURL) return;


    $('input, textarea').keyup(function(event) {
        // Get the input value
        const input = $(event.target);
        const value = input.val();

        // if(!value) return;

        // Get the input target (model object attr)
        const name = input.attr('name');
        const attr = name.match(/\[(.*)\]/)[1];

        // Set it filled value to the view element
        $('#'+attr).html(value);
    });

    var citySelector = $('select#cities');
    var stateSelector = $('select#states');
    var countrySelector = $('select#countries');

    const countrySelectorFunc = function() {
        const selectedCountry = countrySelector.val();
        $.get('/locale/states_from/' + selectedCountry, function(data){
            stateSelector = $('select#states');
            stateSelector.replaceWith(data);
            stateSelector = $('select#states');
            stateSelector.change(stateSelectorFunc);
        });
    };

    const stateSelectorFunc = function() {
        const selectedState = stateSelector.val();
        const selectedCountry = countrySelector.val();
        $.get('/locale/cities_from/' + selectedCountry + '/' + selectedState, function(data){
            citySelector = $('select#cities');
            citySelector.replaceWith(data);
        });
    };

    stateSelector.change(stateSelectorFunc);
    countrySelector.change(countrySelectorFunc);

};

document.addEventListener('turbolinks:change', proReady);
document.addEventListener('turbolinks:load', proReady);
$(document).on('turbolinks:change', proReady);
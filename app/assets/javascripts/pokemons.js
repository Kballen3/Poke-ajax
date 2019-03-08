var yourPokemon = {};
var morePokemon = false;

$(document).ready( function() {
    $("#pokemon-item").on("click", function() {
        yourPokemon.id = this.dataset.id;   
        $.ajax({
            url: '/pokemons/' + yourPokemon.id + '/moves',
            method: 'GET',
            dataType: 'JSON'
          }).done( function(moves) {
            var list = $('#moves');
            list.empty();
            moves.forEach( function(char) {
              var li = '<li data-move-id="' + char.id + '">' + char.name + '</li>'
              list.append(li)
            });
        });
    })
    $('#toggle').on('click', function() {
        morePokemon = !morePokemon;
        $('#pokemon-form').remove()
        $('#pokemons-list').toggle()
        
        if (morePokemon) {
        
          $.ajax({
            url: '/pokemon_form',
            method: 'GET'
          }).done( function(html) {
            $('#toggle').after(html);
          });
        }
    });
    $(document).on('submit', '#pokemon-form form', function(e) {
        e.preventDefault();
        var data = $(this).serializeArray();
        $.ajax({
          url: '/pokemonss',
          type: 'POST',
          dataType: 'JSON',
          data: data
        }).done( function(pokemon) {
          var g = '<li class="pokemon-item" data-id="' + pokemon.id + '">' + pokemon.
          name + '-' + pokemon.description + '</li>';
          $('#pokemons-list').append(g);
        }).fail( function(err) {
          alert(err.responseJSON.errors)
        });
    });
      
})
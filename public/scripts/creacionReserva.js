$("#btn_datos").on("click", function () {
    $("#formulario-principal").hide();
    $("#formulario-adicional").show();
});

$("#btn_volver").on("click", function () {
    $("#formulario-adicional").hide();
    $("#formulario-principal").show();
});


$('#form-agregar-reserva').on('submit', function (e) {
    e.preventDefault();

    const reservaData = {
        nombre: $('#nombre').val(),
        cantidad_personas: $('#personas').val(),
        fecha: $('#fecha').val(),
        hora_inicio: $('#hora').val(),
        telefono: $('#telefono').val(),
        id_estado: 1,
        id_restaurante: 1
    };

    fetch("/crearReserva",{
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(reservaData)
    })
        .then(response => {
            if (!response.ok) return response.text().then(text => { throw new Error(text) });
            return response.json();
        })
        .catch(error => {
            alert('Error al guardar la reserva');
            console.error('Error al guardar la reserva:', error);
        });
});

$(document).ready(function () {
    $('#btn_datos').click(function () {
        $('#formulario-principal').hide();
        $('#formulario-adicional').show();
    });

    $('#btn_volver').click(function () {
        $('#formulario-adicional').hide();
        $('#formulario-principal').show();
    });

    $('#btn_enviar_reserva').click(async function () {
        const reserva = {
            nombre: $('#nombre').val(),
            cantidad_personas: $('#personas').val(),
            fecha: $('#fecha').val(),
            hora_inicio: $('#hora').val(),
            telefono: $('#telefono').val(),
            id_estado: 1, // Estado "pendiente"
            id_restaurante: 1 // Suponiendo restaurante 1 por defecto
        };

        try {
            const response = await fetch('/crearReserva', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(reserva)
            });

            const data = await response.json();

            if (response.ok) {
                alert('Reserva creada correctamente');
                location.reload();
            } else {
                alert(data.message || 'Error al crear la reserva');
            }
        } catch (error) {
            console.error('Error:', error);
            alert('Error de conexión al crear reserva');
        }
    });
});

$('#btn_enviar_reserva').click(async function () {
    const reserva = {
        nombre: $('#nombre').val(),
        apellido: $('#apellido').val(),
        cantidad_personas: $('#personas').val(),
        fecha: $('#fecha').val(),
        hora_inicio: $('#hora').val(),
        telefono: $('#telefono').val(),
        ocasion: $('#ocasion').val(),
        id_estado: 1,
        id_restaurante: 1
    };

    try {
        const response = await fetch('/crearReserva', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(reserva)
        });

        const data = await response.json();

        if (response.ok) {
            alert('Reserva creada correctamente');
            location.reload();
        } else {
            alert(data.message || 'Error al crear la reserva');
        }
    } catch (error) {
        console.error('Error:', error);
        alert('Error de conexión al crear reserva');
    }
});

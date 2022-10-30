function llenarFormulario(fila) {
    var id = $(fila).find(".idEmpleado").text();
    var dui = $(fila).find(".dui").text();
    var nombre = $(fila).find(".nombre").text();
    var apellido = $(fila).find(".apellido").text();
    var salario = $(fila).find(".salario").text();
    var estado = $(fila).find(".estado").text();

    $("#txtIdEmpleado").val(id);
    $("#txtDUI").val(dui);
    $("#txtNombre").val(nombre);
    $("#txtApellido").val(apellido);
    $("#txtSalario").val(salario);
    $("#txtEstado option[selected]").removeAttr("selected");
    $(`#txtEstado option:contains(${estado})`).attr('selected', true);
}

$(document).ready(function () {
    $("#myDataTable").DataTable();

    $('.btnOcultar').css("display", "none");

    $("#staticBackdrop").on("hidden.bs.modal", function () {
        $('form')[0].reset();
    });

    $(document).on('click', '.btnEditar', function () {
        llenarFormulario($(this).closest('tr'));
        $('.btnOcultar1').css("display", "none");
        $('.btnOcultar').css("display", "none");
        $('.btnOcultar2').css("display", "inline");
    });
    $(document).on('click', '.btnEliminar', function () {
        llenarFormulario($(this).closest('tr'));
        $('.btnOcultar1').css("display", "none");
        $('.btnOcultar2').css("display", "none");
        $('.btnOcultar').css("display", "inline");
    });
    $(document).on('click', '.btnAdd', function () {
        $('.btnOcultar').css("display", "none");
        $('.btnOcultar2').css("display", "none");
        $('.btnOcultar1').css("display", "inline");
    });
});



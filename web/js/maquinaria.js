function llenarFormulario(fila) {
    var codigo = $(fila).find(".codigo").text();
    var nombre = $(fila).find(".nombre").text();
    var stock = $(fila).find(".stock").text();
    var descripcion = $(fila).find(".descripcion").text();

    $("#txtCodigo").val(codigo);
    $("#txtNombre").val(nombre);
    $("#txtStock").val(stock);
    $("#txtDescripcion").val(descripcion);
}

$(document).ready(function () {
    $("#myDataTable").DataTable();

    $('.btnOcultar').css("display", "none");

    $("#staticBackdrop").on("hidden.bs.modal", function () {
        $('form')[0].reset();
    });
    ;

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
function llenarFormulario(fila) {
    var idProyecto = $(fila).find(".id").text();
    var nombre = $(fila).find(".nombre").text();
    var valor = $(fila).find(".valor").text();
    var estado = $(fila).find(".estado").text();
    var municipio = $(fila).find(".municipioId").text();
    var departamento = $(fila).find(".departamentoId").text();
    var usuario = $(fila).find(".usuario").text();

    $("#txtIdP").val(idProyecto);
    $("#txtNombre").val(nombre);
    $("#txtValor").val(valor);
    $("#txtEstado option[selected]").removeAttr("selected");
    $(`#txtEstado option:contains(${estado})`).attr('selected', true);
    $("#txtUsuario option[selected]").removeAttr("selected");
    $(`#txtUsuario option:contains(${usuario})`).attr('selected', true);
    $("#txtIdMunicipio option[selected]").removeAttr("selected");
    $(`#txtIdMunicipio option:contains(${municipio})`).attr('selected', true);
    $("#txtIdDepartamento option[selected]").removeAttr("selected");
    $(`#txtIdDepartamento option:contains(${departamento})`).attr('selected', true);
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
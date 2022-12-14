function llenarFormulario(fila) {
    let id = $(fila).find(".id").text();
    let username = $(fila).find(".username").text();
    let password = $(fila).find(".password").text();
    let nivel = $(fila).find(".nivel").text();

    $("#txtID").val(id);
    $("#txtUsername").val(username);
    $("#txtPassword").val(password);
    $("#txtNivel option[selected]").removeAttr("selected");
    $("#txtNivel option:contains(" + nivel + ")").attr('selected', true);
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


function llenarFormulario(fila) {
    let id = $(fila).find(".id").text();
    let username = $(fila).find(".departamento").text();
    let password = $(fila).find(".empleados").text();
    let fotografia = $(fila).find(".fotografia").text();

    $("#txtId").val(id);
    $("#txtUsername").val(username);
    $("#txtPassword").val(password);
    $("#fotografia").val(fotografia);
}

$(document).ready(function () {
    $("#myDataTable").DataTable();

    $("#exampleModal").on("hidden.bs.modal", function () {
        $('form')[0].reset();
    });

    $(document).on('click', '.btnEditar', function () {
        llenarFormulario($(this).closest('tr'));
        $(".btnOcultar1").attr("disabled", "disabled");
        $(".btnOcultar").removeAttr("disabled");
    });

    $(document).on('click', '.btnEliminar', function () {
        llenarFormulario($(this).closest('tr'));
        $(".btnOcultar1").attr("disabled", "disabled");
        $(".btnOcultar").removeAttr("disabled");
    });

    $(document).on('click', '.btnAdd', function () {
        $(".btnOcultar").attr("disabled", "disabled");
        $(".btnOcultar1").removeAttr("disabled");
    });
});


$(document).ready(function () {
    // 保存表单
    $('.btn-save').click(function (e) {
        let _form = $('#flowform')
        let action = _form.attr("action");
        let json = {
            processDefinitionId: _form.attr('data-process-definition-id'),
            formId: _form.attr('data-form-id'),
            values: {}
        }
        let data = {};
        let value = _form.serializeArray();
        $.each(value, function (index, item) {
            data[item.name] = item.value;
        });
        json.values = data;
        $.ajax({
            url: action,
            method: "POST",
            data: json
        }).done(function ( data ) {
            window.location.href='/deltaflow/forms/#audit';
        }).fail(function (data) {
            console.log(data);
            $('.toast').toast('show');
        });
    })

});

$(document).ready(function () {
    // 保存表单
    $('.btn-save').click(function (e) {
        let _form = $('#flowform')
        let action = _form.attr("action");
        let json = {
            processDefinitionId: _form.attr('data-process-definition-id'),
            formId: _form.attr('data-form-id'),
            processInstanceId: _form.attr('data-process-instance-id'),
            taskId: _form.attr('data-task-id'),
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
            $('.toast').toast('show');
            setTimeout(function () {
                window.location.href='/deltaflow/forms/#audit';
            }, 1000)
        }).fail(function (data) {
            console.log(data);
            $('.toast').toast('show');
        });
    });

    function audit(outcome) {
        let _form = $('#flowform')
        let action = outcome === 'agree' ? '/deltaflow/task/agree' : '/deltaflow/task/reject';
        var json= {
            processInstanceId:'',
            taskId:'',
            formId:'',
            outcome:'',
            comment:'',
            values:{}
        }
        json.processInstanceId=_form.attr("data-process-instance-id");
        json.taskId=_form.attr("data-task-id");
        json.formId=_form.attr("data-form-id");
        json.comment=$('textarea[name=comment]').val();
        json.outcome=outcome;
        let data = {};
        let value = _form.serializeArray();
        $.each(value, function (index, item) {
            data[item.name] = item.value;
        });
        json.values = data;
        $.ajax({
            url: action,
            method: 'POST',
            data:json
        }).done(function (data) {
            $('.toast').toast('show');
            setTimeout(function () {
                window.location.href='/deltaflow/tasks';
            }, 1000)
        }).fail(function (response){
            console.log(data);
            $('.toast').toast('show');
        })
    }

    $('.btn-agree').click(function(){
        audit('agree')
    })
    $('.btn-reject').click(function(){
        audit('reject')
    })
});

package com.deltaww.flowapi.service.impl;

import com.deltaww.flowapi.common.Constant;
import com.deltaww.flowapi.common.FormState;
import com.deltaww.flowapi.service.FormUIService;
import org.flowable.form.api.FormInfo;
import org.flowable.form.api.FormModel;
import org.flowable.form.model.FormField;
import org.flowable.form.model.Option;
import org.flowable.form.model.OptionFormField;
import org.flowable.form.model.SimpleFormModel;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Nullable;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

@Service
public class FormUIServiceImpl implements FormUIService {
    @Override
    public String renderForm(FormInfo formInfo, FormState formState) {
        String formContent = getFormContent(formInfo, formState);
        String formFooter = getFormFooter((SimpleFormModel) formInfo.getFormModel(), formState);
        String formUI = getFormUI(formInfo);
        return formUI.replace("${formContent}", formContent).replace("${formFooter}", formFooter);
    }

    private String getFormContent(FormInfo formInfo, FormState formState) {
        SimpleFormModel formModel = (SimpleFormModel) formInfo.getFormModel();
        List<FormField> fields = formModel.getFields();
        StringBuilder stringBuilder = new StringBuilder();
        List<String> noNeedRender = new ArrayList<>();
        noNeedRender.add(Constant.SKIP_EXPRESSION);
        noNeedRender.add(Constant.FLOWABLE_SKIP_EXPRESSION_ENABLED);
        noNeedRender.add(Constant.MANAGER);
        if (formState == FormState.AUDIT) {
            noNeedRender.add(Constant.ASSIGNEE_LIST_VAR);
            noNeedRender.add(Constant.ASSIGNEE_LIST);
        }
        for (FormField field : fields) {
            if (!noNeedRender.contains(field.getId()) && !field.getId().startsWith(Constant.NO_RENDER)) {
                stringBuilder.append(getFieldUI(field, formState));
            }
        }
        if (formState.equals(FormState.AUDIT)) {
            stringBuilder.append("<div class=\"form-group row\">\n" +
                    "    <label class=\"col-sm-2 form-control-label\">Comment</label>\n" +
                    "                      <div class=\"col-sm-10\">\n" +
                    "    <textarea class=\"form-control\" name=\"comment\" rows=\"3\">" +
                    "</textarea>\n" +
                    "                      </div>\n" +
                    "  </div>");
        }
        return stringBuilder.toString();
    }

    private String getFieldUI(@Nullable FormField formField, FormState formState) {
        StringBuilder stringBuilder = new StringBuilder();
        switch (formField.getType()){
            case Constant.FieldType.TEXT : {
                String textUI = "<div class=\"form-group row ${hidden}\">\n" +
                        "                      <label class=\"col-sm-2 form-control-label\">${fieldName}</label>\n" +
                        "                      <div class=\"col-sm-10\">\n" +
                        "                        <input type=\"text\" name=\"${fieldId}\" value=\"${fieldValue}\"  placeholder=\"${placeholder}\" class=\"form-control\" ${readonly}>\n" +
                        "                      </div>\n" +
                        "                    </div>";
                if (formField.getId().startsWith(Constant.HIDDEN) || (formState == FormState.AUDIT && formField.getId().startsWith("ASSIGNEE"))) {
                    textUI = textUI.replace("${hidden}", "hidden");
                } else {
                    textUI = textUI.replace("${hidden}", "");
                }
                stringBuilder.append(textUI);
                break;
            }
            case Constant.FieldType.NUMBER : {
                stringBuilder.append("<div class=\"form-group row\">\n" +
                        "                      <label class=\"col-sm-2 form-control-label\">${fieldName}</label>\n" +
                        "                      <div class=\"col-sm-10\">\n" +
                        "                        <input type=\"number\" name=\"${fieldId}\" value=\"${fieldValue}\"  placeholder=\"${placeholder}\" class=\"form-control\" ${readonly}>\n" +
                        "                      </div>\n" +
                        "                    </div>");
                break;
            }
            case Constant.FieldType.DROPDOWN : {
                stringBuilder.append("<div class=\"form-group row\">\n" +
                        "<label class=\"col-sm-2 form-control-label\">${fieldName}</label>\n" +
                        "<div class=\"col-sm-10 mb-3\">\n" +
                        "<select name=\"${fieldId}\" class=\"form-control\" ${readonly}>\n");
                OptionFormField optionFormField = (OptionFormField) formField;
                for (Option option : optionFormField.getOptions()) {
                    stringBuilder.append("<option value=\"" + option.getName() + "\" " + (option.getName().equals(optionFormField.getValue()) ? " selected":" ") + ">");
                    stringBuilder.append(option.getName());
                    stringBuilder.append("</option>");
                }
                stringBuilder.append("</select>\n" +
                        "</div>\n" +
                        "</div>");
                break;
            }
            case Constant.FieldType.RADIO_BUTTONS : {
                OptionFormField optionFormField = (OptionFormField) formField;
                stringBuilder.append("<div class=\"form-group row\">\n" +
                        "                <label class=\"col-sm-2 form-control-label\">${fieldName}</label>\n" +
                        "                <div class=\"col-sm-10\">\n");
                for (Option option : optionFormField.getOptions()) {
                    stringBuilder.append("<div class=\"form-check form-check-inline\">\n");
                    stringBuilder.append("<input class=\"form-check-input\" name=\"${fieldId}\" id=\"" + option.getName()
                            + "\" type=\"radio\" value=\"" + option.getName() + "\" " + (option.getName().equals(optionFormField.getValue())? " checked":"") + ">");
                    stringBuilder.append("<label class=\"form-check-label\" for=\"" + option.getName() + "\">" + option.getName() + "</label>");
                    stringBuilder.append("</div>");
                }
                stringBuilder.append("</div>\n" +
                        "            </div>");
                break;
            }
            case Constant.FieldType.MULTILINETEXT : {
                String textUI = "<div class=\"form-group row ${hidden}\">\n" +
                        "    <label class=\"col-sm-2 form-control-label\">${fieldName}</label>\n" +
                        "                      <div class=\"col-sm-10\">\n" +
                        "    <textarea class=\"form-control\" name=\"${fieldId}\" rows=\"5\" placeholder=\"${placeholder}\" ${readonly}>${fieldValue}" +
                        "</textarea>\n" +
                        "                      </div>\n" +
                        "  </div>";
                if (formField.getId().startsWith(Constant.HIDDEN) || (formState == FormState.AUDIT && formField.getId().startsWith("ASSIGNEE"))) {
                    textUI = textUI.replace("${hidden}", "hidden");
                } else {
                    textUI = textUI.replace("${hidden}", "");
                }
                stringBuilder.append(textUI);
                break;
            }
            default: {
            }
        }

        String ui = stringBuilder.toString();
        ui = ui.replace("${fieldName}", formField.getName())
                .replace("${fieldId}", formField.getId())
                .replace("${fieldValue}", getFieldValue(formField))
                .replace("${placeholder}", getFieldPlaceholder(formField))
                .replace("${readonly}", (formField.isReadOnly() || formState.equals(FormState.AUDIT)) ? "readonly":"");
        return ui;
    }

    private String getFieldValue(FormField formField){
        String value = formField.getValue() != null ? formField.getValue().toString() : "";
        if (!StringUtils.hasLength(value) && formField.isReadOnly() && formField.getPlaceholder() != null) {
            value = formField.getPlaceholder();
        }
        return value;
    }

    private String getFieldPlaceholder(FormField formField){
        return (formField.getPlaceholder() != null && !formField.getPlaceholder().startsWith("${")) ? formField.getPlaceholder() : "";
    }


    private String getTitleUI(@Nullable FormInfo formInfo) {
        return null;
    }

    private String getFormUI(@Nullable FormInfo formInfo) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("<form id=\"flowform\" data-form-key=\"" + formInfo.getKey() + "\"")
                .append(" action=\"${action}\"")
                .append(" data-process-definition-id=\"${processDefinitionId}\"")
                .append(" data-process-instance-id=\"${processInstanceId}\"")
                .append(" data-form-id=\"" + formInfo.getId() + "\"")
                .append(" data-task-id=\"${taskId}\"")
                .append(" class=\"form-horizontal\">")
                .append("<input type=\"text\" name=\"processDefinitionId\" value=\"${processDefinitionId}\" class=\"form-control\" hidden>")
                .append("${formContent}")
                .append("<div class=\"line\"></div>\n" +
                        "${formFooter}</form>");
        return stringBuilder.toString();
    }

    private String getFormFooter(SimpleFormModel formModel, FormState formState){
        StringBuilder stringBuilder = new StringBuilder();
        StringBuilder outcomes = new StringBuilder();
        if (formState == FormState.START || formState == FormState.COMFIRM) {
            outcomes.append("                        <a type=\"button\" href=\"/deltaflow/forms\" class=\"btn btn-secondary\">Cancel</a>\n" +
                    "                        <a type=\"submit\" class=\"btn btn-primary btn-save\">Save Changes</a>\n");
        } else if (formState == FormState.AUDIT) {
            outcomes.append("<a type=\"submit\" class=\"btn  btn-info btn-agree\">")
                    .append("同意")
                    .append("</a>\n");
            outcomes.append("<a type=\"submit\" class=\"btn btn-danger btn-reject\">")
                    .append("退回")
                    .append("</a>\n")
                    .append("<a type=\"button\" href=\"/deltaflow/forms\" class=\"btn btn-secondary\">Cancel</a>\n");
        }
        stringBuilder.append("<div class=\"form-group row\">\n" +
                "<div class=\"col-sm-4 offset-sm-2\">\n")
                .append(outcomes.toString())
                .append("</div>\n")
                .append("</div>\n");
        return stringBuilder.toString();
    }
}

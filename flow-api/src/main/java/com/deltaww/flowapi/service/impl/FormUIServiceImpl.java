package com.deltaww.flowapi.service.impl;

import com.deltaww.flowapi.service.FormUIService;
import org.flowable.form.api.FormInfo;
import org.flowable.form.api.FormModel;
import org.flowable.form.model.FormField;
import org.flowable.form.model.SimpleFormModel;
import org.springframework.stereotype.Service;

import javax.annotation.Nullable;
import java.util.List;

@Service
public class FormUIServiceImpl implements FormUIService {
    @Override
    public String renderForm(FormInfo formInfo) {
        SimpleFormModel formModel = (SimpleFormModel) formInfo.getFormModel();
        List<FormField> fields = formModel.getFields();
        StringBuilder stringBuilder = new StringBuilder();
        for (FormField field : fields) {
            stringBuilder.append(getFieldUI(field));
        }
        return stringBuilder.toString();
    }


    public String getFieldUI(@Nullable FormField formField) {
        return null;
    }


    public String getTitleUI(@Nullable FormInfo formInfo) {
        return null;
    }

}

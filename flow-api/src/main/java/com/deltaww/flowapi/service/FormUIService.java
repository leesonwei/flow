package com.deltaww.flowapi.service;

import com.deltaww.flowapi.common.FormState;
import org.flowable.form.api.FormInfo;
import org.flowable.form.model.FormField;

import javax.annotation.Nullable;

/**
 * 将form的json数据渲染成UI格式
 */
public interface FormUIService {
    String renderForm(FormInfo formInfo, FormState formState);
}

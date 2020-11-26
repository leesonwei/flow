package com.deltaww.flowapi.common;

public enum FormState {
    /**
     * 表单状态, 1:开始表单, 0:审核表单
     */
    START(1, "start"),
    AUDIT(0, "audit"),
    COMFIRM(2, "comfirm");
    private int code;
    private String name;
    FormState(Integer code, String name){
        this.code = code;
        this.name = name;
    }
}

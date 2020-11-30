package com.deltaww.flowapi.common;

public class Constant {
    /**
     * 允许流程跳过任务
     */
    public static final String FLOWABLE_SKIP_EXPRESSION_ENABLED="_FLOWABLE_SKIP_EXPRESSION_ENABLED";
    /**
     * 跳过任务的表达式, 这两个值在流程启动时一定要设置
     */
    public static final String SKIP_EXPRESSION="_SKIP_";

    public static final String THEMYLEAF_PREFIX="deltaflow";

    public static final String OUTCOME="outcome";

    public static final String INITIATOR="initiator";
    public static final String MANAGER="manager";
    public static final String ADMIN="admin";
    public static final String USER="user";
    /**
     * ASSIGNEE开头, form状态是audit时隐藏
     */
    public static final String ASSIGNEE_LIST= "ASSIGNEE_LIST";
    public static final String ASSIGNEE_LIST_VAR="ASSIGNEE_LIST_VAR";
    /**
     * NO_RENDER开头,不渲染进入formui
     */
    public static final String NO_RENDER="NO_RENDER_";
    /**
     * HIDDEN开头, 隐藏
     */
    public static final String HIDDEN="HIDDEN_";

    public static class FieldType {
        public static final String TEXT="text";
        public static final String MULTILINETEXT="multi-line-text";
        public static final String DATE_="date";
        public static final String RADIO_BUTTONS = "radio-buttons";
        public static final String DROPDOWN = "dropdown";
        public static final String NUMBER="integer";
        public static final String UPLOAD="upload";
    }
}

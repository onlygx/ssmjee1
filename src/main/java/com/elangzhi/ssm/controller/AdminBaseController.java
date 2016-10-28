package com.elangzhi.ssm.controller;

import com.elangzhi.ssm.tools.ProjectConfig;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 基础页面访问
 * @author GaoXiang
 * @version 1.0
 */
public class AdminBaseController<T> {

    public Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    public ProjectConfig projectConfig;


}

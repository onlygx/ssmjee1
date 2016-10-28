package com.elangzhi.ssm.exception;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.elangzhi.modules.log.services.LogService;
import com.elangzhi.ssm.model.Account;
import com.elangzhi.ssm.model.Log;
import com.elangzhi.ssm.tools.Const;
import com.elangzhi.ssm.tools.UUIDFactory;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import java.util.Date;

/**
 * 
* 类名称：MyExceptionResolver.java
* 类描述：异常捕获
* @author GaoXiang
* @version 1.0
 */
public class MyExceptionResolver implements HandlerExceptionResolver{

    /**
     * 日志打印工具
     */
    private Logger logger = Logger.getLogger(this.getClass());

    /**
     * 日志存储Service
     */
    @Resource
    private LogService logService;

	@Override
	public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        logger.error("发现异常信息：");
        //尝试将异常写入日志
        try {
            saveLog(httpServletRequest,e.toString());
        } catch (Exception e1) {
            logger.error("异常写入日志失败");
        }
        e.printStackTrace();
		return new ModelAndView("error","exception",e);
	}

    /**
     * 异常写入日志
     * @param httpServletRequest 请求信息
     * @param content 异常内容
     * @throws Exception 失败
     */
	private void saveLog(HttpServletRequest httpServletRequest,String content) throws Exception {

        //读取session中的用户
        Account account = (Account) httpServletRequest.getSession().getAttribute(Const.ACCOUNT);
        //请求的IP
        String ip = httpServletRequest.getRemoteAddr();

        Log log = new Log();
        log.setId(UUIDFactory.getStringId());
        if(account != null){
            log.setAccountId(account.getId());
        }else{
            log.setAccountId("0");
        }
        log.setType(0);
        log.setSetTime(new Date());
        log.setContent(content);
        log.setMethod(httpServletRequest.getServletPath());
        log.setIp(ip);
        log.setParams(httpServletRequest.getQueryString());
        log.setStatus(0);
        //保存数据库
        logService.insert(log);
    }

}

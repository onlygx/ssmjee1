package com.elangzhi.ssm.services;

import com.elangzhi.common.config.Global;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 系统管理，安全相关实体的管理类,包括用户、角色、菜单.
 * @author Jiang Xue Li
 * @version 2016-10-25
 */
@Service
@Transactional(readOnly = true)
public class SystemService  {
    /**
     * 获取Key加载信息
     */
    public static boolean printKeyLoadMessage(){
        StringBuilder sb = new StringBuilder();
        sb.append("\r\n\r\n");
        sb.append("\r\n=================================▄︻┻┳═一…… ==================================\r\n");
        sb.append("\r\n*************************发起公司:济南锐途信息技术有限公司*************************\r\n");
        sb.append("\r\n    欢迎使用 "+ Global.getConfig("product.name")+"  - Powered By http://lianxinyi.com.cn\r\n");
        sb.append("\r\n       开发人员: 江雪立， 祥哥， 司建高， 景玭玭， 姜延鹏， 张先柱  感谢各位的辛勤付出       \r\n");
        sb.append("\r\n*************************合作公司:济南郎智信息技术有限公司*************************\r\n");
        sb.append("\r\n=================================▄︻┻┳═一…… ==================================\r\n");
        sb.append("\r\n\r\n");

        System.out.println(sb.toString());
        return true;
    }

}

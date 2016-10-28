package com.elangzhi.ssm.controller;

import com.elangzhi.common.utils.StringUtils;
import com.elangzhi.ssm.controller.json.Tip;
import com.elangzhi.ssm.model.Account;
import com.elangzhi.ssm.model.Admin;
import com.elangzhi.ssm.model.Power;
import com.elangzhi.ssm.services.AccountService;
import com.elangzhi.ssm.services.AdminService;
import com.elangzhi.ssm.services.PowerService;
import com.elangzhi.ssm.tools.Const;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 登陆
 * @version 1.0
 */

@Controller
@RequestMapping("/login")
public class LoginController {

    /**
     * 跳转到登陆页面
     * @return 登陆界面
     */
    @RequestMapping(value="/",method = RequestMethod.GET)
    public ModelAndView loginPage(){
        // 验证码操作
        return new ModelAndView("admin/login");
    }

    /**
     * 登陆验证
     * @param account 用户信息{userName,password}
     * @return success = true 登陆成功，
     * code = 1 用户不存在
     * code = 2 密码错误
     * code = 3 服务器拒绝登陆
     */
    @ResponseBody
    @RequestMapping(value="/admin",method = RequestMethod.POST)
    public Tip login(Account account, HttpSession session) throws Exception {

        if (StringUtils.isBlank(account.getUserName())) {
            return new Tip(1,"用户名不能为空");
        }
        if (StringUtils.isBlank(account.getPassword())) {
            return new Tip(2,"密码不能为空");
        }
        Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(account.getUserName(), DigestUtils.md5Hex(account.getPassword()).toCharArray());
        // 默认设置为记住密码，你可以自己在表单中加一个参数来控制
        token.setRememberMe(true);

        user.login(token);

    /*    Account acc = accountService.findByUserName(account.getUserName());

        //判断有没有账号
        if(acc == null){
            return new Tip(1);

        // 判断密码
        }else if(checkPwd(acc.getPassword(),account.getPassword())){

            //判断状态1 表示正常
            if(acc.getStatus() < 0){
                return new Tip(3);
            }

            session.setAttribute(Const.ACCOUNT,acc);

            // 检查分类并获取详细信息
            checkType(session,acc);

            //检查权限并缓存
            checkPower(session,acc.getId());

            return new Tip();
        }else{
            return new Tip(2);
        }
*/
        return new Tip();
    }

    /**
     * 检查并获取权限
     * @param session session对象
     * @param accountId 账户id
     */
    private void checkPower(HttpSession session,String accountId) {
        List<Power> powerList = powerService.findByAccountId(accountId);
        session.setAttribute(Const.POWER_LIST,powerList);
    }

    /**
     * 验证密码
     * @param pwd 真密码
     * @param param 参数密码
     * @return 验证结果
     */
    private boolean checkPwd(String pwd,String param){
        return pwd.equals(param);
    }

    /**
     * 检查分类并分类缓存详细信息
     */
    private void checkType(HttpSession session,Account resoult) throws Exception {
        // 判断类型 1 表示管理员
        if(resoult.getType() == 1){
            Admin admin = adminService.selectById(resoult.getInfoId());
            session.setAttribute(Const.ADMIN,admin);
        }
    }

    /**
     * 注销登陆
     * @return sussess 成功 ，code = 1 失败
     */
    @ResponseBody
    @RequestMapping(value="/logout",method = RequestMethod.POST)
    public Tip logout(HttpSession session){

        try {
            /*session.removeAttribute(Const.ACCOUNT);
            session.removeAttribute(Const.ADMIN);*/
            Subject subject = SecurityUtils.getSubject();
            subject.logout();
            return new Tip();
        } catch (Exception e) {
            e.printStackTrace();
            return new Tip(1);
        }

    }




    //--------------------------------- property --------------------------------
    @Resource
    private AccountService accountService;

    @Resource
    private AdminService adminService;

    @Resource
    private PowerService powerService;
}

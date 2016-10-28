package com.elangzhi.ssm.shiro;

import com.elangzhi.common.utils.StringUtils;
import com.elangzhi.ssm.dao.AccountDao;
import com.elangzhi.ssm.dao.PowerDao;
import com.elangzhi.ssm.dao.RoleDao;
import com.elangzhi.ssm.model.Account;
import com.elangzhi.ssm.services.RoleService;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author GaoXiang
 * @version 1.0
 * @since 2016/10/28.
 */
@Component
public class AdminRealm extends AuthorizingRealm {

    private static final Logger LOGGER = LogManager.getLogger(AdminRealm.class);

    @Resource
    private PowerDao powerDao;

    @Resource
    private RoleDao roleDao;

    @Resource
    private RoleService roleService;

    @Resource
    private AccountDao accountDao;

    /**
     * Shiro权限认证
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        ShiroAdmin shiroAdmin = (ShiroAdmin) principalCollection.getPrimaryPrincipal();
        List<String> roleList = shiroAdmin.getRoleList();
        Set<String> urlSet = new HashSet<String>();
        for (String roleId : roleList) {
            List<Map> roleResourceList = powerDao.findMapByRoleId(roleId);
            if (roleResourceList != null) {
                for (Map<String, String> map : roleResourceList) {
                    if (StringUtils.isNotBlank(map.get("url"))) {
                        urlSet.add(map.get("url"));
                    }
                }
            }
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addStringPermissions(urlSet);
        return info;
    }

    /**
     * Shiro登录认证(
     * 原理：
     * 用户提交 用户名和密码
     * --- shiro 封装令牌
     * ---- realm 通过用户名将密码查询返回
     * ---- shiro 自动去比较查询出密码和用户输入密码是否一致
     * ---- 进行登陆控制 )
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        LOGGER.info("Shiro开始登录认证");
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        LOGGER.info(token.getUsername());
        Account account = null;
        try {
            account = accountDao.findByUserName(token.getUsername());
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 账号不存在
        if (account == null) {
            return null;
        }
        // 账号未启用
        if (account.getStatus() == 0) {
            return null;
        }
        List<String> roleList = roleDao.findIdListByAccountId(account.getId());
        ShiroAdmin shiroUser = new ShiroAdmin(account.getId(), account.getUserName(), roleList);
        // 认证缓存信息
        return new SimpleAuthenticationInfo(shiroUser, account.getPassword().toCharArray(), getName());
    }

    public PowerDao getPowerDao() {
        return powerDao;
    }

    public void setPowerDao(PowerDao powerDao) {
        this.powerDao = powerDao;
    }

    public RoleDao getRoleDao() {
        return roleDao;
    }

    public void setRoleDao(RoleDao roleDao) {
        this.roleDao = roleDao;
    }

    public AccountDao getAccountDao() {
        return accountDao;
    }

    public void setAccountDao(AccountDao accountDao) {
        this.accountDao = accountDao;
    }
}

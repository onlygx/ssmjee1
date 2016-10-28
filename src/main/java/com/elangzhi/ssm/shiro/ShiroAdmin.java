package com.elangzhi.ssm.shiro;

import java.io.Serializable;
import java.util.List;

/**
 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息
 * @author GaoXiang
 * @version 1.0
 * @since 2016/10/28.
 */
public class ShiroAdmin implements Serializable {

    private static final long serialVersionUID = -1373760761780840081L;

    private String id;
    private String userName;
    private List<String> roleList;


    ShiroAdmin(String id, String userName, List<String> roleList) {
        this.id = id;
        this.userName = userName;
        this.roleList = roleList;
    }

    /**
     * 本函数输出将作为默认的<shiro:principal/>输出.
     */
    @Override
    public String toString() {
        return userName;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public List<String> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<String> roleList) {
        this.roleList = roleList;
    }

}

package com.elangzhi.ssm.services;

import com.elangzhi.ssm.dao.AccountDao;
import com.elangzhi.ssm.model.Account;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 账户 Service
 * @author GaoXiang
 * @version 1.0
 */
@Service
public class AccountService  extends BaseService<Account>{

    @Resource
    private AccountDao accountDao;

    /**
     * 根据账号获用户信息
     * @param userName 用户账号
     * @return 用户实体
     */
    public Account findByUserName(String userName) {
        try {
            return accountDao.findByUserName(userName);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 保存数据
     * @param account 实体对象
     * @return 实体id
     * @throws Exception 数据保存异常
     */
    public Integer insert(Account account) throws Exception {
        return accountDao.insert(account);
    }

    /**
     * 根据 id 修改
     * @param account 带id的实体对象
     * @return 受影响的行数
     * @throws Exception 数据修改异常
     */
    public Integer updateById(Account account) throws Exception {
        return accountDao.updateById(account);
    }

    /**
     * 根据 id 删除
     * @param id 数据id
     * @return 受影响的行数
     * @throws Exception 数据删除异常
     */
    public Integer deleteById(String id) throws Exception {
        return accountDao.deleteById(id);
    }

    /**
     * 根据 id 查找
     * @param id 实体id
     * @return 实体
     * @throws Exception 查询异常
     */
    public Account selectById(String id) throws Exception {
        return accountDao.selectById(id);
    }

    /**
     * 根据 id 批量删除
     * @param ids 要删除的id
     * @return 影响的行数
     * @throws Exception 数据删除异常
     */
    public Integer deleteByIds(List<String> ids) throws Exception {
        return accountDao.deleteByIds(ids);
    }

    /**
     * 查询列表
     * @param map 参数
     * @return 列表
     * @throws Exception 数据返回异常
     */
    public PageInfo<Account> list(Map map) throws Exception {
        return accountDao.list(map);
    }

    /**
     * 查询列表 带分页
     * @param map 参数
     * @param page 页码
     * @param size 每页大小
     * @return 列表
     * @throws Exception 数据返回异常
     */
    public PageInfo<Account> list(Map map,int page,int size) throws Exception {
        return accountDao.list(map,page,size);
    }

}

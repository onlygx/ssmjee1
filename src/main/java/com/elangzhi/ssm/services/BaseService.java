package com.elangzhi.ssm.services;

import com.elangzhi.ssm.dao.LzDao;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 基础数据访问服务封装
 * @author GaoXiang
 * @version 2.0
 */
@Service
public class BaseService<T> extends LzDao<T>{



}

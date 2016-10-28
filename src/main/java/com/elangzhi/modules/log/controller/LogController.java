package com.elangzhi.modules.log.controller;

import com.elangzhi.ssm.model.Log;
import com.elangzhi.modules.log.services.LogService;
import com.elangzhi.ssm.annotation.AdminControllerLog;
import com.elangzhi.ssm.controller.AdminBaseController;
import com.elangzhi.ssm.controller.json.Tip;
import com.elangzhi.ssm.controller.util.ParamMap;
import com.elangzhi.ssm.tools.UUIDFactory;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
* 日志管理 Controller
* @author GaoXiang
* @version 1.0
*/
@Controller
@RequestMapping("/log")
public class LogController extends AdminBaseController<Log> {


    /**
     * 进入日志添加页面 携带一个生成的id --> longId
     * @param model 返回的实体容器
     * @return 添加页面
     */
    @RequestMapping(value="/add")
    public ModelAndView add(ModelMap model){

        model.put("longId", UUIDFactory.getStringId());
        return new ModelAndView("admin/log/add",model);
    }


    /**
     * 进入日志编辑页面
     * @param model 返回日志的容器
     * @param id 日志id
     * @return 编辑页面
     * @throws Exception 进入编辑页面失败
     */
    @RequestMapping(value="/edit")
    public ModelAndView edit(ModelMap model, @RequestParam String id) throws Exception {

        model.put("data",logService.selectById(id));
        return new ModelAndView("admin/log/edit",model);
    }


    /**
     * 日志添加
     * @param log 带id的日志对象
     * @return 成功状态
     * @throws Exception 数据添加异常
     */
    @RequestMapping(value="/save")
    @ResponseBody
    @AdminControllerLog(description = "添加日志" )
    public Tip save(Log log) throws Exception {

        logService.insert(log);
        return new Tip();
    }


    /**
     * 根据 id 修改日志
     * @param log 带id的日志对象
     * @return 成功状态
     * @throws Exception 数据修改异常
     */
    @RequestMapping(value="/update")
    @ResponseBody
    @AdminControllerLog(description = "修改日志" )
    public Tip update(Log log) throws Exception {

        logService.updateById(log);
        return new Tip();
    }


    /**
     * 根据 id 删除日志
     * @param id 日志id
     * @return 成功状态
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    @AdminControllerLog(description = "删除日志" )
    public Tip delete(@RequestParam String id) throws Exception {

        logService.deleteById(id);
        return new Tip();
    }


    /**
     * 根据 id 列表批量删除
     * @param ids 日志id List
     * @return 成功状态
     */
    @RequestMapping(value="/deleteByIds")
    @ResponseBody
    @AdminControllerLog(description = "批量删除日志" )
    public Tip deleteByIds(@RequestParam("ids") List<String> ids) throws Exception {

        logService.deleteByIds(ids);
        return new Tip();
    }


    /**
     * 根据 id 查找日志
     * @param id 日志id
     * @return 日志对象 json
     * @throws Exception 查找日志失败
     */
    @RequestMapping(value="/findJson")
    @ResponseBody
    public Log find(@RequestParam String id) throws Exception {

        return logService.selectById(id);
    }


    /**
     * 获取日志列表 获取全部 不分页
     * @param request 请求参数
     * @return 日志列表页面
     * @throws Exception 获取日志列表失败
     */
    @RequestMapping(value="/all")
    public ModelAndView all(HttpServletRequest request) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Log> pageInfo =  logService.list(paramMap);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("admin/log/list",paramMap);
    }


    /**
     * 获取日志列表 分页
     * @param request 请求参数
     * @param page 第几页
     * @param size 每页大小
     * @return 日志列表页面
     * @throws Exception 获取日志列表失败
     */
    @RequestMapping(value="/list")
    public ModelAndView list(HttpServletRequest request,@RequestParam Integer page, @RequestParam Integer size) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Log> pageInfo =  logService.list(paramMap,page,size);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("admin/log/list",paramMap);
    }







    //---------------------------- property -------------------------------

    @Resource
    private LogService logService;

}

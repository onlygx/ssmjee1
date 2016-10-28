package com.elangzhi.ssm.controller.account;

import com.elangzhi.ssm.model.Settings;
import com.elangzhi.ssm.annotation.AdminControllerLog;
import com.elangzhi.ssm.controller.AdminBaseController;
import com.elangzhi.ssm.controller.json.Tip;
import com.elangzhi.ssm.controller.util.ParamMap;
import com.elangzhi.ssm.services.SettingsService;
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
 * 设置管理 Controller
 * @author GaoXiang
 * @version 1.0
 */
@Controller
@RequestMapping("/settings")
public class SettingsController extends AdminBaseController<Settings> {


    /**
     * 进入设置添加页面 携带一个生成的id --> longId
     * @param model 返回的实体容器
     * @return 添加页面
     */
    @RequestMapping(value="/add")
    public ModelAndView add(ModelMap model){

        model.put("longId", UUIDFactory.getStringId());
        return new ModelAndView("admin/settings/add",model);
    }


    /**
     * 进入设置编辑页面
     * @param model 返回设置的容器
     * @param id 设置id
     * @return 编辑页面
     * @throws Exception 进入编辑页面失败
     */
    @RequestMapping(value="/edit")
    public ModelAndView edit(ModelMap model, @RequestParam String id) throws Exception {

        model.put("data",settingsService.selectById(id));
        return new ModelAndView("admin/settings/edit",model);
    }


    /**
     * 设置添加
     * @param settings 带id的设置对象
     * @return 成功状态
     * @throws Exception 数据添加异常
     */
    @RequestMapping(value="/save")
    @ResponseBody
    @AdminControllerLog(description = "添加设置" )
    public Tip save(Settings settings) throws Exception {

        settingsService.insert(settings);
        return new Tip();
    }


    /**
     * 根据 id 修改设置
     * @param settings 带id的设置对象
     * @return 成功状态
     * @throws Exception 数据修改异常
     */
    @RequestMapping(value="/update")
    @ResponseBody
    @AdminControllerLog(description = "修改设置" )
    public Tip update(Settings settings) throws Exception {

        settingsService.updateById(settings);
        return new Tip();
    }


    /**
     * 根据 id 删除设置
     * @param id 设置id
     * @return 成功状态
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    @AdminControllerLog(description = "删除设置" )
    public Tip delete(@RequestParam String id) throws Exception {

        settingsService.deleteById(id);
        return new Tip();
    }


    /**
     * 根据 id 列表批量删除
     * @param ids 设置id List
     * @return 成功状态
     */
    @RequestMapping(value="/deleteByIds")
    @ResponseBody
    @AdminControllerLog(description = "批量删除设置" )
    public Tip deleteByIds(@RequestParam("ids") List<String> ids) throws Exception {

        settingsService.deleteByIds(ids);
        return new Tip();
    }


    /**
     * 根据 id 查找设置
     * @param id 设置id
     * @return 设置对象 json
     * @throws Exception 查找设置失败
     */
    @RequestMapping(value="/findJson")
    @ResponseBody
    public Settings find(@RequestParam String id) throws Exception {

        return settingsService.selectById(id);
    }


    /**
     * 获取设置列表 获取全部 不分页
     * @param request 请求参数
     * @return 设置列表页面
     * @throws Exception 获取设置列表失败
     */
    @RequestMapping(value="/all")
    public ModelAndView all(HttpServletRequest request) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Settings> pageInfo =  settingsService.list(paramMap);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("admin/settings/list",paramMap);
    }


    /**
     * 获取设置列表 分页
     * @param request 请求参数
     * @param page 第几页
     * @param size 每页大小
     * @return 设置列表页面
     * @throws Exception 获取设置列表失败
     */
    @RequestMapping(value="/list")
    public ModelAndView list(HttpServletRequest request,@RequestParam Integer page, @RequestParam Integer size) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Settings> pageInfo =  settingsService.list(paramMap,page,size);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("admin/settings/list",paramMap);
    }







    //---------------------------- property -------------------------------

    @Resource
    private SettingsService settingsService;

}

package com.elangzhi.ssm.controller.power;

import com.elangzhi.ssm.annotation.AdminControllerLog;
import com.elangzhi.ssm.controller.AdminBaseController;
import com.elangzhi.ssm.controller.json.Tip;
import com.elangzhi.ssm.controller.util.ParamMap;
import com.elangzhi.ssm.model.Power;
import com.elangzhi.ssm.model.RolePower;
import com.elangzhi.ssm.services.PowerService;
import com.elangzhi.ssm.services.RolePowerService;
import com.elangzhi.ssm.tools.UUIDFactory;
import com.github.pagehelper.PageInfo;
import com.sun.tools.javac.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 权限 Controller
 * @author GaoXiang
 * @version 1.0
 */
@Controller
@RequestMapping("/power")
public class PowerController extends AdminBaseController<Power> {


    public Tip save(Power power) throws Exception {

        RolePower rolePower = new RolePower();
        rolePower.setId(UUIDFactory.getStringId());
        rolePower.setPowerId(power.getId());
        rolePower.setRoleId("888888");
        rolePowerService.insert(rolePower);
        powerService.insert(power);
        return new Tip();
    }


    /**
     * 获取全部权限，主要用于权限父类选择
     * @return 全部权限列表，第一层list的parentId 为 0
     * @throws Exception 返回全部权限列表错误
     */
    @RequestMapping("/listAll")
    public ModelAndView listAll() throws Exception {
        return new ModelAndView("admin/power/chooseParent","powerList",powerService.listAll());
    }

    /**
     * 统计这一个父类下的权限有多少个，用于判断该权限排序
     * @param request 请求参数
     * @return 统计结果
     * @throws Exception 权限个数统计错误
     */
    @RequestMapping("/countByParentId")
    @ResponseBody
    public Integer countByParentId(HttpServletRequest request) throws Exception {
        ParamMap paramMap = new ParamMap(request);
        PageInfo<Power> pageInfo = powerService.list(paramMap);
        return pageInfo.getList().size();
    }


    /**
     * 进入权限添加页面 携带一个生成的id --> longId
     * @param model 返回的实体容器
     * @return 添加页面
     */
    @RequestMapping(value="/add")
    public ModelAndView add(ModelMap model){

        model.put("longId", UUIDFactory.getStringId());
        return new ModelAndView("admin/power/add",model);
    }


    /**
     * 进入权限编辑页面
     * @param model 返回权限的容器
     * @param id 权限id
     * @return 编辑页面
     * @throws Exception 进入编辑页面失败
     */
    @RequestMapping(value="/edit")
    public ModelAndView edit(ModelMap model, @RequestParam String id) throws Exception {

        model.put("data",powerService.selectById(id));
        return new ModelAndView("admin/power/edit",model);
    }



    /**
     * 根据 id 修改权限
     * @param power 带id的权限对象
     * @return 成功状态
     * @throws Exception 数据修改异常
     */
    @RequestMapping(value="/update")
    @ResponseBody
    @AdminControllerLog(description = "修改权限" )
    public Tip update(Power power) throws Exception {

        powerService.updateById(power);
        return new Tip();
    }


    /**
     * 根据 id 删除权限
     * @param id 权限id
     * @return 成功状态
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    @AdminControllerLog(description = "删除权限" )
    public Tip delete(@RequestParam String id) throws Exception {

        powerService.deleteById(id);
        return new Tip();
    }


    /**
     * 根据 id 列表批量删除
     * @param ids 权限id List
     * @return 成功状态
     */
    @RequestMapping(value="/deleteByIds")
    @ResponseBody
    @AdminControllerLog(description = "批量删除权限" )
    public Tip deleteByIds(@RequestParam("ids") List<String> ids) throws Exception {

        powerService.deleteByIds(ids);
        return new Tip();
    }


    /**
     * 根据 id 查找权限
     * @param id 权限id
     * @return 权限对象 json
     * @throws Exception 查找权限失败
     */
    @RequestMapping(value="/findJson")
    @ResponseBody
    public Power find(@RequestParam String id) throws Exception {

        return powerService.selectById(id);
    }


    /**
     * 获取权限列表 获取全部 不分页
     * @param request 请求参数
     * @return 权限列表页面
     * @throws Exception 获取权限列表失败
     */
    @RequestMapping(value="/all")
    public ModelAndView all(HttpServletRequest request) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Power> pageInfo =  powerService.list(paramMap);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("admin/power/list",paramMap);
    }


    /**
     * 获取权限列表 分页
     * @param request 请求参数
     * @param page 第几页
     * @param size 每页大小
     * @return 权限列表页面
     * @throws Exception 获取权限列表失败
     */
    @RequestMapping(value="/list")
    public ModelAndView list(HttpServletRequest request, @RequestParam Integer page, @RequestParam Integer size) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Power> pageInfo =  powerService.list(paramMap,page,size);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("admin/power/list",paramMap);
    }


    //---------------------------------- property ------------------------------------------
    @Resource
    PowerService powerService;

    @Resource
    private RolePowerService rolePowerService;
}

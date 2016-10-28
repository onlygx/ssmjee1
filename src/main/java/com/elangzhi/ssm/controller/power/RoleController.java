package com.elangzhi.ssm.controller.power;

import com.elangzhi.ssm.annotation.AdminControllerLog;
import com.elangzhi.ssm.controller.AdminBaseController;
import com.elangzhi.ssm.controller.json.Tip;
import com.elangzhi.ssm.controller.util.ParamMap;
import com.elangzhi.ssm.model.Role;
import com.elangzhi.ssm.services.RoleService;
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
 * 角色 Controller
 * @author GaoXiang
 * @version 1.0
 */
@Controller
@RequestMapping("/role")
public class RoleController extends AdminBaseController<Role>{


    /**
     * 进入角色添加页面 携带一个生成的id --> longId
     * @param model 返回的实体容器
     * @return 添加页面
     */
    @RequestMapping(value="/add")
    public ModelAndView add(ModelMap model){

        model.put("longId", UUIDFactory.getStringId());
        return new ModelAndView("admin/role/add",model);
    }


    /**
     * 进入角色编辑页面
     * @param model 返回角色的容器
     * @param id 角色id
     * @return 编辑页面
     * @throws Exception 进入编辑页面失败
     */
    @RequestMapping(value="/edit")
    public ModelAndView edit(ModelMap model, @RequestParam String id) throws Exception {

        model.put("data",roleService.selectById(id));
        return new ModelAndView("admin/role/edit",model);
    }


    /**
     * 角色添加
     * @param role 带id的角色对象
     * @return 成功状态
     * @throws Exception 数据添加异常
     */
    @RequestMapping(value="/save")
    @ResponseBody
    @AdminControllerLog(description = "添加角色" )
    public Tip save(Role role) throws Exception {

        roleService.insert(role);
        return new Tip();
    }


    /**
     * 根据 id 修改角色
     * @param role 带id的角色对象
     * @return 成功状态
     * @throws Exception 数据修改异常
     */
    @RequestMapping(value="/update")
    @ResponseBody
    @AdminControllerLog(description = "修改角色" )
    public Tip update(Role role) throws Exception {

        roleService.updateById(role);
        return new Tip();
    }


    /**
     * 根据 id 删除角色
     * @param id 角色id
     * @return 成功状态
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    @AdminControllerLog(description = "删除角色" )
    public Tip delete(@RequestParam String id) throws Exception {

        roleService.deleteById(id);
        return new Tip();
    }


    /**
     * 根据 id 列表批量删除
     * @param ids 角色id List
     * @return 成功状态
     */
    @RequestMapping(value="/deleteByIds")
    @ResponseBody
    @AdminControllerLog(description = "批量删除角色" )
    public Tip deleteByIds(@RequestParam("ids") List<String> ids) throws Exception {

        roleService.deleteByIds(ids);
        return new Tip();
    }


    /**
     * 根据 id 查找角色
     * @param id 角色id
     * @return 角色对象 json
     * @throws Exception 查找角色失败
     */
    @RequestMapping(value="/findJson")
    @ResponseBody
    public Role find(@RequestParam String id) throws Exception {

        return roleService.selectById(id);
    }


    /**
     * 获取角色列表 获取全部 不分页
     * @param request 请求参数
     * @return 角色列表页面
     * @throws Exception 获取角色列表失败
     */
    @RequestMapping(value="/all")
    public ModelAndView all(HttpServletRequest request) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Role> pageInfo =  roleService.list(paramMap);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("admin/role/list",paramMap);
    }


    /**
     * 获取角色列表 分页
     * @param request 请求参数
     * @param page 第几页
     * @param size 每页大小
     * @return 角色列表页面
     * @throws Exception 获取角色列表失败
     */
    @RequestMapping(value="/list")
    public ModelAndView list(HttpServletRequest request, @RequestParam Integer page, @RequestParam Integer size) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<Role> pageInfo =  roleService.list(paramMap,page,size);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("admin/role/list",paramMap);
    }


    //----------------------------- property ----------------------------------
    @Resource
    private RoleService roleService;
}

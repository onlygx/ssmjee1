package com.elangzhi.modules.${lower}.controller;

import ${modelPackage};
import ${servicePackage};
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
* ${modelName}管理 Controller
* @author GaoXiang
* @version 1.0
*/
@Controller
@RequestMapping("/${lower}")
public class ${upper}Controller extends AdminBaseController<${upper}> {


    /**
     * 进入${modelName}添加页面 携带一个生成的id --> longId
     * @param model 返回的实体容器
     * @return 添加页面
     */
    @RequestMapping(value="/add")
    public ModelAndView add(ModelMap model){

        model.put("longId", UUIDFactory.getStringId());
        return new ModelAndView("admin/${lower}/add",model);
    }


    /**
     * 进入${modelName}编辑页面
     * @param model 返回${modelName}的容器
     * @param id ${modelName}id
     * @return 编辑页面
     * @throws Exception 进入编辑页面失败
     */
    @RequestMapping(value="/edit")
    public ModelAndView edit(ModelMap model, @RequestParam String id) throws Exception {

        model.put("data",${lower}Service.selectById(id));
        return new ModelAndView("admin/${lower}/edit",model);
    }


    /**
     * ${modelName}添加
     * @param ${lower} 带id的${modelName}对象
     * @return 成功状态
     * @throws Exception 数据添加异常
     */
    @RequestMapping(value="/save")
    @ResponseBody
    @AdminControllerLog(description = "添加${modelName}" )
    public Tip save(${upper} ${lower}) throws Exception {

        ${lower}Service.insert(${lower});
        return new Tip();
    }


    /**
     * 根据 id 修改${modelName}
     * @param ${lower} 带id的${modelName}对象
     * @return 成功状态
     * @throws Exception 数据修改异常
     */
    @RequestMapping(value="/update")
    @ResponseBody
    @AdminControllerLog(description = "修改${modelName}" )
    public Tip update(${upper} ${lower}) throws Exception {

        ${lower}Service.updateById(${lower});
        return new Tip();
    }


    /**
     * 根据 id 删除${modelName}
     * @param id ${modelName}id
     * @return 成功状态
     */
    @RequestMapping(value="/delete")
    @ResponseBody
    @AdminControllerLog(description = "删除${modelName}" )
    public Tip delete(@RequestParam String id) throws Exception {

        ${lower}Service.deleteById(id);
        return new Tip();
    }


    /**
     * 根据 id 列表批量删除
     * @param ids ${modelName}id List
     * @return 成功状态
     */
    @RequestMapping(value="/deleteByIds")
    @ResponseBody
    @AdminControllerLog(description = "批量删除${modelName}" )
    public Tip deleteByIds(@RequestParam("ids") List<String> ids) throws Exception {

        ${lower}Service.deleteByIds(ids);
        return new Tip();
    }


    /**
     * 根据 id 查找${modelName}
     * @param id ${modelName}id
     * @return ${modelName}对象 json
     * @throws Exception 查找${modelName}失败
     */
    @RequestMapping(value="/findJson")
    @ResponseBody
    public ${upper} find(@RequestParam String id) throws Exception {

        return ${lower}Service.selectById(id);
    }


    /**
     * 获取${modelName}列表 获取全部 不分页
     * @param request 请求参数
     * @return ${modelName}列表页面
     * @throws Exception 获取${modelName}列表失败
     */
    @RequestMapping(value="/all")
    public ModelAndView all(HttpServletRequest request) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<${upper}> pageInfo =  ${lower}Service.list(paramMap);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("admin/${lower}/list",paramMap);
    }


    /**
     * 获取${modelName}列表 分页
     * @param request 请求参数
     * @param page 第几页
     * @param size 每页大小
     * @return ${modelName}列表页面
     * @throws Exception 获取${modelName}列表失败
     */
    @RequestMapping(value="/list")
    public ModelAndView list(HttpServletRequest request,@RequestParam Integer page, @RequestParam Integer size) throws Exception {

        ParamMap paramMap = new ParamMap(request);
        PageInfo<${upper}> pageInfo =  ${lower}Service.list(paramMap,page,size);
        paramMap.put("pageInfo",pageInfo);
        return new ModelAndView("admin/${lower}/list",paramMap);
    }







    //---------------------------- property -------------------------------

    @Resource
    private ${upper}Service ${lower}Service;

}

package com.neuedu.online.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.neuedu.common.annotation.Anonymous;
import com.neuedu.common.core.controller.BaseController;
import com.neuedu.common.core.domain.AjaxResult;
import com.neuedu.common.utils.SecurityUtils;
import com.neuedu.online.domain.OnlineMb;
import com.neuedu.online.service.IOnlineMbService;
import com.neuedu.online.utils.SqlMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 在线接口
 * 
 * @author Dftre
 * @date 2024-01-26
 */
@RestController
@Anonymous
@RequestMapping("/online")
public class OnLineController extends BaseController {
    @Autowired
    private IOnlineMbService onlineMbService;


    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    public Map<String, Object> getParams(HashMap<String, Object> params, HashMap<String, Object> data) {
        Map<String, Object> object = new HashMap<>();
        HashMap<String, Object> object_params = new HashMap<String, Object>();
        String keyregex = "params\\[(.*?)\\]";
        Pattern pattern = Pattern.compile(keyregex);
        if (params != null) {
            params.keySet().forEach(key -> {
                Matcher matcher = pattern.matcher(key);
                if (matcher.find()) {
                    object_params.put(matcher.group(1), params.get(key));
                } else {
                    object.put(key, params.get(key));
                }
            });
        }
        if (data != null) {
            if (data.containsKey("params")) {
                object_params.putAll((HashMap<String, Object>) data.get("params"));
                data.remove("params");
            }
            object.putAll(data);
        }
        object.put("params", object_params);
        return object;
    }

    public Boolean checkPermission(String permissionType,String permissionValue) {
        if (permissionType == null)
            return true;

        switch (permissionType){
            default: return true;
        }

    }

    public Object processingMapper(String sqlContext, String actuatot, Map<String, Object> params) {
        String sql = "<script>\n" + sqlContext + "\n</script>";
        SqlSession sqlSession = sqlSessionFactory.openSession();
        SqlMapper sqlMapper = new SqlMapper(sqlSession);
        Object res = null;
            switch (actuatot){
            case "selectList": res= success(sqlMapper.selectList(sql, params)); break;
            case "insert":res= toAjax(sqlMapper.insert(sql, params)); break;
            case "selectOne":res= success(sqlMapper.selectOne(sql, params)); break;
            case "update":res= toAjax(sqlMapper.update(sql, params)); break;
            case "delete":res= toAjax(sqlMapper.delete(sql, params)); break;
            default:AjaxResult.error(500, "系统错误，执行器错误");
        }
        sqlSession.close();
        return res;
    }

    @RequestMapping("/api/**")
    public Object api(@RequestParam(required = false) HashMap<String, Object> params,
            @RequestBody(required = false) HashMap<String, Object> data, HttpServletRequest request,
            HttpServletResponse response) {
        OnlineMb selectOnlineMb = new OnlineMb();
        selectOnlineMb.setPath(request.getRequestURI().replace("/online/api", ""));
        selectOnlineMb.setMethod(request.getMethod());

        Map<String, Object> object = getParams(params, data);

        List<OnlineMb> selectOnlineMbList = onlineMbService.selectOnlineMbList(selectOnlineMb);
        if (selectOnlineMbList.size() == 0) {
            return AjaxResult.error("没有资源" + selectOnlineMb.getPath());
        } else if (selectOnlineMbList.size() > 1) {
            return AjaxResult.error(500, "系统错误，在线接口重复");
        } else {
            OnlineMb onlineMb = selectOnlineMbList.get(0);
            if (!checkPermission(onlineMb.getPermissionType(),onlineMb.getPermissionValue()))
                return AjaxResult.error(403, "没有权限，请联系管理员授权");

            if (onlineMb.getDeptId() != null && onlineMb.getDeptId().equals("1")) {
                object.put("deptId", SecurityUtils.getDeptId());
            }
            if (onlineMb.getUserId() != null && onlineMb.getUserId().equals("1")) {
                object.put("userId", SecurityUtils.getUserId());
            }

            return processingMapper(onlineMb.getSql(), onlineMb.getActuator(), object);
        }
    }

}

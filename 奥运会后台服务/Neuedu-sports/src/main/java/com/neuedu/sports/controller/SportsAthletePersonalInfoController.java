package com.neuedu.sports.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.neuedu.common.annotation.Log;
import com.neuedu.common.core.controller.BaseController;
import com.neuedu.common.core.domain.AjaxResult;
import com.neuedu.common.enums.BusinessType;
import com.neuedu.sports.domain.SportsAthletePersonalInfo;
import com.neuedu.sports.service.ISportsAthletePersonalInfoService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 运动员管理-个人信息管理Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/athletes/athletesPersonalInfo")
@Tag(name = "【运动员管理-个人信息管理】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAthletePersonalInfoController extends BaseController
{
    private final ISportsAthletePersonalInfoService sportsAthletePersonalInfoService;

    /**
     * 查询运动员管理-个人信息管理列表
     */
    @Operation(summary = "查询运动员管理-个人信息管理列表")
    @PreAuthorize("@ss.hasPermi('athletes:athletesPersonalInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsAthletePersonalInfo sportsAthletePersonalInfo)
    {
        startPage();
        List<SportsAthletePersonalInfo> list = sportsAthletePersonalInfoService.selectSportsAthletePersonalInfoList(sportsAthletePersonalInfo);
        return getDataTable(list);
    }

    /**
     * 导出运动员管理-个人信息管理列表
     */
    @Operation(summary = "导出运动员管理-个人信息管理列表")
    @PreAuthorize("@ss.hasPermi('athletes:athletesPersonalInfo:export')")
    @Log(title = "运动员管理-个人信息管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsAthletePersonalInfo sportsAthletePersonalInfo)
    {
        List<SportsAthletePersonalInfo> list = sportsAthletePersonalInfoService.selectSportsAthletePersonalInfoList(sportsAthletePersonalInfo);
        ExcelUtil<SportsAthletePersonalInfo> util = new ExcelUtil<SportsAthletePersonalInfo>(SportsAthletePersonalInfo.class);
        util.exportExcel(response, list, "运动员管理-个人信息管理数据");
    }

    /**
     * 获取运动员管理-个人信息管理详细信息
     */
    @Operation(summary = "获取运动员管理-个人信息管理详细信息")
    @PreAuthorize("@ss.hasPermi('athletes:athletesPersonalInfo:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsAthletePersonalInfoService.selectSportsAthletePersonalInfoById(id));
    }

    /**
     * 新增运动员管理-个人信息管理
     */
    @Operation(summary = "新增运动员管理-个人信息管理")
    @PreAuthorize("@ss.hasPermi('athletes:athletesPersonalInfo:add')")
    @Log(title = "运动员管理-个人信息管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsAthletePersonalInfo sportsAthletePersonalInfo)
    {
        return toAjax(sportsAthletePersonalInfoService.insertSportsAthletePersonalInfo(sportsAthletePersonalInfo));
    }

    /**
     * 修改运动员管理-个人信息管理
     */
    @Operation(summary = "修改运动员管理-个人信息管理")
    @PreAuthorize("@ss.hasPermi('athletes:athletesPersonalInfo:edit')")
    @Log(title = "运动员管理-个人信息管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsAthletePersonalInfo sportsAthletePersonalInfo)
    {
        return toAjax(sportsAthletePersonalInfoService.updateSportsAthletePersonalInfo(sportsAthletePersonalInfo));
    }

    /**
     * 删除运动员管理-个人信息管理
     */
    @Operation(summary = "删除运动员管理-个人信息管理")
    @PreAuthorize("@ss.hasPermi('athletes:athletesPersonalInfo:remove')")
    @Log(title = "运动员管理-个人信息管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsAthletePersonalInfoService.deleteSportsAthletePersonalInfoByIds(ids));
    }
}
